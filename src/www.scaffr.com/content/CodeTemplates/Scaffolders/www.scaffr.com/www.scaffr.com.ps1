[T4Scaffolding.Scaffolder(Description = "Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = @("DeployInfo")

foreach ($tml in $templates){
	$outputPath = "$rootNamespace.Publish"
	add-template $rootnamespace $outputPath $tml -Force:$true $TemplateFolders
}

 $templates = @("Web.Debug", "Web.Release")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $rootnamespace $outputPath $tml -Force:$true $TemplateFolders
}