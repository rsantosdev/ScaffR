using System.Web.Mvc;

namespace $rootnamespace$.Filters
{
    public partial class FolderInfoAttribute : ActionFilterAttribute
    {
        private readonly string _name;

        public FolderInfoAttribute(string name)
        {
            _name = name;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            filterContext.Controller.ViewBag.Section = _name;

            base.OnActionExecuting(filterContext);
        }
    }
}