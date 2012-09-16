param($installPath, $toolsPath, $package, $project)

#update-package jquery

get-projectitem readme.txt | % {$_.Delete()}
get-projectitem content/site.css | % {$_.Delete()}
get-projectitem README.jQuery.vsdoc.txt | % { $_.Delete()}

scaffold scaffr.website

Build-Project

#add hook for application events
$class = Get-ProjectType MvcApplication
$base = $class.Bases.Item(1)
$class.RemoveBase($base)
$class2 = Get-ProjectType "$rootnamespace.Application.WebApplication"
$class.AddBase($class2)