param(
    [string]$CodexHome = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    if ($env:CODEX_HOME) {
        $CodexHome = $env:CODEX_HOME
    } else {
        $CodexHome = Join-Path $env:USERPROFILE ".codex"
    }
}

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceRoot = Join-Path $repoRoot "skills"
$targetRoot = Join-Path $CodexHome "skills"

if (-not (Test-Path $sourceRoot)) {
    throw "Skills source directory not found: $sourceRoot"
}

New-Item -ItemType Directory -Force $targetRoot | Out-Null

$skills = Get-ChildItem -LiteralPath $sourceRoot -Directory
foreach ($skill in $skills) {
    $target = Join-Path $targetRoot $skill.Name
    if (Test-Path $target) {
        Remove-Item -LiteralPath $target -Recurse -Force
    }

    Copy-Item -LiteralPath $skill.FullName -Destination $target -Recurse
    Write-Host "Installed $($skill.Name) skill to: $target"
}
Write-Host "Restart Codex CLI/Desktop if it was already running."
