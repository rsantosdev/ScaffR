param($installPath, $toolsPath, $package)

Import-Module (Join-Path $toolsPath "Modules/ScaffR.psm1")
Import-Module (Join-Path $toolsPath "Modules/ProjectHelpers.psm1")
Import-Module (Join-Path $toolsPath "Modules/XmlHelpers.psm1")

Init-Project (get-project)


