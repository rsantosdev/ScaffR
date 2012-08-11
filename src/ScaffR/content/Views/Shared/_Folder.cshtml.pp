@using $rootnamespace$.Extensions
@using MvcSiteMapProvider
@using MvcSiteMapProvider.Web.Html
@{
    ViewBag.Title = "_Folder";
    Layout = "~/Views/Shared/_Dashboard.cshtml";    
}

@RenderSection("Stylesheets", false)
@RenderSection("Scripts", false)

<div class="row-fluid">
    <div class="span2">
        
                
            @{
                SiteMapProvider provider = SiteMap.Providers[ViewBag.SitemapProvider];
            }
        

        @Html.MvcSiteMap(provider).Pills(0,true,true,1)
    </div>
    <div class="span10">
		
        @Html.Alert()

        @Html.MvcSiteMap((string)ViewBag.SitemapProvider).Breadcrumb()
        
        <div class="row-fluid">
            @RenderBody()
        </div>

    </div>
</div>
