@using DHH.Web.Helpers
@using DHH.Web.Models

@{
	Layout = null;
	
	string currentController = MembershipHelper.Context.Request.RequestContext.RouteData.Values["controller"].ToString();
	string currentAction = MembershipHelper.Context.Request.RequestContext.RouteData.Values["action"].ToString();
}

<script type="text/javascript">
    $(document).ready(function () {
        $('.main-menu ul li').each(function () {
            $(this).attr('class', '');
            if ($(this).attr('id') == '@TopMenuHelper.GetSelected(currentController, currentAction)') {
                $(this).addClass('selected');
            }
        });
    });
</script>
<ul>
	<li id="@TopMenuItems.SendMail">@Html.ActionLink("Send Mail", "SendMail", "Diagnostics")</li>
    <li id="@TopMenuItems.Exceptions">@Html.ActionLink("Raise Exceptions", "RaiseExceptions", "Diagnostics")</li>
    <li id="@TopMenuItems.Environment">@Html.ActionLink("Settings", "Settings", "Diagnostics")</li>
</ul>
<div class="menu-border"></div>