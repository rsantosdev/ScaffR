@using $rootnamespace$.Extensions
@using MvcSiteMapProvider.Web.Html

@(Request.IsAuthenticated ? Html.MvcSiteMap("System").Nav() : Html.MvcSiteMap("Public").Nav())
