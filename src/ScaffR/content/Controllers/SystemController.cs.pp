using System.Web.Mvc;
using $rootnamespace$.Filters;

namespace $rootnamespace$.Controllers
{
    [LoginAuthorize]
    public partial class SystemController : Controller
    {        
        // GET: /Settings/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Module()
        {
            return View();
        }
    }
}
