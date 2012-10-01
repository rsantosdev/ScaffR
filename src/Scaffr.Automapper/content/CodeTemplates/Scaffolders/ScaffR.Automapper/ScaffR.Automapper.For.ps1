[T4Scaffolding.Scaffolder(Description = "Enter a description of CodePlanner.ScaffoldAll.For here")][CmdletBinding()]
param(        
	[parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)][string]$ModelType,
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

##############################################################
# register the Model and ViewModel to autoMapper
##############################################################
Write-Host Registering service $($ModelType) to autoMapper -ForegroundColor DarkGreen
Add-CodeToMethod $baseProject.Name "\App_Start\" "AutoMapperConfig.cs" "AutoMapperConfig" "RegisterMappings" "AutoMapper.Mapper.CreateMap<$($ModelType)ViewModel, $($ModelType)>();"
