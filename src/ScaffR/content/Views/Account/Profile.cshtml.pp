@model $rootnamespace$.Models.ProfileModel
@{
    ViewBag.Title = "Profile";
    Layout = "~/Views/Shared/_Folder.cshtml";
    ViewBag.SitemapProvider = "Account";
}
<div class="page-header">
    <h1>
        Your Profile</h1>
</div>
<div class="row-fluid">
    @using (Html.BeginForm("Profile", "Account", FormMethod.Post, new { @class = "form-horizontal" }))
    {
        @Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.", new { @class = "alert alert-block alert-error" })
        <fieldset>
            <div class="control-group">
                <label class="control-label">
                    First Name
                </label>
                <div class="controls">
                    @Html.TextBoxFor(m => m.FirstName, new { @class = "required" })
                    @Html.ValidationMessageFor(m => m.FirstName)
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
                    Email Address
                </label>
                <div class="controls">
                    @Html.TextBoxFor(m => m.Email, new { @class = "required email" })
                    @Html.ValidationMessageFor(m => m.Email)
                </div>
            </div>
            <div class="form-actions">
                <input type="submit" value="Update" class="btn btn-primary" />
            </div>
        </fieldset>
    }
</div>
