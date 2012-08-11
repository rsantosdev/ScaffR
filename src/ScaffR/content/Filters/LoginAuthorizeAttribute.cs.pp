using System;
using System.Web.Mvc;
using System.Web.Security;

namespace $rootnamespace$.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
     public partial class LoginAuthorize : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            bool hasAnonymousAttribute = filterContext.ActionDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true)
            || filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true);

            bool hasForceAnonymousAttribute = filterContext.ActionDescriptor.IsDefined(typeof(OnlyAnonymousAttribute), true)
            || filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(OnlyAnonymousAttribute), true);

            if (!hasAnonymousAttribute && !hasForceAnonymousAttribute)
            {
                base.OnAuthorization(filterContext);
            }
        }
    }
}
