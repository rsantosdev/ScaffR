param($installPath, $toolsPath, $package)

Import-Module (Join-Path $toolsPath "ScaffR-API.psm1")

Init-Project (get-project)
