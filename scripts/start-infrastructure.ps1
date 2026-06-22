$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
$dockerDirectory = Join-Path $repoRoot 'etc/docker'
$dockerScript = Join-Path $dockerDirectory 'up.ps1'

Push-Location $dockerDirectory
try {
    & $dockerScript
}
finally {
    Pop-Location
}
