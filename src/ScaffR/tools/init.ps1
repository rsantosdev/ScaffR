param($installPath, $toolsPath, $package)

set-alias scaffold scaffr

Import-Module (Join-Path $toolsPath "ScaffR-API.psm1")

Init-Project (get-project)
