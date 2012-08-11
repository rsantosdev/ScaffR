@model DHH.Web.Models.PaymentModel

@{
    ViewBag.Title = "Gateway";
}

<h2>Gateway</h2>

@using(Html.BeginForm())
{
    @Html.LabelFor(x=>x.CcNumber)
    @Html.EditorFor(x=>x.CcNumber)
    @Html.ValidationMessageFor(x=>x.CcNumber)
    
    <input type="submit" value="Submit"/>
}
