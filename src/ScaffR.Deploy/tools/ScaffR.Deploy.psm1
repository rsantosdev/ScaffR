function Run-Project(){
    $sb2 = Get-Interface $DTE.Solution.SolutionBuild ([EnvDTE80.SolutionBuild2])
    $config2 = Get-Interface $sb2.ActiveConfiguration ([EnvDTE80.SolutionConfiguration2])
    $sb2.Run()  
}

function Publish-Project($Project){
    $sb2 = Get-Interface $DTE.Solution.SolutionBuild ([EnvDTE80.SolutionBuild2])
    $config2 = Get-Interface $sb2.ActiveConfiguration ([EnvDTE80.SolutionConfiguration2])
    $configName = $config2.Name + '|' + $config2.PlatformName
            
	$solutionPath = (Get-Solution).Path
	$path = $Project.FullName.Replace($solutionPath,"")
			
    $sb2.PublishProject($configName, $path, $true)

}

function Deploy-Project($Project){
    $sb2 = Get-Interface $DTE.Solution.SolutionBuild ([EnvDTE80.SolutionBuild2])
    $config2 = Get-Interface $sb2.ActiveConfiguration ([EnvDTE80.SolutionConfiguration2])
    $configName = $config2.Name + '|' + $config2.PlatformName
            
	$solutionPath = (Get-Solution).Path
	$path = $Project.FullName.Replace($solutionPath,"")
	
    $sb2.DeployProject($configName, $path, $true)
}

function Build-Project($Project){
    $sb2 = Get-Interface $DTE.Solution.SolutionBuild ([EnvDTE80.SolutionBuild2])
    $config2 = Get-Interface $sb2.ActiveConfiguration ([EnvDTE80.SolutionConfiguration2])
    $configName = $config2.Name + '|' + $config2.PlatformName
	
	$solutionPath = (Get-Solution).Path
	$path = $Project.FullName.Replace($solutionPath,"")
	
    $sb2.BuildProject($configName, $path, $true)
}

Export-ModuleMember Run-Project
Export-ModuleMember Publish-Project
Export-ModuleMember Deploy-Project
Export-ModuleMember Build-Project