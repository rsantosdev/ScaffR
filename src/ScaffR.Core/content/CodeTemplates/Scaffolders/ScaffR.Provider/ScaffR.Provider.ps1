[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$ProviderName,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)



