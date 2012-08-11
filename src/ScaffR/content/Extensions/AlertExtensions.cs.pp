using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using $rootnamespace$.Models;

namespace $rootnamespace$.Extensions
{
    public static class HtmlHelperExtensions
    {
        public static ModelHelpers Helpers(this HtmlHelper helper)
        {
            return new ModelHelpers(helper);
        }

        public static MvcHtmlString Alert(this HtmlHelper helper)
        {
            var alerts = helper.ViewContext.Controller.TempData["Notifications"] as List<IAlert>;
            StringBuilder builder = new StringBuilder();
            if (alerts != null)
            {
                foreach (IAlert alert in alerts)
                {
                    MvcHtmlString str = helper.Helpers().GetHelper(helper, alert).DisplayFor(x => alert, "Alert");
                    builder.Append(str.ToHtmlString());
                }
            }

            return new MvcHtmlString(builder.ToString());
        }
    }

    public partial class ModelHelpers
    {
        public HtmlHelper HtmlHelper { get; protected set; }

        public ModelHelpers(HtmlHelper helper)
        {
            HtmlHelper = helper;
        }

        public HtmlHelper<IAlert> GetHelper(HtmlHelper helper, IAlert model)
        {
            return new HtmlHelper<IAlert>(HtmlHelper.ViewContext, new ViewDataContainer<IAlert>(model));
        }
    }

    public partial class ViewDataContainer<TModel>
        : IViewDataContainer
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ViewDataContainer&lt;TModel&gt;"/> class.
        /// </summary>
        /// <param name="model">The model.</param>
        public ViewDataContainer(TModel model)
        {
            ViewData = new ViewDataDictionary<TModel>(model);
        }

        /// <summary>
        /// Gets or sets the view data dictionary.
        /// </summary>
        /// <value></value>
        /// <returns>The view data dictionary.</returns>
        public ViewDataDictionary ViewData { get; set; }
    }
}