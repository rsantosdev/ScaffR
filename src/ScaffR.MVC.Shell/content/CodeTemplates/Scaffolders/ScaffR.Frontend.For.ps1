[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
	[parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)][string]$ModelType,
	[string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false,
	[switch]$WithBackend = $false
)

if ($WithBackend -eq $true){
	Scaffold ScaffR.Backend.For $ModelType -Force:$Force
}

Scaffold ScaffR.WebApi.For $ModelType -Force:$Force
Scaffold ScaffR.Ninject.For $ModelType -Force:$Force
#Scaffold ScaffR.Controller.For $ModelType -Force:$Force