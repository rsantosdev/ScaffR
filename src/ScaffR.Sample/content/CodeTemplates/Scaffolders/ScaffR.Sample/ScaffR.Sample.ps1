[T4Scaffolding.Scaffolder(Description = "WC.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-NamespacesToHost $Project

##############################################################
# Add Templates
##############################################################

foreach ($tml in @("Factory", "Product", "ProductCategory")){
	$outputPath = "Model\" + $tml
	Add-ProjectItemViaTemplate $outputPath -Template $tml `
	-Model @{ 	
		Namespace = $namespace; 
	} `
	-SuccessMessage "Added template $tml" `
	-TemplateFolders $TemplateFolders -Project $coreProjectName -CodeLanguage $CodeLanguage -Force:$Force `

	scaffold ScaffR.Controller.For $tml
}

