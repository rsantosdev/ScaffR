
function Add-TestNamespacesToHost($projectName) {
	##############################################################
	# NAMESPACE
	##############################################################
	$global:namespace = (Get-Project $ProjectName).Properties.Item("DefaultNamespace").Value
	$global:rootNamespace = $namespace
	$dotIX = $namespace.LastIndexOf('.')
	if($dotIX -gt 0){
		$global:rootNamespace = $namespace.Substring(0,$namespace.LastIndexOf('.'))
	}

	##############################################################
	# Project Name
	##############################################################
	$global:unitTestProjectName = $rootNamespace + ".UnitTests"
	$global:baseProjectName = $namespace
}

Export-ModuleMember Add-TestNamespacesToHost