#http://csharpening.net/?p=623
#http://msdn.microsoft.com/en-us/library/ms228763.aspx
#http://msdn.microsoft.com/en-us/library/envdte.projectitem_members(v=vs.80).aspx
#https://entlibcontrib.svn.codeplex.com/svn/Application%20Block%20Factory/BlockFactory/BlockFactory/Helpers/ProjectItemHelper.cs
#http://msdn.microsoft.com/en-us/library/envdte.vscmtyperef(v=vs.100).aspx

# initialize the global variables
$global:baseProject = Get-Project
$global:namespace = $baseProject.Properties.Item("DefaultNamespace").Value
$global:rootNamespace = $namespace

if ($namespace.LastIndexOf('.') -gt 0){ 
	$global:rootNamespace = $namespace.Substring(0,$namespace.LastIndexOf('.'))
}

function Find-Class([string]$className){
	$classElements = Find-AllClasses	
	foreach ($class in $classElements){
		if ($class.FullName -eq $ClassName){
			$class
		}
	}
}

function Add-Project($projectName){
    if(($DTE.Solution.Projects | Select-Object -ExpandProperty Name) -notcontains $projectName){
    
        $path = (get-solution).path
        
        $templatePath = (get-solution).object.GetProjectTemplate("ClassLibrary.zip","CSharp")	
        		
		(get-solution).object.AddFromTemplate($templatePath, $path+$projectName,$projectName)
        
		Get-ProjectItem "Class1.cs" -Project $projectName | %{ $_.Delete() }
        
		Install-Package EntityFramework -ProjectName $projectName -Version 5.0.0
		
		Get-ProjectItem "App.Config" -Project $projectName | %{ $_.Delete() }
        
        get-project $projectName
	}        
}



function Find-AllClasses(){
	$elements = Get-TopLevelElements
	Find-CodeElements $elements 'class'
}

function Find-CodeElements($elements, [string]$type) {	
	if ($elements.Count -gt 0)
	{
		$kind = Get-CMElement $type
		$elements | % { Find-CodeElements $_.Children $type}
		$elements | ? {$_.Kind -eq $kind  }
	}
}

function Find-SuperClasses([string]$baseClass){
	$classes = Find-AllClasses
	$classes | % { $_.Bases | ? { $_.FullName -eq $baseClass} }
}

function Add-Variable([string]$className, [string]$access, [string]$type, [string]$variableName, $value)
{		
	$class = Find-Class $className
	$typeKind = Get-CMTypeRef $type
	$accessKind = Get-CMAccess $access
	$var = $class.AddVariable($variableName, $typeKind, 0, $accessKind, $value)
	$var.InitExpression = $value
	$var
}

function Add-Var
{
	[CmdletBinding(DefaultParameterSetName ='first')]
	param(
		[Parameter(
			ParameterSetName='first',ValueFromPipeline=$true,Position=0,mandatory=$true
		)]
		$class,
		[Parameter(
			ParameterSetName='second',Position=0,Mandatory=$true
		)]
		$className,
		$access,
		$type,
		$variableName,
		$value
	)
	
	if ($class -eq $null){
		$class = Find-Class $className
	}
	
	$typeKind = Get-CMTypeRef $type
	$accessKind = Get-CMAccess $access
	$var = $class.AddVariable($variableName, $typeKind, 0, $accessKind, $value)
	$var.InitExpression = $value
	$var
}

function Get-TopLevelElements() {
	$DTE.Solution.Projects | % { $_.ProjectItems | % { $_.FileCodeModel.CodeElements }}
}

function Re-Import(){
	import-module ProjectHelpers -force
}

function Get-CMAccess([string]$modifier){
	$modifier = (Get-Culture).TextInfo.ToTitleCase($modifier)
	$enumName = "vsCMAccess$modifier"
	$enumValue = [System.Enum]::Parse([EnvDTE.vsCMAccess], $enumName)
	return [int]$enumValue
}

function Get-CMElement([string]$modifier){
	$modifier = (Get-Culture).TextInfo.ToTitleCase($modifier)
	$enumName = "vsCMElement$modifier"
	$enumValue = [System.Enum]::Parse([EnvDTE.vsCMElement], $enumName)
	return [int]$enumValue
}

function Get-CMTypeRef([string]$modifier){
	$modifier = (Get-Culture).TextInfo.ToTitleCase($modifier)
	$enumName = "vsCMTypeRef$modifier"
	$enumValue = [System.Enum]::Parse([EnvDTE.vsCMTypeRef], $enumName)
	return [int]$enumValue
}


Export-ModuleMember Add-Project
Export-ModuleMember Find-CodeElements
Export-ModuleMember Find-AllClasses
Export-ModuleMember Find-Class
Export-ModuleMember Find-SuperClasses
Export-ModuleMember Add-Variable
Export-ModuleMember Add-Var
Export-ModuleMember Get-TopLevelElements
Export-ModuleMember Re-Import

