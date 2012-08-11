[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

foreach ($tml in @("IConfigInitializer", "IProcessor", "PipelineActivator", "PipelineSection", "ProcessorSectionSettings", "ProcessorSectionSettingsCollection")){
	$outputPath = $tml
	add-template $pipelineProjectName $outputPath $tml -Force:$force $TemplateFolders
}

