namespace $rootnamespace$.Controllers
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Interfaces.Service;
    using $rootnamespace$.Core.Model;

    public abstract partial class BaseController<T> : Controller where T : PersistentEntity
    {
        protected IService<T> Service;
		       
        public virtual ViewResult Manager()
        {
            return View();
        }
    }
}