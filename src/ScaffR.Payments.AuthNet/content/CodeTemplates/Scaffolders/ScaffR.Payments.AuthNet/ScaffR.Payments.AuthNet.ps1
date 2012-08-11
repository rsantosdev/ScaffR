[T4Scaffolding.Scaffolder(Description = "ScaffR.Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

foreach ($tml in @("AuthNetPaymentProvider")){
	$outputPath = $tml
	add-template $authNetProjectName $outputPath $tml -Force:$force $TemplateFolders
}