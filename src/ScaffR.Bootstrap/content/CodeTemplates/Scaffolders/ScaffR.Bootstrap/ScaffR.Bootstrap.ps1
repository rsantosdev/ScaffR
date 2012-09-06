[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("CassetteConfiguration")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $baseProject.Name $outputPath $tml -Force:$true $TemplateFolders
}