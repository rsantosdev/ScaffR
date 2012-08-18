function Init-Project($project){
    $global:baseProject = $project
    $global:namespace = $project.Properties.Item("DefaultNamespace").Value
    $dotIX = $namespace.LastIndexOf('.')
    if ($dotIX -gt 0){ 
        $global:rootNamespace = $namespace.Substring(0,$namespace.LastIndexOf('.'))
    }
    else{
        $global:rootNamespace = $namespace
    }
}

function Add-Project($projectName){
    if(($DTE.Solution.Projects | Select-Object -ExpandProperty Name) -notcontains $projectName){
    
        $path = (get-solution).path
        
        $templatePath = (get-solution).object.GetProjectTemplate("ClassLibrary.zip","CSharp")	
        		
		(get-solution).object.AddFromTemplate($templatePath, $path+$projectName,$projectName)
        
		$file = Get-ProjectItem "Class1.cs" -Project $projectName
		$file.Remove()
        
		$testPath = $path + $projectName + "\Class1.cs"
        
		#Write-Host $testPath
		if(Test-Path $testPath){
			Remove-Item $testPath
		}
        
        write-host "Successfully created project $projectName"

		if((get-package -ProjectName $projectName | Select-Object -ExpandProperty ID) -contains 'EntityFramework'){
			Update-Package EntityFramework -ProjectName $projectName -Version 4.3.1
		}
		else{
			Install-Package EntityFramework -ProjectName $projectName -Version 4.3.1
		}
        
        get-project $projectName
	}        
}

function with-reference($references){
    
    begin { $project }

    process{                 
        $project = $_
        if($project){        
            $projectName = $project.ProjectName        
            foreach ($reference in $references.split(",")){            
                if(($DTE.Solution.Projects | Select-Object -ExpandProperty Name) -notcontains $reference){                                        
                    $project.Object.References.Add($reference)                     
                }
                else{
                    $project.Object.References.AddProject((Get-Project $reference))
                }                            
            }                    
        }        
    }
}

function with-package($packages){
    
    begin { $project }

    process{                 
        $project = $_
        if($project){        
            $projectName = $project.ProjectName        
            foreach ($package in $packages.split(",")){            
                install-package $package -ProjectName $projectName                        
            }                    
        }        
    }

    end { return }
}


function get-solution(){

    $solution = Get-Interface $dte.Solution ([EnvDTE80.Solution2])
    $name = [System.IO.Path]::GetFilename($solution.FullName)
    $path = $solution.FullName.Replace($name,'').Replace('\\','\')	
    
    $sln = @()
    
    $obj = new-object System.Object
    
    $obj | add-member -MemberType noteproperty `
                      -Name Object  `
                      -Value $solution
                      
    $obj | add-member -MemberType noteproperty `
                      -Name Name  `
                      -Value $name
    
    $obj | add-member -MemberType noteproperty `
                      -Name Path `
                      -Value $path
    
    $sln += $obj
    
    return $sln
}

function Get-File([string]$ProjectName, [string]$Folder = "", [string]$FileName){
	$path = (get-solution).path	
	return $path.Trim() + $ProjectName.Trim() + $Folder.Trim() + $FileName.Trim()	
}



function Get-Domain($basetype){

	$namespaces = $DTE.Documents | ForEach{$_.ProjectItem.FileCodeModel.CodeElements | Where-Object{$_.Kind -eq 5}}	
	
	$classes = $namespaces | ForEach{$_.Children}
	$ret = @()
	$classes | ForEach{
		$current = $_
		$_.Bases | ForEach{
			if($_.Name -eq $basetype){				
				$ret += $current
			}
		}		
	}	
	return $ret
}

function Add-Template($projectName, $outputPath, $template, [switch]$force, $templateFolders){
	Add-ProjectItemViaTemplate $outputPath -Template $template `
		-Model @{ Namespace = $namespace } `
		-SuccessMessage "Successfully Added $template at {0}" `
		-Project $projectName `
		-Force:$Force `
		-TemplateFolders $templateFolders
}

function Add-TemplateWithModel($projectName, $outputPath, $template, $model, $force, $templateFolders){
		
	Add-ProjectItemViaTemplate $outputPath -Template $template `
		-Model $model `
		-SuccessMessage "Successfully Added $template at {0}" `
		-Project $projectName `
		-Force:$Force `
		-TemplateFolders $templateFolders
}

function Add-CodeToMethod([string]$ProjectName, [string]$Folder = "", [string]$FileName,[string]$ClassName, [string]$MethodName, [string]$Code){

	$filepath = Get-File $ProjectName $Folder $FileName	
	$file = $DTE.Solution.FindProjectItem($filepath)
	if($file -eq $null){
		return
	}
	$file.Open().Activate()
		
	$ns = $DTE.ActiveDocument.ProjectItem.FileCodeModel.CodeElements | Where-Object{$_.Kind -eq 5}
	$classes = $ns | ForEach{$_.Children}	
	$classes | ForEach{	
		if(!($_.Name -eq $null)){						
			if($_.Name -eq $ClassName){
				$_.Children | ForEach{
					if($_.Name -eq $MethodName){	
						$addCode = $true
						$edit = $_.EndPoint.CreateEditPoint()
						$edit.GetLines($_.StartPoint.Line,$_.EndPoint.Line).split("`n") | ForEach{													
							if($_.Contains($Code)){								
								$addCode = $false
							}
						}												
						if($addCode -eq $true){
							$edit.StartOfLine()																	
							$edit.Insert($Code)
						}
					}					
				}	
			}
		}
	}	
	$DTE.ExecuteCommand("Edit.FormatDocument")
	$file.Save()	
	#$file.Close()
}


function Add-Namespace([string]$ProjectName, [string]$Folder = "", [string]$FileName,[string]$Namespace){

	$filepath = Get-File $ProjectName $Folder $FileName
	
	$file = $DTE.Solution.FindProjectItem($filepath)
	$file.Open().Document.Activate()
	
	$checkForThis = "using $($Namespace);" 
	$exists = $false
	
	Get-Content $filepath | foreach-Object {  if($_.Contains($checkForThis)){ $exists = $true }}
	
	if($exists -eq $false){
		$DTE.ActiveDocument.Selection.StartOfDocument()
		$DTE.ActiveDocument.Selection.NewLine()
		$DTE.ActiveDocument.Selection.LineUp()
		$DTE.ActiveDocument.Selection.Insert($checkForThis)
		$DTE.ExecuteCommand("Edit.FormatDocument")
		$file.Save()
	}	
}

function Get-Class($classname){

	$namespaces = $DTE.Documents | ForEach{$_.ProjectItem.FileCodeModel.CodeElements | Where-Object{$_.Kind -eq 5}}	
	#Write-Host $classname
	$classes = $namespaces | ForEach{$_.Children}
	$ret = $null
	#Write-Host $classes
	$classes | ForEach{	
		if(!($_.Name -eq $null)){						
			if($_.Name.Trim() -eq $classname){					
				$ret = $_
			}
		}
	}		
	#Write-Host $ret
	return $ret
}

function Get-Properties($type){
	if($type -eq $null){
		Write-Host "You have to provide a DTE class. Use Get-Domain 'BaseClass' or Get-Class 'classname' to get the class(es) you want"
		return $null
	}
	return ForEach{$type.Children | Where-Object{$_.Kind -eq 4}}
}

function Get-LineOfMethod([string]$type, [string]$methodName){	
	
	$t = Get-Class($type)
	$ret = $null
	$t.Children | ForEach{
		if($_.Name -eq $methodName){
			Write-Host "Method found"
			Write-Host $_
			$ret = $_.EndPoint.Line
		}
	}
	
	return $ret	
}

function Add-Text([string]$type = "", [string]$methodName, [string]$text){		
	$m = Get-LineOfMethod($type,$methodName)
	Write-Host $m
	return $m	
}

function Has-Package($project, $package){
	return (get-package | Select-Object -ExpandProperty ID) -contains $package;
}

export-modulemember Add-Project
export-modulemember get-solution
export-modulemember with-reference
export-modulemember with-package
export-modulemember Init-Project
export-modulemember get-file
export-modulemember get-domain
Export-ModuleMember Add-Template
Export-ModuleMember Add-TemplateWithModel
Export-ModuleMember Get-Domain
Export-ModuleMember Get-Class
Export-ModuleMember Get-LineOfMethod
Export-ModuleMember Get-Properties
Export-ModuleMember Add-CodeToMethod
Export-ModuleMember Add-Namespace
Export-ModuleMember Has-Package