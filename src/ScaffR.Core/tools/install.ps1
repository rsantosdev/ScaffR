param($installPath, $toolsPath, $package, $project)

Add-Project $coreProjectName | With-Reference "System.ServiceModel,System.Configuration,System.Web,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"

Get-Project | With-Reference $coreProjectName

Scaffold ScaffR.Core