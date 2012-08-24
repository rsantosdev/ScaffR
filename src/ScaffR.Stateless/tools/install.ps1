param($installPath, $toolsPath, $package, $project)

add-project $statelessProjectName
get-project | with-reference $statelessProjectName

scaffold ScaffR.Stateless