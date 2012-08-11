function Add-DomainClass($outputPath, $template, [switch]$force, $templateFolders){
	Add-Template $coreProjectName $outputPath $template -Force:$Force $templateFolders	
	$file = Get-ProjectItem "$($outputPath).cs" -Project $coreProjectName
	$file.Open()

	scaffold scaffr.model.for $template -force:$force
}

Export-ModuleMember Add-DomainClass
