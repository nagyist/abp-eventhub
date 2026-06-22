$ErrorActionPreference = 'Stop'

$scriptDir = $PSScriptRoot

& (Join-Path $scriptDir 'start-infrastructure.ps1')
& (Join-Path $scriptDir 'install-libs.ps1')
& (Join-Path $scriptDir 'migrate-database.ps1')
