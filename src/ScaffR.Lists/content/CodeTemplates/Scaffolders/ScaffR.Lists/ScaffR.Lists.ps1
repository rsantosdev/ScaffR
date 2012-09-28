[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("Lists.Countries","Lists.UnitedStates")

foreach ($tml in $templates){
	$outputPath = "Common\Lists\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}