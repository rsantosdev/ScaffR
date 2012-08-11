using System.Web.Mvc;
using AutoMapper;
using $rootnamespace$.Core.Interfaces.Service;
using $rootnamespace$.Core.Model;
using $rootnamespace$.Membership.Helpers;
using $rootnamespace$.Models;

namespace $rootnamespace$.Controllers
{
    public partial class ProfileController : Controller
    {
        private readonly IUserService _userService;

        public ProfileController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        public ActionResult Index()
        {
            Mapper.CreateMap<User, ProfileModel>();

            var model = Mapper.Map<User, ProfileModel>(MembershipHelper.CurrentUser);

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                // does email already exist?
                if(MembershipHelper.EmailInUse(model.Email))
                {
                    ModelState.AddModelError("EmailInUse", "Email already in use");
                }
                else
                {
                    var user = MembershipHelper.CurrentUser;
                    user.FirstName = model.FirstName;
                    user.LastName = model.LastName;
                    user.Email = model.Email;
                    _userService.SaveOrUpdate(user);
                }
            }
            return View(model);
        }
    }
}
