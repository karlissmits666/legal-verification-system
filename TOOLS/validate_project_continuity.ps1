param(
    [ValidateSet('Static', 'Handoff')]
    [string]$Mode = 'Handoff',

    [string]$RepoPath = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()
$passes = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) {
    $failures.Add($Message)
}

function Add-Pass([string]$Message) {
    $passes.Add($Message)
}

try {
    $resolvedRepo = (Resolve-Path -LiteralPath $RepoPath).Path
    $rootOutput = @(& git -C $resolvedRepo rev-parse --show-toplevel 2>$null)
    if ($LASTEXITCODE -ne 0 -or $rootOutput.Count -eq 0) {
        throw "The specified path is not a Git repository: $resolvedRepo"
    }
    $RepoRoot = (Resolve-Path -LiteralPath $rootOutput[0]).Path
}
catch {
    Write-Output "[FAIL] $($_.Exception.Message)"
    Write-Output 'CONTINUITY VALIDATION: FAIL (1 error)'
    exit 1
}

function Invoke-Git {
    param([Parameter(Mandatory = $true)][string[]]$Arguments)

    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = 'SilentlyContinue'
    try {
        $output = @(& git -c core.excludesfile= -C $RepoRoot @Arguments 2>$null)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }
    if ($exitCode -ne 0) {
        throw "Git command failed: git $($Arguments -join ' ')"
    }
    return $output
}

function Get-Section {
    param(
        [Parameter(Mandatory = $true)][string]$Content,
        [Parameter(Mandatory = $true)][string]$Heading,
        [string]$NextHeading
    )

    $start = [regex]::Escape($Heading)
    if ($NextHeading) {
        $end = [regex]::Escape($NextHeading)
        $match = [regex]::Match($Content, "(?ms)^$start\s*$\r?\n(.*?)(?=^$end\s*$)")
    }
    else {
        $match = [regex]::Match($Content, "(?ms)^$start\s*$\r?\n(.*)\z")
    }

    if (-not $match.Success) {
        return $null
    }
    return $match.Groups[1].Value
}

$requiredFiles = @(
    'PROJECT_CURRENT_STATE.md',
    'NEW_CHAT_START_TASK.md',
    'PROJECT_EXECUTION_PROTOCOL.md'
)

foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $RepoRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        Add-Failure "Missing required continuity file: $relativePath"
    }
}

$statePath = Join-Path $RepoRoot 'PROJECT_CURRENT_STATE.md'
if (-not (Test-Path -LiteralPath $statePath -PathType Leaf)) {
    foreach ($pass in $passes) { Write-Output "[PASS] $pass" }
    foreach ($failure in $failures) { Write-Output "[FAIL] $failure" }
    Write-Output "CONTINUITY VALIDATION: FAIL ($($failures.Count) errors)"
    exit 1
}

$state = Get-Content -LiteralPath $statePath -Raw -Encoding UTF8

$requiredStateTokens = @(
    '## 2. Current roadmap position',
    '## 3. Frozen baseline in force',
    '## 4. Last completed milestones',
    '## 5. User-approved decisions in force',
    '## 7. Exact next task',
    '## 8. Required reading for next task',
    '## 9. Known non-actions',
    '## 10. New chat handoff assessment',
    'CURRENT ROADMAP DOCUMENT:',
    'CURRENT VERSION / STATUS:',
    'CURRENT OBJECTIVE:',
    'NEXT BLOCKED DOCUMENT:',
    'COMMIT AUTHORIZED:',
    'IMPLEMENTATION AUTHORIZED:',
    'FREEZE AUTHORIZED:',
    'FROZEN FILES CHANGED SINCE PREVIOUS STATE:'
)

foreach ($token in $requiredStateTokens) {
    if (-not $state.Contains($token)) {
        Add-Failure "PROJECT_CURRENT_STATE.md is missing required element: $token"
    }
}

$nextTaskMatches = [regex]::Matches($state, '(?m)^## 7\. Exact next task\s*$')
if ($nextTaskMatches.Count -ne 1) {
    Add-Failure "Exactly one '## 7. Exact next task' section is required; found $($nextTaskMatches.Count)."
}
else {
    $nextTaskSection = Get-Section -Content $state -Heading '## 7. Exact next task' -NextHeading '## 8. Required reading for next task'
    $taskBlock = [regex]::Match($nextTaskSection, '(?ms)```text\s*(.*?)\s*```')
    if (-not $taskBlock.Success -or $taskBlock.Groups[1].Value.Trim().Length -lt 40) {
        Add-Failure 'EXACT NEXT TASK is not one populated and sufficiently specific text code block.'
    }
    else {
        Add-Pass 'EXACT NEXT TASK is singular and populated.'
    }
}

foreach ($field in @('COMMIT AUTHORIZED', 'IMPLEMENTATION AUTHORIZED', 'FREEZE AUTHORIZED')) {
    $match = [regex]::Match($state, "(?m)^$([regex]::Escape($field)):\s*(YES|NO)(?:\s|-|$)")
    if (-not $match.Success) {
        Add-Failure "$field must have a canonical YES or NO value."
    }
}

$placeholderPatterns = @(
    '(?m)^\s*(TODO|TBD|PLACEHOLDER)\b',
    '<[^>\r\n]+>',
    '\[(?:TODO|TBD|PLACEHOLDER)[^\]]*\]'
)
foreach ($pattern in $placeholderPatterns) {
    if ([regex]::IsMatch($state, $pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
        Add-Failure "PROJECT_CURRENT_STATE.md contains an unresolved placeholder matching: $pattern"
    }
}

$readingSection = Get-Section -Content $state -Heading '## 8. Required reading for next task' -NextHeading '## 9. Known non-actions'
if ($null -eq $readingSection) {
    Add-Failure 'Cannot read the REQUIRED READING FOR NEXT TASK section.'
}
else {
    $readingPaths = @([regex]::Matches($readingSection, '`([^`\r\n]+\.md)`') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
    if ($readingPaths.Count -eq 0) {
        Add-Failure 'REQUIRED READING FOR NEXT TASK contains no Markdown file path.'
    }
    foreach ($relativePath in $readingPaths) {
        if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot $relativePath) -PathType Leaf)) {
            Add-Failure "REQUIRED READING references a missing file: $relativePath"
        }
    }
    if ($readingPaths.Count -gt 0 -and -not ($failures | Where-Object { $_ -like 'REQUIRED READING atsaucas*' })) {
        Add-Pass "All REQUIRED READING files exist ($($readingPaths.Count))."
    }
}

if ($Mode -eq 'Handoff') {
    try {
        $branch = (Invoke-Git -Arguments @('branch', '--show-current')) -join ''
        if ($branch -ne 'main') {
            Add-Failure "Handoff must run from branch main; current branch: $branch"
        }
        else {
            Add-Pass 'Active branch is main.'
        }

        $headOutput = @(Invoke-Git -Arguments @('rev-parse', 'HEAD'))
        $originMainOutput = @(Invoke-Git -Arguments @('rev-parse', 'origin/main'))
        $head = $headOutput[0].Trim()
        $originMain = $originMainOutput[0].Trim()
        if ($head -ne $originMain) {
            Add-Failure "HEAD ($head) does not match origin/main ($originMain)."
        }
        else {
            Add-Pass "HEAD matches origin/main: $head"
        }

        $status = @(Invoke-Git -Arguments @('status', '--porcelain', '--untracked-files=all'))
        if ($status.Count -ne 0) {
            Add-Failure 'Working tree is not clean.'
        }
        else {
            Add-Pass 'Working tree is clean.'
        }

        $stateCommits = @(Invoke-Git -Arguments @('log', '-2', '--format=%H', '--', 'PROJECT_CURRENT_STATE.md'))
        if ($stateCommits.Count -eq 0) {
            Add-Failure 'Git history has no PROJECT_CURRENT_STATE.md commit.'
        }
        elseif ($stateCommits[0] -ne $head) {
            Add-Failure "Latest PROJECT_CURRENT_STATE.md commit ($($stateCommits[0])) is not current HEAD ($head)."
        }
        else {
            Add-Pass 'Latest PROJECT_CURRENT_STATE.md commit is current HEAD.'
        }

        $declaration = [regex]::Match($state, '(?m)^FROZEN FILES CHANGED SINCE PREVIOUS STATE:\s*(YES|NO)\s*$')
        if (-not $declaration.Success) {
            Add-Failure 'Canonical frozen-file change declaration is missing.'
        }
        elseif ($stateCommits.Count -lt 2) {
            Add-Failure 'No previous state commit exists for the frozen-file delta check.'
        }
        else {
            $frozenFiles = @(
                'GOVERNANCE/PROFESSIONAL_SCOPE_v1.3.md',
                'GOVERNANCE/TRACEABILITY_RECORD_v1_v0.5.md',
                'GOVERNANCE/TERMINOLOGY_AND_ENUMS_v1_v0.3.md',
                'GOVERNANCE/VERIFICATION_PROTOCOL_v1.md'
            )
            $changedFiles = @(Invoke-Git -Arguments (@('diff', '--name-only', $stateCommits[1], $head, '--') + $frozenFiles))
            $actual = if ($changedFiles.Count -gt 0) { 'YES' } else { 'NO' }
            if ($declaration.Groups[1].Value -ne $actual) {
                Add-Failure "Frozen-file declaration is $($declaration.Groups[1].Value), but Git delta is $actual."
            }
            else {
                Add-Pass "Frozen-file declaration matches Git delta: $actual."
            }
        }
    }
    catch {
        Add-Failure $_.Exception.Message
    }
}
else {
    Add-Pass 'Static mode skips Git handoff gates.'
}

foreach ($pass in $passes) {
    Write-Output "[PASS] $pass"
}
foreach ($failure in $failures) {
    Write-Output "[FAIL] $failure"
}

if ($failures.Count -gt 0) {
    Write-Output "CONTINUITY VALIDATION: FAIL ($($failures.Count) errors)"
    exit 1
}

Write-Output 'CONTINUITY VALIDATION: PASS'
exit 0
