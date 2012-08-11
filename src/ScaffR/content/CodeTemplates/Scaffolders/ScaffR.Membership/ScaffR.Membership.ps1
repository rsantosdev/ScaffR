[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)


Add-DomainClass "Model\User" "User" -Force:$Force $TemplateFolders
Add-DomainClass "Model\Role" "Role" -Force:$Force $TemplateFolders
Add-DomainClass "Model\UserRole" "UserRole" -Force:$Force $TemplateFolders
Add-DomainClass "Model\UserEmail" "UserEmail" -Force:$Force $TemplateFolders

Add-Template $membershipProjectName "Providers\CodeFirstMembershipProvider" "CodeFirstMembershipProvider" -Force:$Force $TemplateFolders
Add-Template $membershipProjectName "Providers\CodeFirstRoleProvider" "CodeFirstRoleProvider" -Force:$Force $TemplateFolders
Add-Template $membershipProjectName "Helpers\MembershipHelper" "MembershipHelper" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "Seeders\MembershipDataSeeder" "MembershipDataSeeder" -Force:$Force $TemplateFolders

# this seriously needs to be refactored
Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IUserRepository>().To<UserRepository>().InRequestScope();"
Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IRoleRepository>().To<RoleRepository>().InRequestScope();"
Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IUserRoleRepository>().To<UserRoleRepository>().InRequestScope();"

Write-Host "starting to create initial migration"
enable-migrations -ProjectName $dataProjectName -EnableAutomaticMigrations
add-migration  InitialMigration -ProjectName $dataProjectName

Write-Host "initial migration successfully completed"

Add-CodeToMethod (Get-Project $dataProjectName).Name "\Migrations\" "Configuration.cs" "Configuration" "Seed" "new Seeders.MembershipDataSeeder().Seed(context);"
Add-CodeToMethod (Get-Project $baseProject.Name).Name "\" "Global.asax.cs" "MvcApplication" "RegisterGlobalFilters" "filters.Add(new Filters.LoginAuthorize());"
#update-database -ProjectName $dataProjectName


