param($installPath, $toolsPath, $package, $project)

add-project $paymentProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $paymentProjectName

scaffold ScaffR.Payments