[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\Factory" "Factory" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Model\Product" "Product" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Model\ProductCategory" "ProductCategory" -Force:$Force $TemplateFolders