namespace $rootnamespace$.Controllers
{
    using System.Web.Mvc;
    using Core.Interfaces.Service;
    using Core.Model;
    using System.Security.Claims;

    public abstract partial class BaseController : Controller
    {
        private User _currentUser;
        public User CurrentUser
        {
            get
            {
                if (_currentUser != null)
                {
                    return _currentUser;
                }

                var userService = DependencyResolver.Current.GetService<IUserService>();

                _currentUser =  userService.GetByUsername(ClaimsPrincipal.Current.Identity.Name);
                if (_currentUser == null && !string.IsNullOrEmpty(ClaimsPrincipal.Current.Identity.Name))
                {
                    var authenticationService = DependencyResolver.Current.GetService<IAuthenticationService>();
                    authenticationService.SignOut();
                }

                return _currentUser;
            }
        }
    }
}