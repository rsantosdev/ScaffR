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
        
        return get-project $projectName
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
                    write "Successfully added assembly reference '$reference' to $projectName"
                }
                else{
                    $project.Object.References.AddProject((Get-Project $reference))
                    write "Successfully added $reference to $projectName"
                }                            
            }                    
        }        
    }

    end { return }
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

export-modulemember add-project
export-modulemember get-solution
export-modulemember with-reference
export-modulemember with-package