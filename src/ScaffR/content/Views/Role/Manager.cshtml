<!--
Copyright (c) 2012 
Ulf Björklund
http://average-uffe.blogspot.com/
http://twitter.com/codeplanner
http://twitter.com/ulfbjo

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//-->
@{
    ViewBag.Title = "SinglePage";
    Layout = "~/Views/Shared/_Folder.cshtml";
}
@if (false)
{ 
    <script src="/Scripts/knockout-2.0.0.js" type="text/javascript"></script>           
}
@section Scripts{
    <script type="text/javascript">
        var currentPage = 1,
            pageSize = 10;

        //Entity, Scaffolded!!!
        var RoleEntity = function () {
            this.Id = 0;
            this.Created = null;
            this.Updated = ko.observable();
            this.RoleName = ko.observable();
            this.Description = ko.observable();
            this.Users = ko.observableArray([]);
        };

        $(function () {
            //Setup viewmodel and trigger knockoutjs
            ViewModel.Debug = false;
            ViewModel.Setup("Role", RoleEntity, pageSize, function (pageinfo) {
                setupPaging(pageinfo);
                var cmd = getQuerystring("cmd", null);
                var id = getQuerystring("id", null);
                var sender = getQuerystring("sender", null);
                if (cmd == 'add') {
                    ViewLogic.ShowAddDialog(id, sender);
                }
                if (cmd == 'details') {
                    if (id != null) {
                        ViewModel.Activate(id);
                        ViewLogic.ShowDetails();
                    }
                }
                if (cmd == 'delete') {
                    if (id != null) {
                        ViewModel.Activate(id);
                        ViewLogic.ShowDeleteDialog();
                    }
                }
                if (cmd == 'edit') {
                    if (id != null) {
                        ViewModel.Activate(id);
                        ViewLogic.ShowEditDialog();
                    }
                }
                if (cmd == "index" || cmd == "") {
                    ViewLogic.ShowIndex();
                }
            });
        });

        var ViewLogic = {
            ShowAddDialog: function (id, sender) {
                $("#details").hide();
                LoadParentAddData(id, sender, function () { $('#dialog-modal-add').modal('show'); });
            },
            ShowEditDialog: function () {
                $("#details").hide();
                LoadParentEditData(function () { $('#dialog-modal-edit').modal('show'); });
            },
            HideAddDialog: function () {
                $('#dialog-modal-add').modal('hide');
            },
            HideEditDialog: function () {
                $('#dialog-modal-edit').modal('hide');
            },
            ShowDeleteDialog: function () {
                $("#details").hide();
                $('#dialog-modal-delete').modal('show');
            },
            HideDeleteDialog: function () {
                $('#dialog-modal-delete').modal('hide');
            },
            ShowDetails: function () {
                $("#index").hide();
                $("#details").show();
            },
            ShowIndex: function () {
                $("#details").hide();
                $("#index").show();
            },
            SaveDialogCommit: function (formElement) {
                ViewModel.Add($(formElement).serialize(), function (result) {
                    ViewLogic.HideAddDialog();
                    for (p in result) {
                        $("#" + p, "#dialog-modal-add").parent().removeClass('error');
                        $("#" + p, "#dialog-modal-add").val('');
                        $("#" + p, "#dialog-modal-add").popover('disable');
                    }
                    triggerChangePage(currentPage);
                }, function (result) {
                    for (p in result.ValidationErrors) {
                        $("#" + p, "#dialog-modal-add").parent().addClass('error');
                        $("#" + p, "#dialog-modal-add").data('title', 'Validation Error');
                        $("#" + p, "#dialog-modal-add").data('content', result.ValidationErrors[p].join(','));
                        $("#" + p, "#dialog-modal-add").popover();
                    }
                });
            },
            UpdateDialogCommit: function (formElement) {
                ViewModel.Update($(formElement).serialize(), function (result) {
                    ViewLogic.HideEditDialog();
                    for (p in result) {
                        $("#" + p, "#dialog-modal-edit").parent().removeClass('error');
                        $("#" + p, "#dialog-modal-edit").val('');
                        $("#" + p, "#dialog-modal-edit").popover('disable');
                    }
                }, function (result) {
                    for (p in result.ValidationErrors) {
                        $("#" + p, "#dialog-modal-edit").parent().addClass('error');
                        $("#" + p, "#dialog-modal-edit").data('title', 'Validation Error');
                        $("#" + p, "#dialog-modal-edit").data('content', result.ValidationErrors[p].join(','));
                        $("#" + p, "#dialog-modal-edit").popover();
                    }
                });
            },
            DeleteDialogCommit: function () {
                ViewModel.Remove(ViewModel.Entity());
                ViewLogic.HideDeleteDialog();
                triggerChangePage(currentPage);
            },
            ChangePage: function (entityName, cmd, id, sender) {
                window.location.href = "/" + entityName + "/SinglePage?cmd=" + cmd + "&id=" + id + "&sender=" + sender;
            }
        };

        var LoadParentEditData = function (callback) {

            callback();
        };

        var LoadParentAddData = function (id, sender, callback) {
            //for each parent, load data


            callback();
        };
        var RelatedData = {
            Load: function (entityName, callback) {
                $.getJSON("/" + entityName + "/GetAll/", {}, function (data) {
                    callback(data);
                });
            }
        };

        //Paging start
        var triggerChangePage = function (page) {
            ViewModel.ChangePage(page, pageSize, function (data) {
                setupPaging(data);
            });
        }

        var setupPaging = function (data) {

            // Setup paging... And yes I know it´s quite ugly :)           
            currentPage = data.CurrentPage;
            if (data.PagesCount == 1) {
                $(".pagination").empty();
                return;
            }
            var pagerContainer = $("<ul>");
            var numberOfLinks = 5;
            var start = data.CurrentPage - numberOfLinks;
            if (start < 1)
                start = 1;
            var stop = start + (numberOfLinks * 2) + 1;
            if (stop > data.PagesCount)
                stop = data.PagesCount;

            //Create first and prev links...
            if (data.CurrentPage != 1) {
                var first = $("<a href='#' data-page='1'>").text('first').bind('click', function () { triggerChangePage($(this).data('page')); }); ;
                pagerContainer.append($("<li>").append(first));
                var prev = $("<a href='#' data-page='" + (data.CurrentPage - 1) + "'>").text('prev').bind('click', function () { triggerChangePage($(this).data('page')); }); ;
                pagerContainer.append($("<li>").append(prev));
            }

            //Create page links
            for (p = start; p <= stop; p++) {
                if (data.CurrentPage == p) {
                    var l = $("<a href='#'>").text(p);
                    pagerContainer.append($("<li class='disabled'>").append(l));
                }
                else {
                    var l = $("<a href='#' data-page='" + p + "'>").text(p).bind('click', function () { triggerChangePage($(this).data('page')); });
                    pagerContainer.append($("<li>").append(l));
                }
            }

            //Create next last links
            if (data.CurrentPage != data.PagesCount) {
                var next = $("<a href='#' data-page='" + (data.CurrentPage + 1) + "'>").text('next').bind('click', function () { triggerChangePage($(this).data('page')); });
                pagerContainer.append($("<li>").append(next));
                var last = $("<a href='#' data-page='" + data.PagesCount + "'>").text('last').bind('click', function () { triggerChangePage($(this).data('page')); });
                pagerContainer.append($("<li>").append(last));
            }

            //Add paging...
            $(".pagination").empty().append(pagerContainer);
            //End of paging
        }
        //Paging end
        
    </script>
}
<div id="index">
    <div>
        <p>
            <a data-toggle="modal" href="#dialog-modal-add" class="btn btn-primary btn-medium"
                data-bind="click: function(){ LoadParentAddData(null,'',function(){});}">Create
                New Role</a>
        </p>
        <table class="table table-condensed">
            <thead>
                <tr>
                    <th>
                        Role
                    </th>
                    <th>
                        Description
                    </th>
                    <th>
                    </th>
                </tr>
            </thead>
            <tbody data-bind="foreach: Entities">
                <tr>
                    <td data-bind="text: RoleName">
                    </td>
                    <td data-bind="text: Description">
                    </td>
                    <td>
                        <ul class="nav nav-pills" style="margin-bottom: 0px;">
                            <li class="dropdown" style="margin: 0px;"><a style="margin-top: 0px; margin-bottom: 0px;
                                padding-bottom: 0px; padding-top: 0px;" class="dropdown-toggle" data-toggle="dropdown"
                                href="#">Action<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a data-toggle="modal" href="#dialog-modal-delete" data-bind="click: function(item){ $root.Select(item); }">
                                        Delete</a></li>
                                    <li><a data-toggle="modal" href="#dialog-modal-edit" data-bind="click: function(item){ $root.Select(item); LoadParentEditData(function(){}); }">
                                        Edit</a></li>
                                    <li><a href="#" data-bind="click: function(item){ $root.Select(item); ViewLogic.ShowDetails();}">
                                        Details</a></li>
                                </ul>
                            </li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="pagination pagination-centered">
        </div>
    </div>
</div>
<div id="details" style="display: none;">
    <div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-RoleDetails" data-toggle="tab">Role Details</a>
            </li>
            <li><a href="#childtabs-UserRole" data-toggle="tab">Users</a></li>
        </ul>
        <div class="tab-content">
            <div id="tab-RoleDetails" class="tab-pane active">
                <div data-bind="with: Entity">
                    <label for="RoleName">
                        RoleName
                    </label>
                    <input type="text" id="RoleName" name="RoleName" data-bind="value: RoleName" readonly />
                    <label for="Description">
                        Description
                    </label>
                    <input type="text" id="Description" name="Description" data-bind="value: Description"
                        readonly />
                    <div>
                        <button data-bind="click: ViewLogic.ShowIndex" class="btn btn-primary">
                            Back To List</button>
                    </div>
                </div>
            </div>
            <div id="childtabs-UserRole" class="tab-pane" data-bind="with: Entity">
                <button class="btn btn-primary" data-bind="click: function(){ ViewLogic.ChangePage('UserRole', 'add', $data.Id,'Role'); }">
                    Add UserRole</button>
                <button class="btn btn-primary" data-bind="click: function(){ ViewLogic.ChangePage('UserRole', 'index', $data.Id,'Role'); }">
                    View Users</button>
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th>
                                Id
                            </th>
                            <th>
                                UserId
                            </th>
                            <th>
                                RoleId
                            </th>
                        </tr>
                    </thead>
                    <tbody data-bind="foreach: Users">
                        <tr>
                            <td data-bind="text: Id">
                            </td>
                            <td data-bind="text: UserId">
                            </td>
                            <td data-bind="text: RoleId">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div id="dialog-modal-edit" class="modal hide fade" style="display: none;">
    <form data-bind="submit: ViewLogic.UpdateDialogCommit">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">[x]</a>
        <h3>
            Edit Role</h3>
    </div>
    <div class="modal-body" data-bind="with: Entity">
        <input type="hidden" id="Id" name="Id" data-bind="value: Id" />
        <div class="control-group">
            <label for="RoleName">
                Role
            </label>
            <input type="text" id="RoleName" name="RoleName" placeholder="Enter RoleName here"
                data-bind="value: RoleName" />
        </div>
        <div class="control-group">
            <label for="Description">
                Description
            </label>
            <input type="text" id="Description" name="Description" placeholder="Enter Description here"
                data-bind="value: Description" />
        </div>
    </div>
    <div class="modal-footer">
        <button class="btn" data-bind="click: ViewLogic.HideEditDialog">
            Cancel</button>
        <button type="submit" class="btn btn-primary">
            Save</button>
    </div>
    </form>
</div>
<div id="dialog-modal-delete" class="modal hide fade" style="display: none;">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">[x]</a>
        <h3>
            Delete Role</h3>
    </div>
    <div class="modal-body" data-bind="with: Entity">
        <h3>
            Do you reallt want to delete this Role?</h3>
    </div>
    <div class="modal-footer">
        <button class="btn" data-bind="click: ViewLogic.HideDeleteDialog">
            Cancel</button>
        <button type="submit" class="btn btn-primary" data-bind="click: ViewLogic.DeleteDialogCommit">
            Confirm Delete</button>
    </div>
</div>
<div id="dialog-modal-add" class="modal hide fade" style="display: none;">
    <form data-bind="submit: ViewLogic.SaveDialogCommit">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">[x]</a>
        <h3>
            Add Role</h3>
    </div>
    <div class="modal-body">
        <div class="control-group">
            <label for="RoleName">
                Role
            </label>
            <input type="text" id="RoleName" name="RoleName" placeholder="Enter RoleName here" />
        </div>
        <div class="control-group">
            <label for="Description">
                Description
            </label>
            <input type="text" id="Description" name="Description" placeholder="Enter Description here" />
        </div>
    </div>
    <div class="modal-footer">
        <button class="btn" data-bind="click: ViewLogic.HideAddDialog">
            Cancel</button>
        <button type="submit" class="btn btn-primary">
            Save</button>
    </div>
    </form>
</div>
