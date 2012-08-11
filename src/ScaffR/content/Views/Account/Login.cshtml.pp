@model $rootnamespace$.Models.LogOnModel
@{
    ViewBag.Title = "Log On";
}
@section container{
    <div class="page-header">
        <h1>
            Already Have An Account? <small class="pull-right">
                @Html.ActionLink("Register", "Register")
                if you don't have an account. </small>
        </h1>
    </div>
    <div class="row">
        @using (Html.BeginForm("LogIn", "Account", FormMethod.Post, new { @class = "form-horizontal" }))
        {
            @Html.ValidationSummary(true, "Log on was unsuccessful. Please correct the errors and try again.", new { @class = "alert alert-block alert-error" })
            <fieldset>
                <div class="control-group">
                    <label class="control-label">
                        Username
                    </label>
                    <div class="controls">
                        @Html.TextBoxFor(m => m.UserName, new { @class = "required" })
                        @Html.ValidationMessageFor(m => m.UserName)
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">
                        Password
                    </label>
                    <div class="controls">
                        @Html.PasswordFor(m => m.Password, new { @class = "required" })
                        @Html.ValidationMessageFor(m => m.Password)
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                    </div>
                    <div class="controls">
                        <label class="checkbox">
                            @Html.CheckBoxFor(m => m.RememberMe)
                            @Html.LabelFor(m => m.RememberMe)
                        </label>
                    </div>
                </div>
                <div class="form-actions">
                    <input type="submit" value="Log On" class="btn btn-primary" />
                    <a href="@Url.Action("ForgotPassword", "Account")">I forgot my password</a>
                </div>
            </fieldset>
        }
    </div>
}
