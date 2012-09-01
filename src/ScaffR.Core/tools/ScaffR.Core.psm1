function Add-Domain($outputPath, $template, [switch]$force, $templateFolders){
	Add-Template $coreProjectName $outputPath $template -Force:$Force $templateFolders	
	$file = Get-ProjectItem "$($outputPath).cs" -Project $coreProjectName
	$file.Open()
}

Export-ModuleMember Add-Domain
