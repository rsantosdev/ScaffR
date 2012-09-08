param($installPath, $toolsPath, $package, $project)

#update-package jquery

get-projectitem readme.txt | % {$_.Delete()}
get-projectitem content/site.css | % {$_.Delete()}
get-projectitem README.jQuery.vsdoc.txt | % { $_.Delete()}


scaffold scaffr.website