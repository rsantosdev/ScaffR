﻿[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $baseProject.Name "App_Start\NinjectWebCommon" "NinjectWebCommon" -Force $TemplateFolders