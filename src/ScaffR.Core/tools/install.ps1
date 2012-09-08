param($installPath, $toolsPath, $package, $project)

Add-Project $coreProjectName | With-Reference "System.ServiceModel,System.Configuration,System.Web,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"

Get-Project | With-Reference $coreProjectName

install-package Newtonsoft.Json -project $coreProjectName

Scaffold ScaffR.Core