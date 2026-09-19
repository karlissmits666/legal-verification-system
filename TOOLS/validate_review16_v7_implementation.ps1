param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
$failures = @()
$passes = @()

function Pass([string]$m) { $script:passes += $m }
function Fail([string]$m) { $script:failures += $m }
function ReadRepo([string]$p) { Get-Content -LiteralPath (Join-Path $RepoRoot $p) -Raw -Encoding UTF8 }

$tr = ReadRepo 'GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md'
$te = ReadRepo 'GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md'
$response = ReadRepo 'GOVERNANCE/TRACEABILITY_ISS_INSTANTIATION_REVIEW16_R1_R5_RESPONSE.md'
$amendment = ReadRepo 'GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md'

$rmt1Files = @(
'GOVERNANCE/PROFESSIONAL_SCOPE_v1.4.md',
'GOVERNANCE/TRACEABILITY_RECORD_v1_v0.6.md',
'GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.4.md',
'GOVERNANCE/REQUIREMENTS_MATRIX_GOVERNANCE_v1.md',
'GOVERNANCE/OPERATION_WORKFLOWS_v1.md',
'GOVERNANCE/LEGAL_RESEARCH_METHOD_v1.md',
'GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md',
'GOVERNANCE/OUTSOURCING_EBA_MODULE_TRIGGER_SET_v0.1.md',
'GOVERNANCE/LEGAL_CLASSIFICATION_BASELINE_AMENDMENT_v0.2.md'
)
foreach($p in $rmt1Files){
  $c=ReadRepo $p
  if($c -match 'MTR-[A-Z][A-Z0-9_-]+-\d+') { Fail "RMT1 semantic MTR identifier remains in $p" }
}
if(-not ($failures | Where-Object { $_ -like 'RMT1*' })) { Pass 'RMT1 opaque MTR identifiers only in active file set.' }

if($tr.Contains('Atsauce tiek glabāta vienā no diviem režīmiem.') -and
   $te.Contains('Atsauce tiek glabāta vienā no diviem režīmiem.') -and
   $tr.Contains('Nepilnīga cross-record reference ir INVALID.') -and
   $te.Contains('Nepilnīga cross-record reference ir INVALID.')) {
  Pass 'RMT2 intra/cross reference model present in both owners.'
} else { Fail 'RMT2 reference model missing or inconsistent.' }

$mapStart=$te.IndexOf('### 30.1. TRACE OBJECT TYPE → ID FIELD MAPPING')
$mapEnd=$te.IndexOf([Environment]::NewLine + '## 31.',$mapStart)
if($mapStart -lt 0 -or $mapEnd -lt 0){ Fail 'RMT3 mapping section missing.' }
else {
  $map=$te.Substring($mapStart,$mapEnd-$mapStart)
  $rows=[regex]::Matches($map,'(?m)^\| (TASK|SOURCE|MODULE|FINDING|EVIDENCE|REQUIREMENTS SET|REQUIREMENT|REQUIREMENT COMPONENT|VERIFICATION EVENT|VERIFICATION SCOPE RECORD|LEGAL CLASSIFICATION ASSESSMENT|MODULE SCREENING RECORD|MODULE TRIGGER SET|HUMAN DECISION|ESCALATION|UNRESOLVED ISSUE|OUTPUT|DATA CLASS EVENT|TRACE RECORD) \|')
  if($rows.Count -eq 19){ Pass 'RMT3 has exactly 19 trace-object ID mapping rows.' } else { Fail "RMT3 expected 19 mapping rows, found $($rows.Count)." }
}

$ownerFields=@('TASK ID','SOURCE ID','MODULE ID','FINDING ID','EVIDENCE ID','REQUIREMENTS SET ID','REQUIREMENT ID','COMPONENT ID','VERIFICATION EVENT ID','VERIFICATION SCOPE RECORD ID','LEGAL CLASSIFICATION ASSESSMENT ID','MODULE SCREENING RECORD ID','DECISION ID','ESCALATION ID','ISSUE ID','OUTPUT ID','EVENT ID','TRACE RECORD ID')
foreach($field in $ownerFields){ if(-not $tr.Contains($field)){ Fail "RMT3 owner field absent from TR: $field" } }
$mtr=ReadRepo 'GOVERNANCE/MODULE_TRIGGER_REGISTRY_v1.md'
if(-not $mtr.Contains('TRIGGER SET ID')){ Fail 'RMT3 MODULE TRIGGER SET owner field absent.' }
if(-not ($failures | Where-Object { $_ -like 'RMT3*' })) { Pass 'RMT3 mapped owner fields exist.' }

if($response.Contains('simbols pats par sevi nav relationship-candidate pazīme.') -and
   -not $response.Contains('slash-composite relationship labels in persisted schema')) {
  Pass 'RMT4 slash-composite ambiguity removed.'
} else { Fail 'RMT4 slash-composite criterion still active or rule missing.' }

if($response.Contains('| §8 | CLASSIFICATION ASSESSMENT REFERENCES | TREF-INTRA | LCA |') -and
   -not $response.Contains('| §8 | LEGAL CLASSIFICATION ASSESSMENT | TREF-INTRA |')) {
  Pass 'RMT4 MODULE→LCA classification has one persisted source.'
} else { Fail 'RMT4 MODULE→LCA classification inconsistent.' }

function Test-Ref($r,[bool]$cross){
  if(-not $r.ContainsKey('OBJECT TYPE') -or -not $r.ContainsKey('OBJECT ID')) { return $false }
  if($cross -and (-not $r.ContainsKey('TRACE RECORD ID') -or -not $r.ContainsKey('RECORD VERSION'))) { return $false }
  return $true
}
if(-not (Test-Ref @{'OBJECT TYPE'='SOURCE'} $false)){ Pass 'N1 missing OBJECT ID rejected.' } else { Fail 'N1 failed.' }
if(-not (Test-Ref @{'OBJECT TYPE'='SOURCE';'OBJECT ID'='SRC-1';'RECORD VERSION'='1'} $true)){ Pass 'N3 missing TRACE RECORD ID rejected.' } else { Fail 'N3 failed.' }
if(-not (Test-Ref @{'OBJECT TYPE'='SOURCE';'OBJECT ID'='SRC-1';'TRACE RECORD ID'='TR-1'} $true)){ Pass 'N4 missing RECORD VERSION rejected.' } else { Fail 'N4 failed.' }

$prefix=@{SOURCE='SRC-';'HUMAN DECISION'='DEC-';TASK='TASK-';OUTPUT='OUT-'}
function Prefix-Ok($type,$id){ return $prefix.ContainsKey($type) -and $id.StartsWith($prefix[$type]) }
if(-not (Prefix-Ok 'SOURCE' 'DEC-1')){ Pass 'N2 prefix/type mismatch rejected.' } else { Fail 'N2 failed.' }

if($tr.Contains('vienīgais autoritatīvais attiecību avots') -and $tr.Contains('HUMAN DECISION RECORD ir INVALID')) { Pass 'N6 compatibility conflict invariant implemented.' } else { Fail 'N6 invariant missing.' }
if($tr.Contains('referenced HUMAN DECISION obligāti satur ASSIGNMENT AUTHORITY BASIS SOURCE REFERENCE')) { Pass 'N7 authority-basis invariant implemented.' } else { Fail 'N7 invariant missing.' }

if($tr.Contains('ORIGIN TASK REFERENCE') -and $tr.Contains('ORIGIN OUTPUT REFERENCE') -and $tr.Contains('RECORD VERSION')) { Pass 'N9 PRIOR TASK OUTPUT pinned references implemented.' } else { Fail 'N9 invariant missing.' }

if($te.Contains('IF CONTENT HASH is present') -and $te.Contains('THEN CONTENT HASH ALGORITHM is required')) { Pass 'N10 hash/algorithm invariant present.' } else { Fail 'N10 invariant missing.' }
if($tr.Contains('Ja redakciju nevar pietiekami identificēt') -and $tr.Contains('UNRESOLVED ISSUE')) { Pass 'N11 insufficient identity requires UNRESOLVED ISSUE.' } else { Fail 'N11 invariant missing.' }

if($amendment.Contains('TRACEABILITY_RECORD_v1 v0.6 freeze nav pieļaujams') -and $amendment.Contains('PROFESSIONAL_SCOPE_v1.4 un TERMINOLOGY_AND_ENUMS_v1 v0.4 freeze')) { Pass 'FP1 freeze dependency implemented.' } else { Fail 'FP1 freeze dependency missing.' }

foreach($p in $passes){ Write-Output "[PASS] $p" }
foreach($f in $failures){ Write-Output "[FAIL] $f" }
if($failures.Count -gt 0){
  Write-Output "REVIEW16 V7 IMPLEMENTATION VALIDATION: FAIL ($($failures.Count) errors)"
  exit 1
}
Write-Output "REVIEW16 V7 IMPLEMENTATION VALIDATION: PASS"
