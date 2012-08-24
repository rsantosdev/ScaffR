[T4Scaffolding.Scaffolder(Description = "Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("DynamicTriggerBehaviour", `
		"Enforce", `
		"IgnoredTriggerBehaviour", `
		"ParameterConversion", `
		"ParameterConversionResources.Designer", `
		"ParameterConversionResources", `
		"SequentialActionQueue", `
		"StateConfiguration", `
		"StateConfigurationResources.Designer", `
		"StateConfigurationResources", `
		"StateMachine", `
		"StateMachineResources.Designer", `
		"StateMachineResources", `
		"StateReference", `
		"StateRepresentation", `
		"StateRepresentationResources.Designer", `
		"StateRepresentationResources", `
		"Transition", `
		"TransitioningTriggerBehaviour", `
		"TriggerBehaviour", `
		"TriggerWithParameters")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $statelessProjectName $outputPath $tml -Force:$Force $TemplateFolders
}