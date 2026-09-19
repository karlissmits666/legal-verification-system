param(
  [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)
$ErrorActionPreference = 'Stop'
$fail = @()
function Fail([string]$Message) { $script:fail += $Message }
function Read-Json([string]$Path) { return (Get-Content (Join-Path $RepoRoot $Path) -Raw | ConvertFrom-Json) }

$registryFiles = @(Get-ChildItem (Join-Path $RepoRoot 'registries') -Recurse -Filter '*.json')
$schemaFiles = @(Get-ChildItem (Join-Path $RepoRoot 'schemas') -Recurse -Filter '*.json')
$artifactIds = @{}
foreach ($file in @($registryFiles + $schemaFiles)) {
  try { $json = Get-Content $file.FullName -Raw | ConvertFrom-Json } catch { Fail ('Invalid JSON: ' + $file.FullName); continue }
  foreach ($key in @('artifact_id','artifact_version','artifact_kind','projection_status','normative_owners')) {
    if ($null -eq $json.$key) { Fail ('Missing metadata ' + $key + ' in ' + $file.Name) }
  }
  if ($json.projection_status -ne 'ACTIVE_PROJECTION') { Fail ('Non-active executable artefact: ' + $file.Name) }
  if ($artifactIds.ContainsKey([string]$json.artifact_id)) { Fail ('Duplicate artifact_id: ' + $json.artifact_id) } else { $artifactIds[[string]$json.artifact_id] = $file.FullName }
}

$types = Read-Json 'registries/traceability/trace_object_types.registry.json'
$prefixes = Read-Json 'registries/traceability/id_prefixes.registry.json'
$mapping = Read-Json 'registries/traceability/trace_object_id_fields.registry.json'
if (@($types.entries).Count -ne 19) { Fail 'TRACE OBJECT TYPE registry must contain 19 entries' }
if (@($prefixes.entries).Count -ne 19) { Fail 'ID PREFIX registry must contain 19 entries' }
if (@($mapping.entries).Count -ne 19) { Fail 'ID mapping must contain 19 entries' }
$typeCanonical = @($types.entries | ForEach-Object { $_.canonical })
if (@($typeCanonical | Sort-Object -Unique).Count -ne 19) { Fail 'Duplicate TRACE OBJECT TYPE value' }
foreach ($m in $mapping.entries) {
  $p = @($prefixes.entries | Where-Object { $_.trace_object_type -eq $m.trace_object_type })
  if ($p.Count -ne 1 -or $p[0].prefix -ne $m.id_prefix) { Fail ('Mapping/prefix mismatch: ' + $m.trace_object_type) }
  if ($typeCanonical -notcontains $m.trace_object_type) { Fail ('Mapping type missing from registry: ' + $m.trace_object_type) }
  $ownerPath = Join-Path $RepoRoot $m.owner_document
  if (-not (Test-Path $ownerPath)) {
    Fail ('Mapping owner file missing: ' + $m.owner_document)
  } else {
    $ownerText = Get-Content $ownerPath -Raw
    if ($ownerText -notmatch [regex]::Escape([string]$m.id_field_name)) { Fail ('ID field absent from owner: ' + $m.trace_object_type + ' / ' + $m.id_field_name) }
  }
}

$te = Get-Content (Join-Path $RepoRoot 'GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md') -Raw
$ps = Get-Content (Join-Path $RepoRoot 'GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md') -Raw
$tr = Get-Content (Join-Path $RepoRoot 'GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md') -Raw
$vp = Get-Content (Join-Path $RepoRoot 'GOVERNANCE/VERIFICATION_PROTOCOL_v1.md') -Raw
foreach ($e in $types.entries) {
  if ($te -notmatch [regex]::Escape([string]$e.canonical) -or $te -notmatch [regex]::Escape([string]$e.machine_key)) { Fail ('T&E TRACE OBJECT TYPE drift: ' + $e.canonical) }
}
foreach ($e in $prefixes.entries) {
  if ($te -notmatch [regex]::Escape([string]$e.trace_object_type) -or $te -notmatch [regex]::Escape([string]$e.prefix)) { Fail ('T&E ID PREFIX drift: ' + $e.trace_object_type) }
}

$semanticRegistryIds = @('registry.operation','registry.object','registry.module','registry.requirement_status','registry.verification_level','registry.requirement_level','registry.governance_status','registry.requirement_type','registry.module_status','registry.applicability_authority','registry.cif_status','registry.permission_status','registry.suspension_state')
foreach ($file in $registryFiles) {
  $json = Get-Content $file.FullName -Raw | ConvertFrom-Json
  foreach ($entry in @($json.entries)) {
    if ($entry.canonical -and $entry.machine_key) {
      if ($semanticRegistryIds -contains $json.artifact_id) { $ownerText = $ps + "`n" + $te }
      elseif ($json.artifact_id -like 'registry.verification_*') { $ownerText = $vp }
      else { $ownerText = $te + "`n" + $tr }
      if ($ownerText -notmatch [regex]::Escape([string]$entry.canonical)) { Fail ('Canonical value absent from owner: ' + $json.artifact_id + ' / ' + $entry.canonical) }
      if ($ownerText -notmatch [regex]::Escape([string]$entry.machine_key)) { Fail ('Machine key absent from owner: ' + $json.artifact_id + ' / ' + $entry.machine_key) }
    }
  }
}

$referenceRaw = Get-Content (Join-Path $RepoRoot 'schemas/traceability/trace_object_reference.schema.json') -Raw
foreach ($needle in @('trace_record_id','record_version','trace_object_type','trace_object_id','current','latest','oneOf')) {
  if ($referenceRaw -notmatch [regex]::Escape($needle)) { Fail ('Reference schema missing invariant token: ' + $needle) }
}
if ($tr -notmatch 'INTRA-RECORD REFERENCE' -or $tr -notmatch 'CROSS-RECORD REFERENCE') { Fail 'TR §5.1 reference modes missing' }
if ($te -notmatch 'INTRA-RECORD REFERENCE' -or $te -notmatch 'CROSS-RECORD REFERENCE') { Fail 'T&E §26.2 reference modes missing' }

foreach ($file in $schemaFiles) {
  $json = Get-Content $file.FullName -Raw | ConvertFrom-Json
  if ($json.x_trace_object_type) {
    $m = @($mapping.entries | Where-Object { $_.trace_object_type -eq $json.x_trace_object_type })
    if ($m.Count -ne 1) {
      Fail ('Schema type missing mapping: ' + $json.artifact_id)
    } else {
      $snake = ([string]$m[0].id_field_name).ToLower().Replace(' ','_')
      if ($json.x_id_field -ne $snake) { Fail ('Schema id field metadata mismatch: ' + $json.artifact_id + ' expected ' + $snake + ' got ' + $json.x_id_field) }
      if ($null -eq $json.properties.$snake) { Fail ('Schema missing mapped id property: ' + $json.artifact_id + ' / ' + $snake) }
    }
  }
}

$aliasPairs = @(
  @('GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md','GOVERNANCE/TRACEABILITY_RECORD_v1.md'),
  @('GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md','GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1.md')
)
foreach ($pair in $aliasPairs) {
  $a = (Get-FileHash (Join-Path $RepoRoot $pair[0]) -Algorithm SHA256).Hash
  $b = (Get-FileHash (Join-Path $RepoRoot $pair[1]) -Algorithm SHA256).Hash
  if ($a -ne $b) { Fail ('Frozen alias drift: ' + $pair[0] + ' != ' + $pair[1]) }
}

$temp = Join-Path ([IO.Path]::GetTempPath()) ('ws1-catalog-' + [guid]::NewGuid().ToString() + '.json')
& (Join-Path $RepoRoot 'TOOLS/build_ws1_catalog.ps1') -RepoRoot $RepoRoot -OutputPath $temp | Out-Null
$actual = Get-Content (Join-Path $RepoRoot 'catalog/schema_catalog.json') -Raw | ConvertFrom-Json
$regen = Get-Content $temp -Raw | ConvertFrom-Json
Remove-Item $temp -Force
$actualNorm = $actual | ConvertTo-Json -Depth 12 -Compress
$regenNorm = $regen | ConvertTo-Json -Depth 12 -Compress
if ($actualNorm -ne $regenNorm) { Fail 'schema_catalog.json is not reproducible from builder' }
foreach ($blocked in @($actual.entries | Where-Object { $_.projection_status -eq 'BLOCKED_BY_OWNER' })) {
  if ($null -ne $blocked.path) { Fail ('Blocked dependency has executable path: ' + $blocked.artifact_id) }
}

$fixtureRoot = Join-Path $RepoRoot 'TOOLS/fixtures/ws1'
function Test-Fixture([string]$Name,[bool]$Expected) {
  $f = Get-Content (Join-Path $fixtureRoot ($Name + '/fixture.json')) -Raw | ConvertFrom-Json
  $ok = $true
  if (@($f.artifact_ids | Sort-Object -Unique).Count -ne @($f.artifact_ids).Count) { $ok = $false }
  $mapped = @($f.mapping | ForEach-Object { $_.trace_object_type })
  foreach ($t in @($f.types)) { if ($mapped -notcontains $t) { $ok = $false } }
  $targets = @($f.objects | ForEach-Object { $_.id })
  foreach ($r in @($f.references)) { if ($targets -notcontains $r.target_id) { $ok = $false } }
  if ($ok -ne $Expected) { Fail ('Fixture unexpected result: ' + $Name) }
}
Test-Fixture 'valid_projection' $true
Test-Fixture 'invalid_duplicate_id' $false
Test-Fixture 'invalid_missing_mapping' $false
Test-Fixture 'invalid_unresolved_ref' $false

$frozen = @('GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md','GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md','GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md','GOVERNANCE/VERIFICATION_PROTOCOL_v1.md')
$changed = @(& git -C $RepoRoot diff --name-only HEAD^ HEAD -- $frozen)
if ($LASTEXITCODE -ne 0) { Fail 'Unable to check frozen diff' }
if ($changed.Count -gt 0) { Fail ('Frozen owner changed in WS1 implementation commit: ' + ($changed -join ', ')) }

if ($fail.Count -gt 0) {
  foreach ($message in $fail) { Write-Error $message }
  exit 1
}
Write-Output 'WS1 CONTRACT LAYER VALIDATION: PASS'
