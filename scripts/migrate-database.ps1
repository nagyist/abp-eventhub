$ErrorActionPreference = 'Stop'

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')

Push-Location $repoRoot
try {
    dotnet run --project 'src/EventHub.DbMigrator/EventHub.DbMigrator.csproj'
}
finally {
    Pop-Location
}
