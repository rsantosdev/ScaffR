namespace $rootnamespace$.Dropdowns
{
    using System.Web.Mvc;
    using Core.Common.Lists;

    public partial class Dropdowns
    {
        public static SelectList UnitedStates
        {
            get { return new SelectList(Lists.StateDictionary, "Value", "Key"); }
        }
    }
}