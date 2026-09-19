param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [string]$OutputPath = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot '..')).Path 'catalog/schema_catalog.json')
)
$ErrorActionPreference = 'Stop'

function Read-Json {
    param([string]$RelativePath)
    Get-Content (Join-Path $RepoRoot $RelativePath) -Raw | ConvertFrom-Json
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
function Get-Dependencies {
    param($Json,[string]$Raw)
    $deps = [System.Collections.Generic.HashSet[string]]::new()
    $bindings = Get-Bindings
    if ($Json.properties) {
        foreach ($property in $Json.properties.PSObject.Properties) {
            if ($bindings.ContainsKey($property.Name)) { [void]$deps.Add($bindings[$property.Name]) }
        }
    }
    foreach ($match in [regex]::Matches($Raw, '"\$ref"\s*:\s*"([^"]+)"')) {
        $urn = $match.Groups[1].Value
        if ($urn -match '^urn:legal-verification-system:(.+)$') { [void]$deps.Add($Matches[1]) }
    }
    @($deps | Sort-Object)
}

$items = @()
foreach ($root in @('registries','schemas')) {
    Get-ChildItem (Join-Path $RepoRoot $root) -Recurse -Filter '*.json' | Sort-Object FullName | ForEach-Object {
        $raw = Get-Content $_.FullName -Raw
        $json = $raw | ConvertFrom-Json
        $relativePath = [IO.Path]::GetRelativePath($RepoRoot,$_.FullName).Replace('\','/')
        $items += [ordered]@{
            artifact_id=$json.artifact_id
            artifact_kind=$json.artifact_kind
            artifact_version=$json.artifact_version
            projection_status=$json.projection_status
            path=$relativePath
            trace_object_type=$json.x_trace_object_type
            id_field=$json.x_id_field
            normative_owners=@($json.normative_owners)
            missing_owner_dependencies=@()
            dependencies=@(Get-Dependencies -Json $json -Raw $raw)
        }
    }
}
$blockedRegistry = Read-Json 'registries/blocked_dependencies.registry.json'
foreach ($blocked in @($blockedRegistry.entries)) {
    $items += [ordered]@{
        artifact_id=$blocked.artifact_id
        artifact_kind=$blocked.artifact_kind
        artifact_version=$blocked.artifact_version
        projection_status=$blocked.projection_status
        path=$null
        trace_object_type=$blocked.trace_object_type
        id_field=$blocked.id_field
        normative_owners=@($blocked.normative_owners)
        missing_owner_dependencies=@($blocked.missing_owner_dependencies)
        dependencies=@($blocked.activation_condition)
    }
}
$output = [ordered]@{
    catalog_version='0.2.0'
    generated_from='WS1 artefact metadata + registries/blocked_dependencies.registry.json'
    entries=@($items | Sort-Object artifact_id)
}
$jsonText = $output | ConvertTo-Json -Depth 20
$outputDirectory = Split-Path $OutputPath -Parent
if ($outputDirectory -and -not (Test-Path $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
}
[IO.File]::WriteAllText($OutputPath,$jsonText+[Environment]::NewLine,[Text.UTF8Encoding]::new($false))
Write-Output ('WS1 catalog generated: '+$OutputPath)
