using ThemeSwitcher.Core.Model;
using ThemeSwitcher.Core.Interfaces.Service;
using System.Web.Mvc;

namespace ThemeSwitcher.Controllers
{   
   public partial class RoleController : BaseController<Role>
    {         
        protected IRoleService RoleService;			
				
		public RoleController(IRoleService RoleService)
		{
		    ViewBag.SitemapProvider = "Modules";
            base.Service = this.RoleService = RoleService;	
        }        
    }
}