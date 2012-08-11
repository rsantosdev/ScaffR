using $rootnamespace$.Core.Model;
using $rootnamespace$.Core.Interfaces.Service;
using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{   
   public partial class ShippingController : BaseController<Shipping>
    {         
        protected IShippingService ShippingService;			
				
		public ShippingController(IShippingService ShippingService)
		{
            ViewBag.Section = "Shipping";
            base.Service = this.ShippingService = ShippingService;	
        }        
    }
}