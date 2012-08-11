@using $rootnamespace$.Core.Configuration
@{
    ViewBag.Title = Site.Instance.WebsiteName;
}
@section hero{
    <div class="container showcase">
        <div id="carousel-features" class="carousel slide">
            <div class="carousel-inner" style="height:413px">
                <div class="active item">
                    <div style="text-align: center">
                        <h1>
                            Awesomenes starts here...</h1>
                        <br />
                        <img width="940" height="340" src="@Url.Content("~/content/images/fleetio-screenshots.jpg")"/>
                    </div>
                </div>
                <div class="item">
                    <div style="text-align: center">
                        <h1>
                            The Freshest Technologies</h1>
                        <br />
                        
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control left" href="#carousel-features" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#carousel-features" data-slide="next">&rsaquo;</a>
    </div>
}
<div class="container">
    <div class="row">
        <div class="span8">
            <br />
            <br />
            <h1>
                Start building production-ready sites in minutes</h1>
        </div>
        <div class="span4">
            <p>
                <a style="width:80%" class="btn btn-large btn-success" href="@Url.Action("Register", "Account")">
                    Get Started Today</a>
                <br />
                <br />
                <a style="width:80%" class="btn btn-large" href="@Url.Action("Learn", "Home")">Learn
                    More</a>
            </p>
        </div>
    </div>
    <hr />
</div>
<div class="container">
    <div class="row">
        <div class="span6">
            <div class="row">
                <div class="span1">
                    Image
                </div>
                <div class="span5">
                    <h2>
                        Professional Starter Template
                    </h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/open-source-icon.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        Totally Open Source</h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
    </div>
	<hr/>
    <div class="row">
        <div class="span6">
            <div class="row">
                <div class="span1">
                    Image
                </div>
                <div class="span5">
                    <h2>
                        Community Driven
                    </h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="row">
                <div class="span1">
                    Image
                </div>
                <div class="span5">
                    <h2>
                        Production Ready</h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="well feature">
        <h3>
            Do the right thing and sign up</h3>
        <a href="@Url.Action("Register", "Account")">Get Started Today</a>
    </div>
</div>
