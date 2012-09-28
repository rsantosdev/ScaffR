namespace $rootnamespace$.Controllers
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Interfaces.Service;
    using $rootnamespace$.Core.Model;

    public abstract partial class BaseController<T> : Controller where T : DomainObject
    {
        protected IService<T> Service;		       
    }
}