[T4Scaffolding.Scaffolder(Description = "WC.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)



foreach ($tml in @("ShoppingSection")){
	$outputPath = $tml
	Add-ProjectItemViaTemplate $outputPath -Template $tml `
	-Model @{ 	
		Namespace = $namespace; 
	} `
	-SuccessMessage "Successfully added template $tml" `
	-TemplateFolders $TemplateFolders -Project $shoppingProjectName -CodeLanguage $CodeLanguage -Force:$Force `
}