@{
    ViewBag.Title = "News";
    ViewBag.SitemapProvider = "Modules";
}
<div class="row-fluid">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#todo" data-toggle="tab"><i class="icon-check"></i>To-Do
            List</a> </li>
        <li><a href="#calendar" data-toggle="tab"><i class="icon-calendar"></i>Calendar</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="todo">
            @Html.Partial("_TodoPartial")
        </div>
        <div class="tab-pane" id="calendar">
            This is the calendar
        </div>
    </div>
</div>
