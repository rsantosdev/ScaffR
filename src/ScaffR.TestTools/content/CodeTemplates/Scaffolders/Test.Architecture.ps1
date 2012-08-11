[T4Scaffolding.Scaffolder(Description = "Test.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

##############################################################
# Scaffold the projects needed for solution
##############################################################

scaffold Test.UnitTests
scaffold Test.Host

$DTE.ExecuteCommand("Build.BuildSolution")