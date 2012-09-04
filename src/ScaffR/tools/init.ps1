param($installPath, $toolsPath, $package)

Import-Module (Join-Path $toolsPath "ScaffR.psm1")
Import-Module (Join-Path $toolsPath "ProjectHelpers/ProjectHelpers.psm1")
Import-Module (Join-Path $toolsPath "XmlHelpers/XmlHelpers.psm1")

Init-Project (get-project)


