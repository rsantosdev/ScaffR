param($installPath, $toolsPath, $package)

Import-Module (Join-Path $toolsPath "ScaffR.psm1")

Init-Project (get-project)
