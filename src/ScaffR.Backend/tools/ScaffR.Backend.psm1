function Add-DomainClass($outputPath, $template, [switch]$force, $templateFolders){
	
	Add-Domain $outputPath $template $force $templateFolders

	scaffold scaffr.model.for $template -force:$force
}

Export-ModuleMember Add-DomainClass
