using System.Web.Mvc;

namespace $rootnamespace$.Helpers
{
    public static class UrlHelpers
    {
        public static string AbsoluteAction(this UrlHelper url,
    string actionName, string controllerName, object routeValues = null)
        {
            if (url.RequestContext.HttpContext.Request.Url != null)
            {
                string scheme = url.RequestContext.HttpContext.Request.Url.Scheme;

                return url.Action(actionName, controllerName, routeValues, scheme);
            }
            return null;
        }
    }
}