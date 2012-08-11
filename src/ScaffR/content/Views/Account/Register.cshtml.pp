@model $rootnamespace$.Models.RegisterModel
@{
    ViewBag.Title = "Register";
}
@section container{
    <div class="page-header">
        <h1>
            Create A New Account <small>Today</small>
        </h1>
    </div>
    <div class="row">
        @using (Html.BeginForm("Register", "Account", FormMethod.Post, new { @class = "form-horizontal" }))
        {
            @Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.", new { @class = "alert alert-block alert-error" })
            <fieldset>
                
                <div class="control-group">
                    <label class="control-label">
                        First Name
                    </label>
                    <div class="controls">
                        @Html.TextBoxFor(m => m.FirstName, new { @class = "required" })
                        @Html.ValidationMessageFor(m => m.LastName)
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">
                        Last Name
                    </label>
                    <div class="controls">
                        @Html.TextBoxFor(m => m.LastName, new { @class = "required" })
                        @Html.ValidationMessageFor(m => m.LastName)
                    </div>
                </div>
                

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
                        Email Address
                    </label>
                    <div class="controls">
                        @Html.TextBoxFor(m => m.Email, new { @class = "required email" })
                        @Html.ValidationMessageFor(m => m.Email)
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
                    <label class="control-label">
                        Confirm Password
                    </label>
                    <div class="controls">
                        @Html.PasswordFor(m => m.ConfirmPassword, new { @class = "required" })
                        @Html.ValidationMessageFor(m => m.ConfirmPassword)
                    </div>
                </div>
                <div class="form-actions">
                    <input type="submit" value="Register" class="btn btn-primary" />
                    <input type="reset" value="Clear Form" class="btn" title="Remove all the data from the form." />
                </div>
            </fieldset>
        }
    </div>
}