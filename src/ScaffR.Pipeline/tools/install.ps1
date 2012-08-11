param($installPath, $toolsPath, $package, $project)

Add-Project $pipelineProjectName | with-reference "System.Configuration,System.Web"

get-project | with-reference $pipelineProjectName

Scaffold ScaffR.Pipeline
