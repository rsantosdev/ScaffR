namespace $rootnamespace$.Dropdowns
{
    using System.Web.Mvc;
    using Core.Common.Lists;

    public partial class Dropdowns
    {        
        public static SelectList Countries
        {
            get { return new SelectList(Lists.CountryDictionary, "Value", "Key"); }
        }
    }
}