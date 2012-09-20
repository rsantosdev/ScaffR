[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("Environment","DevLevel")

foreach ($tml in $templates){
	$outputPath = "Common\Environment\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("EnvironmentElement")

foreach ($tml in $templates){
	$outputPath = "Configuration\Environment\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("CoreSection.Environment")

foreach ($tml in $templates){
	$outputPath = "Configuration\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}



