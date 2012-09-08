namespace $rootnamespace$.App_Start
{
	using Cassette;
	using Cassette.Scripts;
	using Cassette.Stylesheets;

    /// <summary>
    /// Configures the Cassette asset bundles for the web application.
    /// </summary>
    public class CassetteConfig : IConfiguration<BundleCollection>
    {
        public void Configure(BundleCollection bundles)
        {
            bundles.Add<StylesheetBundle>("Content/Site.less");    
            bundles.AddPerSubDirectory<StylesheetBundle>("Content/custom");
        }
    }
}