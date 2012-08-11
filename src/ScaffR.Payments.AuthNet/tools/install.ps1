param($installPath, $toolsPath, $package, $project)

add-project $authNetProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$paymentProjectName"
get-project | with-reference $authNetProjectName

scaffold ScaffR.Payments.AuthNet