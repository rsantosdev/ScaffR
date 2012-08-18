[T4Scaffolding.Scaffolder(Description = "ScaffR.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $dataProjectName "BaseRepository" "BaseRepository" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "UnitOfWork" "UnitOfWork" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "DatabaseFactory" "DatabaseFactory" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "DataContext" "DataContext" -Force:$Force $TemplateFolders

Install-Package EntityFramework.SqlServerCompact -Version 4.3.3

$App_Data = (get-solution).Path + $baseProject.Name  + "\App_Data"
if(!(Test-Path $App_Data)){
	Write-Host "Adding App_Data to" $Project
	(Get-Project $Project).ProjectItems.AddFolder("App_Data")
}
