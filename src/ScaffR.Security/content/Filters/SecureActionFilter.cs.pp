using System;
using System.Web;
using System.Web.Mvc;
using $rootnamespace$.Core.Configuration;

namespace $rootnamespace$.Filters
{
    public class SecureActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            bool skipSecure = filterContext.ActionDescriptor.IsDefined(typeof(UnsecureAttribute), true)
                              || filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(UnsecureAttribute), true)
                              || Security.Instance.SecurityLevel == SecurityLevel.None;

            HttpRequestBase req = filterContext.HttpContext.Request;

            if (req.Url != null)
            {
                var builder = new UriBuilder(req.Url);

                if (skipSecure && req.IsSecureConnection)
                {
                    builder.Scheme = Uri.UriSchemeHttp;
                    builder.Port = 80;
                    filterContext.Result = new RedirectResult(builder.Uri.ToString());
                }
                else if (!skipSecure && !req.IsSecureConnection)
                {
                    builder.Scheme = Uri.UriSchemeHttp;
                    builder.Port = 80;
                    filterContext.Result = new RedirectResult(builder.Uri.ToString());
                }
                else
                {
                    base.OnActionExecuting(filterContext);
                }
            }


        }
    }
}
