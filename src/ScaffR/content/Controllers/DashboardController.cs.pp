using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{
    public partial class DashboardController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
			//this.PushNotification(new Alert<Department>(department, NotificationType.success, NotificationAction.created));
            return View();
        }

        public ActionResult News()
        {
            return View();
        }

        public ActionResult Calendar()
        {
            return View();
        }
    }
}
