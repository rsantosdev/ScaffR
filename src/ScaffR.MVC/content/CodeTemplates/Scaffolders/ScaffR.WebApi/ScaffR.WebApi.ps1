[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
	[parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)][string]$ModelType,
	[string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $baseProject.Name "App_Start\WebApiConfig" "WebApiConfig" -Force:$Force $TemplateFolders