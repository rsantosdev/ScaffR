param($installPath, $toolsPath, $package)

get-projectitem CassetteConfiguration.cs | % {$_.Delete()}

scaffold ScaffR.Bootstrap