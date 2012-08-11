param($installPath, $toolsPath, $package)

Import-Module (Join-Path $toolsPath "API.psm1")
Import-Module (Join-Path $toolsPath "ScaffR.Core.psm1")

init-project (get-project)
