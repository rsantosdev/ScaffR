@using DHH.Web.Models
@{
    ViewBag.Title = "Send Mail";
    
}
@model string
@using (Html.BeginForm())
{
    <table>
        <tr>
            <td>
                To:
            </td>
            <td><input name="toAddress" type="text"/>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <input type="submit" value="Send Email" />
            </td>
        </tr>
    </table>
}