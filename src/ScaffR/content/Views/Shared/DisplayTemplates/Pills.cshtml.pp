@using $rootnamespace$.Helpers
@model $rootnamespace$.Extensions.PillsHelperModel
 <ul class="nav nav-pills nav-stacked">
          
        @foreach (var node in Model.Nodes)
        {            
            <li class="@Html.AddClass("active", node.IsCurrentNode || node.IsInCurrentPath && !node.IsRootNode)"><a href="@Url.Action(node.Action, node.Controller)">
                                                                                                 <i class="@node.ImageUrl @Html.AddClass("icon-white", node.IsCurrentNode || node.IsInCurrentPath && !node.IsRootNode)"></i>
                                                                                                 @node.Title
                                                                                             </a></li>            
        }
    </ul>