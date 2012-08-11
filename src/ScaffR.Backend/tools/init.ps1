param($installPath, $toolsPath, $package)

$global:coreProjectName = $rootNamespace + '.Core'
$global:dataProjectName = $rootNamespace + '.Data'
$global:serviceProjectName = $rootNamespace + '.Service'

Import-Module (Join-Path $toolsPath "ScaffR.Backend.psm1")

