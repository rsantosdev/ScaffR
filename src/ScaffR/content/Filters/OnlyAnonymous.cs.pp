using System;
using System.Web.Mvc;

namespace $rootnamespace$.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public sealed class OnlyAnonymousAttribute : ActionFilterAttribute
    {
        private readonly string _action;
        private readonly string _controller;

        public OnlyAnonymousAttribute(string action, string controller)
        {
            _controller = controller;
            _action = action;
        }

        public OnlyAnonymousAttribute() : this("Index", "Dashboard") // this needs to come from configuration
        {
            
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                filterContext.Result = new RedirectToRouteResult
                                           (
                                               new System.Web.Routing.RouteValueDictionary()
                                                   {
                                                       {"controller", _controller},
                                                       {"action", _action}
                                                   }
                                           );
            }
            else
            {
                base.OnActionExecuting(filterContext);
            }            
        }
    }
}