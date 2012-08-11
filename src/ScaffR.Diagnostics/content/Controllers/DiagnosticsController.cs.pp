using System.Web.Mvc;
using $rootnamespace$.Filters;

namespace $rootnamespace$.Controllers
{
    public class DiagnosticsController : Controller
    {
	    [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
    }
}
