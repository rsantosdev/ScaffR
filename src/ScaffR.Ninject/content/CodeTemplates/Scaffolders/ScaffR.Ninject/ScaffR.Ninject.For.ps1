[T4Scaffolding.Scaffolder(Description = "Enter a description of CodePlanner.ScaffoldAll.For here")][CmdletBinding()]
param(        
	[parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)][string]$ModelType,
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

##############################################################
# register the service to ninject
##############################################################
Write-Host Registering service I$($ModelType)Service to ninject -ForegroundColor DarkGreen
Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectWebCommon.cs" "NinjectWebCommon" "RegisterServices" "kernel.Bind<I$($ModelType)Service>().To<$($ModelType)Service>().InRequestScope();"

##############################################################
# Register the repsoitory to ninject
##############################################################
Write-Host Registering service I$($ModelType)Repository to ninject -ForegroundColor DarkGreen
Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectWebCommon.cs" "NinjectWebCommon" "RegisterServices" "kernel.Bind<I$($ModelType)Repository>().To<$($ModelType)Repository>().InRequestScope();"

