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
$source = Join-Path $repoRoot "skills\architect-first"
$targetRoot = Join-Path $CodexHome "skills"
$target = Join-Path $targetRoot "architect-first"

if (-not (Test-Path $source)) {
    throw "Skill source not found: $source"
}

New-Item -ItemType Directory -Force $targetRoot | Out-Null

if (Test-Path $target) {
    Remove-Item -LiteralPath $target -Recurse -Force
}

Copy-Item -LiteralPath $source -Destination $target -Recurse

Write-Host "Installed architect-first skill to: $target"
Write-Host "Restart Codex CLI/Desktop if it was already running."
