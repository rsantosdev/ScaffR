param($installPath, $toolsPath, $package, $project)

add-project $coreProjectName | `
	with-reference "System.ServiceModel,System.Configuration,System.Web,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"
add-project $dataProjectName | `
	with-reference "System.ServiceModel,System.Runtime.Serialization,$coreProjectName"
add-project $serviceProjectName | `
	with-reference "$dataProjectName,$coreProjectName,System.ServiceModel,System.Runtime.Serialization,System.ComponentModel.DataAnnotations"

scaffold ScaffR.Core
scaffold ScaffR.Data
scaffold ScaffR.Services

