[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

foreach ($tml in @("DummyPaymentProvider", "GatewayRequest", "PaymentProvider", "PaymentProviderCollection", "PaymentsManager", "PaymentsSection", "PostAuthRequest", "PostAuthResponse", "PreAuthRequest", "PreAuthResponse")){
	$outputPath = $tml
	add-template $paymentProjectName $outputPath $tml -Force:$Force $TemplateFolders
}