[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$namespaces = $DTE.Documents | ForEach{$_.ProjectItem.FileCodeModel.CodeElements | Where-Object{$_.Kind -eq 5}}
	
$classes = $namespaces | ForEach{$_.Children}

$classes | ForEach{
	$current = $_
	$_.Bases | ForEach{
		if($_.Name -eq "PersistentEntity"){
			Scaffold ScaffR.Model.For $current.Name -Force:$Force
		}
	}		
}