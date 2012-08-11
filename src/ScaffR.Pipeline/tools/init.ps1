Add-NamespacesToHost (Get-Project).ProjectName

$global:pipelineProjectName = $rootNamespace + ".Pipeline"