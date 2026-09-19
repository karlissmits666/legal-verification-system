param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [switch]$SkipFixtureSuite
)
$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure { param([string]$Message) $failures.Add($Message) }
function Read-Json { param([string]$RelativePath) Get-Content (Join-Path $RepoRoot $RelativePath) -Raw | ConvertFrom-Json }

function Get-SectionNumber {
    param([string]$Reference)
    $match = [regex]::Match($Reference,'§{1,2}(\d+(?:\.\d+)?)')
    if ($match.Success) { return $match.Groups[1].Value }
    return $null
}
function Get-MarkdownSection {
    param([string]$Path,[string]$Reference)
    if (-not (Test-Path $Path)) { return $null }
    $number = Get-SectionNumber $Reference
    if (-not $number) { return $null }

    $lines = Get-Content $Path
    $start = -1
    $targetDepth = ($number -split '\.').Count

    for ($i=0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '^(?:#{1,6}\s+)?(\d+(?:\.\d+)*)\.(?:\s|$)' -and $Matches[1] -eq $number) {
            $start = $i
            break
        }
    }

    if ($start -lt 0) { return $null }

    $output = [System.Collections.Generic.List[string]]::new()
    for ($i=$start; $i -lt $lines.Count; $i++) {
        if ($i -gt $start -and $lines[$i] -match '^(?:#{1,6}\s+)?(\d+(?:\.\d+)*)\.(?:\s|$)') {
            $candidateDepth = ($Matches[1] -split '\.').Count
            if ($candidateDepth -le $targetDepth) { break }
        }
        $output.Add($lines[$i])
    }

    $output -join [Environment]::NewLine
}
function Test-SectionReference {
    param([string]$Path,[string]$Reference)
    $numbers = @([regex]::Matches($Reference,'\d+(?:\.\d+)?') | ForEach-Object { $_.Value })
    if ($numbers.Count -eq 0) { return (Get-Content $Path -Raw).Contains($Reference) }
    foreach ($number in $numbers) {
        if (-not (Get-MarkdownSection $Path ('§'+$number))) { return $false }
    }
    return $true
}
function Get-MarkdownEnumPairs {
    param([string]$Section)
    $pairs=@()
    foreach ($line in @($Section -split '\r?\n')) {
        if ($line -notmatch '^\|') { continue }
        $cells=@($line.Trim('|') -split '\|' | ForEach-Object { $_.Trim().Trim([char]96) })
        if ($cells.Count -lt 2 -or $cells[0] -eq 'Canonical' -or $cells[0] -match '^[- ]+$') { continue }
        if ($cells[1] -match '^[a-z0-9_]+$') {
            $pairs += [pscustomobject]@{canonical=$cells[0];machine_key=$cells[1]}
        }
    }
    @($pairs)
}
function Test-SetEqual {
    param($Left,$Right)
    $a=@($Left | ForEach-Object {[string]$_} | Sort-Object -Unique)
    $b=@($Right | ForEach-Object {[string]$_} | Sort-Object -Unique)
    if ($a.Count -ne $b.Count) { return $false }
    for ($i=0; $i -lt $a.Count; $i++) { if ($a[$i] -ne $b[$i]) { return $false } }
    return $true
}
function Compare-Pairs {
    param([string]$ArtifactId,$RegistryEntries,$OwnerPairs)
    $registrySet=@($RegistryEntries | ForEach-Object {([string]$_.canonical)+'|'+([string]$_.machine_key)})
    $ownerSet=@($OwnerPairs | ForEach-Object {([string]$_.canonical)+'|'+([string]$_.machine_key)})
    if (-not (Test-SetEqual $registrySet $ownerSet)) { Add-Failure ($ArtifactId+' owner/registry 1:1 drift') }
}
function Get-Bindings {
    @{
        operation='registry.operation'; object='registry.object'; contract_type='registry.contract_type'
        module='registry.module'; module_status='registry.module_status'; applicability_authority='registry.applicability_authority'
        requirement_level='registry.requirement_level'; governance_status='registry.governance_status'
        requirement_type='registry.requirement_type'; requirement_status='registry.requirement_status'
        verification_level='registry.verification_level'; resulting_verification_level='registry.verification_level'
        decision_type='registry.human_decision_type'; suspension_state='registry.suspension_state'
        verification_methods='registry.verification_method'; result='registry.verification_result'
        source_type='registry.source_type'; content_hash_algorithm='registry.content_hash_algorithm'
        permission_status='registry.permission_status'; trace_object_type='registry.trace_object_types'
        target_object_type='registry.trace_object_types'
    }
}
function Get-EnumValues {
    param($Property)
    if ($null -ne $Property.enum) { return @($Property.enum | Where-Object {$null -ne $_}) }
    if ($Property.items -and $null -ne $Property.items.enum) { return @($Property.items.enum | Where-Object {$null -ne $_}) }
    @()
}

$registryFiles=@(Get-ChildItem (Join-Path $RepoRoot 'registries') -Recurse -Filter '*.json')
$schemaFiles=@(Get-ChildItem (Join-Path $RepoRoot 'schemas') -Recurse -Filter '*.json')
$artifactIds=@{}

foreach ($file in @($registryFiles+$schemaFiles)) {
    try { $json=Get-Content $file.FullName -Raw | ConvertFrom-Json }
    catch { Add-Failure ('Invalid JSON: '+$file.FullName); continue }

    foreach ($key in @('artifact_id','artifact_version','artifact_kind','projection_status','normative_owners')) {
        if ($null -eq $json.$key) { Add-Failure ('Missing metadata '+$key+' in '+$file.Name) }
    }
    if ($json.projection_status -ne 'ACTIVE_PROJECTION') { Add-Failure ('Non-active executable artefact: '+$file.Name) }
    if ($artifactIds.ContainsKey([string]$json.artifact_id)) { Add-Failure ('Duplicate artifact_id: '+$json.artifact_id) }
    else { $artifactIds[[string]$json.artifact_id]=$file.FullName }

    foreach ($owner in @($json.normative_owners)) {
        $ownerPath=Join-Path $RepoRoot $owner.document
        if (-not (Test-Path $ownerPath)) { Add-Failure ('normative owner missing: '+$json.artifact_id+' -> '+$owner.document); continue }
        foreach ($section in @($owner.sections)) {
            if (-not (Test-SectionReference $ownerPath ([string]$section))) {
                Add-Failure ('normative owner section missing: '+$json.artifact_id+' -> '+$section)
            }
        }
    }
}

$types=Read-Json 'registries/traceability/trace_object_types.registry.json'
$prefixes=Read-Json 'registries/traceability/id_prefixes.registry.json'
$mapping=Read-Json 'registries/traceability/trace_object_id_fields.registry.json'
$tePath=Join-Path $RepoRoot 'GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md'

Compare-Pairs 'registry.trace_object_types' $types.entries (Get-MarkdownEnumPairs (Get-MarkdownSection $tePath '§25'))

$prefixOwner=@()
foreach ($line in @((Get-MarkdownSection $tePath '§26') -split '\r?\n')) {
    if ($line -notmatch '^\|') { continue }
    $cells=@($line.Trim('|') -split '\|' | ForEach-Object {$_.Trim().Trim([char]96)})
    if ($cells.Count -ge 2 -and $cells[1] -match '^[A-Z]+-$') { $prefixOwner += ($cells[0]+'|'+$cells[1]) }
}
$prefixRegistry=@($prefixes.entries | ForEach-Object {([string]$_.trace_object_type)+'|'+([string]$_.prefix)})
if (-not (Test-SetEqual $prefixRegistry $prefixOwner)) { Add-Failure 'T&E §26 ↔ ID PREFIX registry drift' }

$typeCanonical=@($types.entries | ForEach-Object {$_.canonical})
foreach ($entry in $mapping.entries) {
    $prefixMatch=@($prefixes.entries | Where-Object {$_.trace_object_type -eq $entry.trace_object_type})
    if ($prefixMatch.Count -ne 1 -or $prefixMatch[0].prefix -ne $entry.id_prefix) { Add-Failure ('Mapping/prefix mismatch: '+$entry.trace_object_type) }
    if ($typeCanonical -notcontains $entry.trace_object_type) { Add-Failure ('Mapping type missing: '+$entry.trace_object_type) }
    $ownerSection=Get-MarkdownSection (Join-Path $RepoRoot $entry.owner_document) $entry.owner_section
    if (-not $ownerSection -or $ownerSection -notmatch [regex]::Escape([string]$entry.id_field_name)) {
        Add-Failure ('Mapped ID field absent from owner section: '+$entry.trace_object_type)
    }
}

foreach ($file in $registryFiles) {
    $json=Get-Content $file.FullName -Raw | ConvertFrom-Json
    if (-not $json.entries -or -not $json.controlled_field -or $json.artifact_id -in @('registry.blocked_dependencies','registry.id_prefixes','registry.trace_object_id_fields')) { continue }

    if ($json.artifact_id -eq 'registry.verification_method') {
        $vpPath=Join-Path $RepoRoot 'GOVERNANCE/VERIFICATION_PROTOCOL_v1.md'
        $vpRaw=Get-Content $vpPath -Raw
        $ownerPairs=@(
            [regex]::Matches($vpRaw,'(?m)^5\.[123]\.\s+(HUMAN_[A-Z0-9_]+)\s*$') |
                ForEach-Object {
                    [pscustomobject]@{
                        canonical=$_.Groups[1].Value
                        machine_key=$_.Groups[1].Value.ToLower()
                    }
                }
        )
        Compare-Pairs $json.artifact_id $json.entries $ownerPairs

        $lifecycleSection=Get-MarkdownSection $vpPath '§17'
        foreach ($entry in $json.entries) {
            $expectedLine='(?m)^\s*'+[regex]::Escape([string]$entry.machine_key)+'\s+→\s+ACTIVE\s*$'
            if ($lifecycleSection -notmatch $expectedLine -or $entry.lifecycle -ne 'active') {
                Add-Failure ('verification_method lifecycle drift: '+$entry.canonical)
            }
        }
        continue
    }

    if ($json.artifact_id -eq 'registry.verification_result') {
        $section=Get-MarkdownSection (Join-Path $RepoRoot 'GOVERNANCE/VERIFICATION_PROTOCOL_v1.md') '§12'
        $ownerPairs=@()
        foreach ($entry in $json.entries) {
            $pattern='(?m)^\s*'+[regex]::Escape([string]$entry.canonical)+'\s+'+[regex]::Escape([string]$entry.machine_key)+'(?:\s|$)'
            if ($section -match $pattern) { $ownerPairs += [pscustomobject]@{canonical=$entry.canonical;machine_key=$entry.machine_key} }
        }
        Compare-Pairs $json.artifact_id $json.entries $ownerPairs
        continue
    }

    $owner=@($json.normative_owners | Where-Object {$_.role -eq 'representation_owner'}) | Select-Object -First 1
    if (-not $owner) { $owner=@($json.normative_owners | Where-Object {$_.role -eq 'semantic_owner'}) | Select-Object -First 1 }
    if (-not $owner) { Add-Failure ('No owner for controlled registry: '+$json.artifact_id); continue }

    $ownerSection=Get-MarkdownSection (Join-Path $RepoRoot $owner.document) ([string]@($owner.sections)[0])
    if (-not $ownerSection) { Add-Failure ('Cannot extract owner section: '+$json.artifact_id); continue }
    Compare-Pairs $json.artifact_id $json.entries (Get-MarkdownEnumPairs $ownerSection)
}

$bindings=Get-Bindings
$registryById=@{}
foreach ($file in $registryFiles) {
    $json=Get-Content $file.FullName -Raw | ConvertFrom-Json
    $registryById[[string]$json.artifact_id]=$json
}
$schemaById=@{}
$allSchemas=@()
foreach ($file in $schemaFiles) {
    $json=Get-Content $file.FullName -Raw | ConvertFrom-Json
    $schemaById[[string]$json.'$id']=$json
    $allSchemas += $json
}

foreach ($file in $schemaFiles) {
    $raw=Get-Content $file.FullName -Raw
    $json=$raw | ConvertFrom-Json

    if ($json.x_trace_object_type) {
        $mapEntry=@($mapping.entries | Where-Object {$_.trace_object_type -eq $json.x_trace_object_type})
        if ($mapEntry.Count -ne 1) { Add-Failure ('Schema type missing mapping: '+$json.artifact_id) }
        else {
            $idField=([string]$mapEntry[0].id_field_name).ToLower().Replace(' ','_')
            $property=$json.properties.$idField
            if ($json.x_id_field -ne $idField -or $null -eq $property) { Add-Failure ('Schema ID-field mismatch: '+$json.artifact_id) }
            else {
                $normalized=([string]$property.pattern).Replace('\','')
                if (-not $normalized.StartsWith('^'+[string]$mapEntry[0].id_prefix)) { Add-Failure ('Schema ID prefix mismatch: '+$json.artifact_id) }
            }
        }
    }

    if ($json.properties) {
        foreach ($property in $json.properties.PSObject.Properties) {
            if (-not $bindings.ContainsKey($property.Name)) { continue }
            $registryId=$bindings[$property.Name]
            if (-not $registryById.ContainsKey($registryId)) { Add-Failure ('Schema binding registry missing: '+$json.artifact_id+' / '+$registryId); continue }
            $schemaValues=Get-EnumValues $property.Value
            $registryValues=@($registryById[$registryId].entries | ForEach-Object {$_.machine_key})
            if (-not (Test-SetEqual $schemaValues $registryValues)) { Add-Failure ('Schema enum drift: '+$json.artifact_id+' / '+$property.Name+' ↔ '+$registryId) }
        }
    }

    foreach ($match in [regex]::Matches($raw,'"\$ref"\s*:\s*"([^"]+)"')) {
        $reference=$match.Groups[1].Value
        if (-not $schemaById.ContainsKey($reference)) { Add-Failure ('Unresolved $ref: '+$json.artifact_id+' -> '+$reference) }
    }
}

$requiredRefs=@(
    @('schema.module_record','classification_assessment_references'),
    @('schema.requirement_result_record','classification_basis_references'),
    @('schema.human_decision_record','related_trace_object_references'),
    @('schema.human_decision_record','assignment_authority_basis_source_reference'),
    @('schema.unresolved_issue_record','related_trace_object_references'),
    @('schema.unresolved_issue_record','action_owner_basis_reference'),
    @('schema.unresolved_issue_record','resolution_authority_basis_reference')
)
foreach ($expectation in $requiredRefs) {
    $schema=@($allSchemas | Where-Object {$_.artifact_id -eq $expectation[0]}) | Select-Object -First 1
    $propertyJson=$schema.properties.($expectation[1]) | ConvertTo-Json -Depth 20 -Compress
    if ($propertyJson -notmatch [regex]::Escape('urn:legal-verification-system:schema.trace_object_reference')) {
        Add-Failure ('Pinned reference disconnected: '+$expectation[0]+' / '+$expectation[1])
    }
}

$referenceSchema=Read-Json 'schemas/traceability/trace_object_reference.schema.json'
foreach ($type in $types.entries) {
    $prefixEntry=@($prefixes.entries | Where-Object {$_.trace_object_type -eq $type.canonical}) | Select-Object -First 1
    $found=$false
    foreach ($rule in @($referenceSchema.allOf)) {
        if ($rule.if.properties.trace_object_type.const -eq $type.machine_key) {
            $pattern=([string]$rule.then.properties.trace_object_id.pattern).Replace('\','')
            if ($pattern.StartsWith('^'+[string]$prefixEntry.prefix)) { $found=$true }
        }
    }
    if (-not $found) { Add-Failure ('Reference TYPE↔prefix rule missing: '+$type.machine_key) }
}

$blockedRegistry=Read-Json 'registries/blocked_dependencies.registry.json'
$blockedTypes=@($blockedRegistry.entries | ForEach-Object {$_.trace_object_type})
foreach ($schema in $allSchemas) {
    if ($schema.x_trace_object_type -and $blockedTypes -contains $schema.x_trace_object_type) {
        Add-Failure ('BLOCKED_BY_OWNER type has executable schema: '+$schema.artifact_id)
    }
}

$manifest=Read-Json 'catalog/frozen_baseline_fingerprints.json'
if ($manifest.algorithm -ne 'SHA-256') { Add-Failure 'Frozen baseline fingerprint algorithm must be SHA-256' }
foreach ($entry in $manifest.files) {
    $path=Join-Path $RepoRoot $entry.path
    if (-not (Test-Path $path)) { Add-Failure ('Frozen baseline file missing: '+$entry.path); continue }
    $actual=(Get-FileHash $path -Algorithm SHA256).Hash.ToLower()
    if ($actual -ne ([string]$entry.sha256).ToLower()) { Add-Failure ('Frozen baseline fingerprint drift: '+$entry.path) }
}

$tempCatalog=Join-Path ([IO.Path]::GetTempPath()) ('ws1-catalog-'+[guid]::NewGuid().ToString()+'.json')
& (Join-Path $RepoRoot 'TOOLS/build_ws1_catalog.ps1') -RepoRoot $RepoRoot -OutputPath $tempCatalog | Out-Null
$actualCatalog=Get-Content (Join-Path $RepoRoot 'catalog/schema_catalog.json') -Raw | ConvertFrom-Json
$regenCatalog=Get-Content $tempCatalog -Raw | ConvertFrom-Json
Remove-Item $tempCatalog -Force
function Convert-CatalogToCanonicalJson {
    param($Catalog)

    $canonicalEntries=@(
        $Catalog.entries |
            Sort-Object artifact_id |
            ForEach-Object {
                $owners=@(
                    $_.normative_owners |
                        ForEach-Object {
                            [ordered]@{
                                document=$_.document
                                version=$_.version
                                sections=@($_.sections)
                                role=$_.role
                            }
                        }
                )
                $missingOwners=@(
                    $_.missing_owner_dependencies |
                        ForEach-Object {
                            [ordered]@{
                                expected_document=$_.expected_document
                                expected_owner=$_.expected_owner
                                status=$_.status
                            }
                        }
                )
                [ordered]@{
                    artifact_id=$_.artifact_id
                    artifact_kind=$_.artifact_kind
                    artifact_version=$_.artifact_version
                    projection_status=$_.projection_status
                    path=$_.path
                    trace_object_type=$_.trace_object_type
                    id_field=$_.id_field
                    normative_owners=$owners
                    missing_owner_dependencies=$missingOwners
                    dependencies=@($_.dependencies)
                }
            }
    )

    $canonical=[ordered]@{
        catalog_version=$Catalog.catalog_version
        generated_from=$Catalog.generated_from
        entries=$canonicalEntries
    }
    return ($canonical | ConvertTo-Json -Depth 30 -Compress)
}

$actualNormalized=Convert-CatalogToCanonicalJson $actualCatalog
$regenNormalized=Convert-CatalogToCanonicalJson $regenCatalog
if ($actualNormalized -ne $regenNormalized) {
    Add-Failure 'schema_catalog.json full canonical content is not reproducible'
}
$catalogIds=@($actualCatalog.entries | ForEach-Object {$_.artifact_id})
if (@($catalogIds | Sort-Object -Unique).Count -ne $catalogIds.Count) { Add-Failure 'schema_catalog.json contains duplicate artifact_id' }
foreach ($blocked in @($actualCatalog.entries | Where-Object {$_.projection_status -eq 'BLOCKED_BY_OWNER'})) {
    if ($null -ne $blocked.path) { Add-Failure ('Blocked dependency has executable path: '+$blocked.artifact_id) }
}

if (-not $SkipFixtureSuite) {
    $fixtureFiles=@(Get-ChildItem (Join-Path $RepoRoot 'TOOLS/fixtures/ws1') -Recurse -Filter 'fixture.json' | Sort-Object FullName)
    foreach ($fixtureFile in $fixtureFiles) {
        $fixture=Get-Content $fixtureFile.FullName -Raw | ConvertFrom-Json
        $tempRepo=Join-Path ([IO.Path]::GetTempPath()) ('ws1-fixture-'+[guid]::NewGuid().ToString())
        New-Item -ItemType Directory -Path $tempRepo -Force | Out-Null
        Copy-Item (Join-Path $RepoRoot '*') $tempRepo -Recurse -Force

        switch ([string]$fixture.mutation) {
            'none' {}
            'duplicate_artifact_id' {
                Copy-Item (Join-Path $tempRepo 'registries/enums/operation.registry.json') (Join-Path $tempRepo 'registries/enums/_duplicate.registry.json')
            }
            'missing_owner_value' {
                $path=Join-Path $tempRepo 'registries/enums/operation.registry.json'
                $json=Get-Content $path -Raw | ConvertFrom-Json
                $json.entries=@($json.entries | Select-Object -First 4)
                $json | ConvertTo-Json -Depth 20 | Set-Content $path
            }
            'cross_registry_contamination' {
                $path=Join-Path $tempRepo 'registries/enums/operation.registry.json'
                $json=Get-Content $path -Raw | ConvertFrom-Json
                $json.entries[0].canonical='ALLOWED'
                $json.entries[0].machine_key='allowed'
                $json | ConvertTo-Json -Depth 20 | Set-Content $path
            }
            'schema_enum_drift' {
                $path=Join-Path $tempRepo 'schemas/traceability/task_record.schema.json'
                $json=Get-Content $path -Raw | ConvertFrom-Json
                $json.properties.operation.enum += 'approve'
                $json | ConvertTo-Json -Depth 30 | Set-Content $path
            }
            'type_prefix_mismatch' {
                $path=Join-Path $tempRepo 'schemas/traceability/task_record.schema.json'
                $json=Get-Content $path -Raw | ConvertFrom-Json
                $json.properties.task_id.pattern='^MOD-[^\s]+$'
                $json | ConvertTo-Json -Depth 30 | Set-Content $path
            }
            'executable_blocked_schema' {
                $source=Join-Path $tempRepo 'schemas/traceability/task_record.schema.json'
                $destination=Join-Path $tempRepo 'schemas/traceability/_blocked_output.schema.json'
                $json=Get-Content $source -Raw | ConvertFrom-Json
                $json.artifact_id='schema.output_record'
                $json.'$id'='urn:legal-verification-system:schema.output_record'
                $json.x_trace_object_type='OUTPUT'
                $json.x_id_field='output_id'
                $json | ConvertTo-Json -Depth 30 | Set-Content $destination
            }
            'broken_ref' {
                $path=Join-Path $tempRepo 'schemas/traceability/module_record.schema.json'
                $json=Get-Content $path -Raw | ConvertFrom-Json
                $json.properties.classification_assessment_references.items.allOf[0].'$ref'='urn:legal-verification-system:schema.missing'
                $json | ConvertTo-Json -Depth 30 | Set-Content $path
            }
            'catalog_metadata_drift' {
                $path=Join-Path $tempRepo 'catalog/schema_catalog.json'
                $json=Get-Content $path -Raw | ConvertFrom-Json
                $json.entries[0].artifact_version='9.9.9'
                $json | ConvertTo-Json -Depth 30 | Set-Content $path
            }
            'frozen_baseline_hash_drift' {
                Add-Content (Join-Path $tempRepo 'GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md') 'fixture drift'
            }
            default {
                Add-Failure ('Unknown fixture mutation: '+$fixture.mutation)
                Remove-Item $tempRepo -Recurse -Force
                continue
            }
        }

        & pwsh -NoProfile -File (Join-Path $tempRepo 'TOOLS/validate_ws1_contract_layer.ps1') -RepoRoot $tempRepo -SkipFixtureSuite *> $null
        $passed=($LASTEXITCODE -eq 0)
        $expected=([string]$fixture.expected).ToUpper()

        if (($expected -eq 'PASS' -and -not $passed) -or ($expected -eq 'FAIL' -and $passed)) {
            Add-Failure ('Integration fixture unexpected result: '+$fixture.name)
        }
        Remove-Item $tempRepo -Recurse -Force
    }
}

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) { Write-Error $failure }
    Write-Output "WS1 CONTRACT LAYER VALIDATION: FAIL ($($failures.Count) errors)"
    exit 1
}
Write-Output 'WS1 CONTRACT LAYER VALIDATION: PASS'
exit 0
