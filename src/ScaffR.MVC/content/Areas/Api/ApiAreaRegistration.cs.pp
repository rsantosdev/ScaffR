using System.Web.Mvc;

namespace $rootnamespace$.Areas.Api
{
    using System.Web.Http;

    using $rootnamespace$.App_Start;

    public class ApiAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Api";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            WebApiConfig.Register(GlobalConfiguration.Configuration);
        }
    }
}