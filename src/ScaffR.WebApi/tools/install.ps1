param($installPath, $toolsPath, $package, $project)

add-project $webapiProjectName | with-reference 'System.Net.Http,System.Net.Http.Formatting,System.Web,System.Web.Http,System.Web.Http.WebHost,System.Configuration'

get-project | with-reference $webapiProjectName

scaffold scaffr.webapi