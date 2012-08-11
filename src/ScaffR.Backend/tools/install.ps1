param($installPath, $toolsPath, $package, $project)

Add-Project $coreProjectName | `
	with-reference "System.ServiceModel,System.Configuration,System.Web,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"
Add-Project $dataProjectName | `
	with-reference "System.ServiceModel,System.Runtime.Serialization,$coreProjectName"
Add-Project $serviceProjectName | `
	with-reference "$dataProjectName,$coreProjectName,System.ServiceModel,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"

scaffold ScaffR.Core
scaffold ScaffR.Data
scaffold ScaffR.Services

