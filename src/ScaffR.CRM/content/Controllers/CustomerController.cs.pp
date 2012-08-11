using $rootnamespace$.Core.Model;
using $rootnamespace$.Core.Interfaces.Service;
using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{   
   public partial class CustomerController : BaseController<Customer>
    {         
        protected ICustomerService CustomerService;			
				
		public CustomerController(ICustomerService CustomerService)
		{		    
			ViewBag.SitemapProvider = "Modules";
            base.Service = this.CustomerService = CustomerService;	
			ViewBag.Section = "Customers";
        }        
    }
}