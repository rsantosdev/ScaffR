@{
    ViewBag.Title = "Emails";
    Layout = "~/Views/Shared/_Folder.cshtml";
    ViewBag.SitemapProvider = "Account";
}
@model List<$rootnamespace$.Models.EmailModel>
@foreach (var email in Model)
{
    <div class="well form-inline">
        <span>@email.EmailAddress</span>
        @if (email.IsDefault)
        {
            <span class="badge badge-success">Default</span>
        }
        <button class="btn pull-right">
            Delete
        </button>
    </div>
}
<form class="form-inline">
<h4>
    Add another email address</h4>
<input type="text" />
<input type="submit" class="btn btn-primary" value="Add" />
</form>
