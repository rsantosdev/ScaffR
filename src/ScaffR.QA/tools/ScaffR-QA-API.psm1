function Add-TestProject($projectName){
	add-project $projectName | with-package Nunit
}

export-modulemember Add-TestProject
