using System;
using System.Web.Mvc;

namespace $rootnamespace$.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public sealed class UnsecureAttribute : Attribute { }
}
