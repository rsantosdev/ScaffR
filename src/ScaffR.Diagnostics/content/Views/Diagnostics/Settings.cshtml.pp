@using DHH.Web.Models
@{
    ViewBag.Title = "Settings";    
}
@model SettingsModel

    <table>
        <tr>
            <td>
                Environment:
            </td>
            <td>
                @Model.Environment.ToString()
            </td>
        </tr>
        <tr>
            <td>
                Security Option:
            </td>
            <td>
                @Model.SecurityOption.ToString()
            </td>
        </tr>
    </table>
