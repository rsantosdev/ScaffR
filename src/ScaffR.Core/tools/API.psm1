function init-project($project){
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

function add-project($projectName){
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
			Update-Package EntityFramework -ProjectName $projectName
		}
		else{
			Install-Package EntityFramework -ProjectName $projectName
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


export-modulemember add-project
export-modulemember get-solution
export-modulemember with-reference
export-modulemember with-package
export-modulemember init-project
export-modulemember get-file
export-modulemember get-domain