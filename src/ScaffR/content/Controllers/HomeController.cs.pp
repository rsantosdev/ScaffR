using System.Web.Mvc;
using Mvc.Mailer;
using $rootnamespace$.Filters;
using $rootnamespace$.Mailers;
using $rootnamespace$.Models;

namespace $rootnamespace$.Controllers
{
    public partial class HomeController : Controller
    {
        [OnlyAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [OnlyAnonymous]
        public ActionResult About()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpGet]
        public ActionResult Contact()
        {
            return View(new ContactUsModel());
        }

        [AllowAnonymous]
        [HttpGet]
        public ActionResult Learn()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Contact(ContactUsModel model)
        {
            if (ModelState.IsValid)
            {
                new ContactUsMailer().ContactUs(model).Send();
            }
            return View(model);
        }
    }
}
