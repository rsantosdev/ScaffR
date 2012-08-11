param($installPath, $toolsPath, $package, $project)

add-project $shoppingProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $shoppingProjectName

Scaffold ScaffR.Shopping