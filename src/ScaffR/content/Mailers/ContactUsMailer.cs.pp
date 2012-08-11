using System.Net.Mail;
using Mvc.Mailer;
using $rootnamespace$.Core.Configuration;
using $rootnamespace$.Models;

namespace $rootnamespace$.Mailers
{
    public partial class ContactUsMailer : MailerBase
    {
        public ContactUsMailer()
        {
            MasterName = "_Layout";
        }

        public virtual MailMessage ContactUs(ContactUsModel model)
        {
            var mailMessage = new MailMessage { Subject = "Contact Us" };

            mailMessage.To.Add(Site.Instance.EmailAddress);
            PopulateBody(mailMessage, viewName: "ContactUs");

            return mailMessage;
        }
    }
}