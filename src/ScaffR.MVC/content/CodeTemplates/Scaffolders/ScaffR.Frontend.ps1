[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false,
	[switch]$WithBackend = $false
)

Get-Domain | % { scaffold ScaffR.FrontEnd.For $_.Name -Force:$Force -WithBackend:$WithBackend }
