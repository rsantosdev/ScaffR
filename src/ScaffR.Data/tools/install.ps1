param($installPath, $toolsPath, $package, $project)

Add-Project $dataProjectName | With-Reference "System.ServiceModel,System.Runtime.Serialization,$coreProjectName"

Get-Project | With-Reference $dataProjectName

$App_Data = (get-solution).Path + $baseProject.Name  + "\App_Data"
if(!(Test-Path $App_Data)){
	Write-Host "Adding App_Data to" $baseProject.Name
	$baseProject.ProjectItems.AddFolder("App_Data")
}

Scaffold ScaffR.Data

Enable-Migrations -EnableAutomaticMigrations -ProjectName $dataProjectName

Add-Migration "Database Created" -ProjectName $dataProjectName

update-database -ProjectName $dataProjectName