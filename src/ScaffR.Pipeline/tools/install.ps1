param($installPath, $toolsPath, $package, $project)

add-project $pipelineProjectName | with-reference "System.Configuration,System.Web"

get-project | with-reference $pipelineProjectName

Scaffold ScaffR.Pipeline
