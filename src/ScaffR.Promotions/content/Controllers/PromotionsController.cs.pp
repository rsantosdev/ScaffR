using System.Web.Mvc;
using $rootnamespace$.Core.Modules;

namespace $rootnamespace$.Controllers
{
    [FolderInfo("Promotions")]
    public partial class PromotionsController : Controller
    {
        // GET: /Promotions/
        public ActionResult Index()
        {
            return View();
        }

    }
}
