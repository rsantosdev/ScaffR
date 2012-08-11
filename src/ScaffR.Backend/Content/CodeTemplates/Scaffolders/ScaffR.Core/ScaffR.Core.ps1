[T4Scaffolding.Scaffolder(Description = "ScaffR.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$outputPath = "Interfaces\Data\IRepository"
Add-Template $coreProjectName $outputPath "IRepository" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Data\IUnitOfWork"
Add-Template $coreProjectName $outputPath "IUnitOfWork" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Data\IDatabaseFactory"
Add-Template $coreProjectName $outputPath "IDatabaseFactory" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Data\IDataContext"
Add-Template $coreProjectName $outputPath "IDataContext" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Service\IService"
Add-Template $coreProjectName $outputPath "IService" -Force:$Force $TemplateFolders

$outputPath = "Model\PersistentEntity"
Add-Template $coreProjectName $outputPath "PersistentEntity" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Validation\IValidationContainer"
Add-Template $coreProjectName $outputPath "IValidationContainer" -Force:$Force $TemplateFolders

$outputPath = "Common\Validation\ValidationContainer"
Add-Template $coreProjectName $outputPath "ValidationContainer" -Force:$Force $TemplateFolders

$outputPath = "Common\Validation\ValidationEngine"
Add-Template $coreProjectName $outputPath "ValidationEngine" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Paging\IPage"
Add-Template $coreProjectName $outputPath "IPage" -Force:$Force $TemplateFolders

$outputPath = "Common\Paging\Page"
Add-Template $coreProjectName $outputPath "Page" -Force:$Force $TemplateFolders

$outputPath = "Configuration\CoreSectionHandler"
Add-Template $coreProjectName $outputPath "CoreSectionHandler" -Force:$Force $TemplateFolders

$outputPath = "Configuration\DevLevel"
Add-Template $coreProjectName $outputPath "DevLevel" -Force:$Force $TemplateFolders

$outputPath = "Configuration\EnvironmentConfiguration"
Add-Template $coreProjectName $outputPath "EnvironmentConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\LoggingConfiguration"
Add-Template $coreProjectName $outputPath "LoggingConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\SecurityConfiguration"
Add-Template $coreProjectName $outputPath "SecurityConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\SecurityLevel"
Add-Template $coreProjectName $outputPath "SecurityLevel" -Force:$Force $TemplateFolders

$outputPath = "Configuration\SiteConfiguration"
Add-Template $coreProjectName $outputPath "SiteConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\EventLogElement"
Add-Template $coreProjectName $outputPath "EventLogElement" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\BootStrapper"
Add-Template $coreProjectName $outputPath "BootStrapper" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\Handles"
Add-Template $coreProjectName $outputPath "Handles" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\IMessageBus"
Add-Template $coreProjectName $outputPath "IMessageBus" -Force:$Force $TemplateFolders

$outputPath = "Eventing\MessageBus"
Add-Template $coreProjectName $outputPath "MessageBus" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Modules\INotificationBubble"
Add-Template $coreProjectName $outputPath "INotificationBubble" -Force:$Force $TemplateFolders

$outputPath = "Common\Notifications\NotificationItem"
Add-Template $coreProjectName $outputPath "NotificationItem" -Force:$Force $TemplateFolders

$outputPath = "Common\Permissions\PermissionLevel"
Add-Template $coreProjectName $outputPath "PermissionLevel" -Force:$Force $TemplateFolders

$outputPath = "Configuration\ISiteConfiguration"
Add-Template $coreProjectName $outputPath "ISiteConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\Security"
Add-Template $coreProjectName $outputPath "Security" -Force:$Force $TemplateFolders

$outputPath = "Configuration\Site"
Add-Template $coreProjectName $outputPath "Site" -Force:$Force $TemplateFolders

