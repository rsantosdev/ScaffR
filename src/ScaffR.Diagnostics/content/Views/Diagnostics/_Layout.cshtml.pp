@{
    Layout = "~/Views/Shared/_Layout.cshtml";
}

<ul>
    <li>@Html.ActionLink("Send Mail", "SendMail")</li>
    <li>@Html.ActionLink("Settings", "Settings")</li>  
    <li>@Html.ActionLink("Gateway", "Gateway")</li>   
</ul>

@RenderBody()