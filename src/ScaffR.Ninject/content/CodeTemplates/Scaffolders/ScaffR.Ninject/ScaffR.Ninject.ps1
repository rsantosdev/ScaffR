[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

foreach($ns in @("Core.Interfaces.Data", "Core.Interfaces.Service", "Data", "Service")){
	$toadd = $namespace + "." + $ns
	Add-Namespace $baseProject.Name "\App_Start\" "NinjectMVC3.cs" $toadd
}

Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IDatabaseFactory>().To<DatabaseFactory>().InRequestScope();"
Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IUnitOfWork>().To<UnitOfWork>().InRequestScope();"

##############################################################
# register the interfaces and instances to ninject
##############################################################
$namespaces = $DTE.Documents | ForEach{$_.ProjectItem.FileCodeModel.CodeElements | Where-Object{$_.Kind -eq 5}}
	
$classes = $namespaces | ForEach{$_.Children}

$classes | ForEach{
	$current = $_
	$_.Bases | ForEach{
		if($_.Name -eq "PersistentEntity"){
			Scaffold ScaffR.Ninject.For $current.Name -Force:$Force
		}
	}		
}

