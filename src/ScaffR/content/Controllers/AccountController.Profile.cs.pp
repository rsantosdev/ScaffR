using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using $rootnamespace$.Core.Model;
using $rootnamespace$.Membership.Helpers;
using $rootnamespace$.Models;

namespace $rootnamespace$.Controllers
{
    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Profile()
        {
            Mapper.CreateMap<User, ProfileModel>();

            var model = Mapper.Map<User, ProfileModel>(MembershipHelper.CurrentUser);

            return View(model);
        }

        [HttpPost]
        public ActionResult Profile(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                // does email already exist?
                if (MembershipHelper.EmailInUse(model.Email))
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


        [HttpGet]
        public ActionResult Emails()
        {
            Mapper.CreateMap<UserEmail, EmailModel>();

            List<EmailModel> model = _userEmailService.Find(x => x.UserId == MembershipHelper.CurrentUser.Id).Select(x=>new EmailModel()
                                                                                                                     {
                                                                                                                         EmailAddress = x.EmailAddress
                                                                                                                     }).ToList();
            model.Add(new EmailModel()
                          {
                              EmailAddress = MembershipHelper.CurrentUser.Email,
                              IsDefault = true
                          });
            

            return View(model);
        }

        [HttpPost]
        public ActionResult Emails(EmailModel model)
        {
            return View();
        }

        [HttpGet]
        public ActionResult Notifications()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Notifications(NotificationsModel model)
        {
            return View();
        }
    }
}
