[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-TestNamespacesToHost $Project

##############################################################
# Add Unit Test project to solution
##############################################################

Add-ClassLibraryToSolution $unitTestProjectName $path $sln

##############################################################
# Add references to Core
##############################################################

foreach ($ref in @("System.ServiceModel", "System.Runtime.Serialization", "System.ComponentModel.DataAnnotations")){
	Add-AssemblyReferenceToProject $unitTestProjectName $ref
}

##############################################################
# Configure Nuget packages for project
##############################################################

if((get-package -ProjectName $unitTestProjectName | Select-Object -ExpandProperty ID) -contains 'NUnit'){
	Write-Host $unitTestProjectName Looking for update : NUnit -ForegroundColor DarkGreen
	Update-Package NUnit -ProjectName $unitTestProjectName
}
else{
	Write-Host $unitTestProjectName Installing : Nunit -ForegroundColor DarkGreen
	Install-Package NUnit -ProjectName $unitTestProjectName
}

##############################################################
# Configure references
##############################################################
Add-ProjectReferenceToProject $unitTestProjectName $baseProjectName 