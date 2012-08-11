using $rootnamespace$.Core.Model;
using $rootnamespace$.Core.Interfaces.Service;
using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{   
   public partial class OrderController : BaseController<Order>
    {         
        protected IOrderService OrderService;			
				
		public OrderController(IOrderService OrderService)
		{
            ViewBag.Section = "Orders";
			ViewBag.SitemapProvider = "Modules";
            base.Service = this.OrderService = OrderService;	
        }        
    }
}