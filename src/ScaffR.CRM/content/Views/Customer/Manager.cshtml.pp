@{
    ViewBag.Title = "Customers";
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
        var CustomerEntity = function () {
            this.Id = 0;
            this.Created = null;
						this.Updated = ko.observable();
						this.FirstName = ko.observable();
						this.LastName = ko.observable();
						this.Phone = ko.observable();
						this.Address1 = ko.observable();
						this.Address2 = ko.observable();
						this.Zip = ko.observable();
						this.Country = ko.observable();
						this.EmailAddress = ko.observable();
									        };

        $(function () {
            //Setup viewmodel and trigger knockoutjs
            ViewModel.Debug = debugEnabled;
            ViewModel.Setup("Customer", CustomerEntity, pageSize, function (pageinfo) {
				setupPaging(pageinfo);
                var cmd = getQuerystring("cmd", null);
                var id = getQuerystring("id", null);
                var sender = getQuerystring("sender", null);
                if (cmd == 'add') {
                    ViewLogic.ShowAddDialog(id,sender);
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

		var LoadParentEditData = function(callback){					 
						
						callback();
		};
		
		var LoadParentAddData = function(id, sender, callback){
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
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tabs-1">Customer</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tabs-1">
                <a data-toggle="modal" href="#dialog-modal-add" class="btn btn-primary btn-medium" data-bind="click: function(){ LoadParentAddData(null,'',function(){});}">
                        Add Customer</a>
            </div>
            <table class="table table-condensed">
                <thead>
                    <tr>
												<th>												
                            Id
                        </th>						
												<th>												
                            FirstName
                        </th>						
												<th>												
                            LastName
                        </th>						
												<th>												
                            Phone
                        </th>						
												<th>												
                            Address1
                        </th>						
												<th>												
                            Address2
                        </th>						
												<th>												
                            Zip
                        </th>						
												<th>												
                            Country
                        </th>						
												<th>												
                            EmailAddress
                        </th>						
																														<th>
                            Created
                        </th>						
												<th>
                            Updated
                        </th>						
						                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody data-bind="foreach: Entities">
                    <tr>
												<td data-bind="text: Id">
                        </td>											
												<td data-bind="text: FirstName">
                        </td>											
												<td data-bind="text: LastName">
                        </td>											
												<td data-bind="text: Phone">
                        </td>											
												<td data-bind="text: Address1">
                        </td>											
												<td data-bind="text: Address2">
                        </td>											
												<td data-bind="text: Zip">
                        </td>											
												<td data-bind="text: Country">
                        </td>											
												<td data-bind="text: EmailAddress">
                        </td>											
													
																		<td data-bind="text: Created">
                        </td>                        					
												<td data-bind="text: Updated">
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
</div>
<div id="details" style="display: none;">
	<div>  
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="#tab-CustomerDetails" data-toggle="tab">Customer Details</a>				
			</li>
					</ul>
		<div  class="tab-content">
			<div id="tab-CustomerDetails"  class="tab-pane active">
    			<div data-bind="with: Entity">
										
				<label for="FirstName">
                	FirstName
            	</label>
            	<input type="text" id="FirstName" name="FirstName"  data-bind="value: FirstName" readonly />        		
										
				<label for="LastName">
                	LastName
            	</label>
            	<input type="text" id="LastName" name="LastName"  data-bind="value: LastName" readonly />        		
										
				<label for="Phone">
                	Phone
            	</label>
            	<input type="text" id="Phone" name="Phone"  data-bind="value: Phone" readonly />        		
										
				<label for="Address1">
                	Address1
            	</label>
            	<input type="text" id="Address1" name="Address1"  data-bind="value: Address1" readonly />        		
										
				<label for="Address2">
                	Address2
            	</label>
            	<input type="text" id="Address2" name="Address2"  data-bind="value: Address2" readonly />        		
										
				<label for="Zip">
                	Zip
            	</label>
            	<input type="text" id="Zip" name="Zip"  data-bind="value: Zip" readonly />        		
										
				<label for="Country">
                	Country
            	</label>
            	<input type="text" id="Country" name="Country"  data-bind="value: Country" readonly />        		
										
				<label for="EmailAddress">
                	EmailAddress
            	</label>
            	<input type="text" id="EmailAddress" name="EmailAddress"  data-bind="value: EmailAddress" readonly />        		
									
							<label>
                	Created
            	</label>
            	<input type="text" id="Created" name="Created"  data-bind="value: Created" readonly />        								
							<label>
                	Updated
            	</label>
            	<input type="text" id="Updated" name="Updated"  data-bind="value: Updated" readonly />        								
			        	<div>
            	<button data-bind="click: ViewLogic.ShowIndex" class="btn btn-primary">
                Back To List</button>        	
    		</div>
			</div>
		</div>
				</div>
	</div>
</div>
<div id="dialog-modal-edit" class="modal hide fade" style="display: none;">
    <form data-bind="submit: ViewLogic.UpdateDialogCommit">
	<div class="modal-header">
        <a class="close" data-dismiss="modal">[x]</a>
        <h3>
            Edit Customer</h3>
    </div>	
    <div class="modal-body" data-bind="with: Entity">
						<input type="hidden" id="Id" name="Id" data-bind="value: Id" />
						<div class="control-group">
				<label for="Created">
					Created
				</label>
				<input type="text" readonly id="Created" name="Created" data-bind="value: Created" />
			</div>
					
			<div class="control-group">
				<label for="FirstName">
                	FirstName
            	</label>				
											<input type="text" id="FirstName" name="FirstName" placeholder="Enter FirstName here" data-bind="value: FirstName" />
										            	
        	</div>
					
			<div class="control-group">
				<label for="LastName">
                	LastName
            	</label>				
											<input type="text" id="LastName" name="LastName" placeholder="Enter LastName here" data-bind="value: LastName" />
										            	
        	</div>
					
			<div class="control-group">
				<label for="Phone">
                	Phone
            	</label>				
														<input type="text" id="Phone" name="Phone" placeholder="Enter Phone here" data-bind="value: Phone" />
													            	
        	</div>
					
			<div class="control-group">
				<label for="Address1">
                	Address1
            	</label>				
											<input type="text" id="Address1" name="Address1" placeholder="Enter Address1 here" data-bind="value: Address1" />
										            	
        	</div>
					
			<div class="control-group">
				<label for="Address2">
                	Address2
            	</label>				
											<input type="text" id="Address2" name="Address2" placeholder="Enter Address2 here" data-bind="value: Address2" />
										            	
        	</div>
					
			<div class="control-group">
				<label for="Zip">
                	Zip
            	</label>				
											<input type="text" id="Zip" name="Zip" placeholder="Enter Zip here" data-bind="value: Zip" />
										            	
        	</div>
					
			<div class="control-group">
				<label for="Country">
                	Country
            	</label>				
											<input type="text" id="Country" name="Country" placeholder="Enter Country here" data-bind="value: Country" />
										            	
        	</div>
					
			<div class="control-group">
				<label for="EmailAddress">
                	EmailAddress
            	</label>				
														<input type="text" id="EmailAddress" name="EmailAddress" placeholder="Enter EmailAddress here" data-bind="value: EmailAddress" />
													            	
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
            Delete Factory</h3>
    </div>
    <div class="modal-body" data-bind="with: Entity">
        <h3>
            Do you reallt want to delete this Customer?</h3>
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
            Add Customer</h3>
    </div>
    <div class="modal-body">       
					<div class="control-group">
            	<label for="FirstName">
                FirstName
            	</label>
            								<input type="text" id="FirstName" name="FirstName" placeholder="Enter FirstName here" />
							        	</div>			
						<div class="control-group">
            	<label for="LastName">
                LastName
            	</label>
            								<input type="text" id="LastName" name="LastName" placeholder="Enter LastName here" />
							        	</div>			
						<div class="control-group">
            	<label for="Phone">
                Phone
            	</label>
            											<input type="text" id="Phone" name="Phone" placeholder="Enter Phone here" />
										        	</div>			
						<div class="control-group">
            	<label for="Address1">
                Address1
            	</label>
            								<input type="text" id="Address1" name="Address1" placeholder="Enter Address1 here" />
							        	</div>			
						<div class="control-group">
            	<label for="Address2">
                Address2
            	</label>
            								<input type="text" id="Address2" name="Address2" placeholder="Enter Address2 here" />
							        	</div>			
						<div class="control-group">
            	<label for="Zip">
                Zip
            	</label>
            								<input type="text" id="Zip" name="Zip" placeholder="Enter Zip here" />
							        	</div>			
						<div class="control-group">
            	<label for="Country">
                Country
            	</label>
            								<input type="text" id="Country" name="Country" placeholder="Enter Country here" />
							        	</div>			
						<div class="control-group">
            	<label for="EmailAddress">
                EmailAddress
            	</label>
            											<input type="text" id="EmailAddress" name="EmailAddress" placeholder="Enter EmailAddress here" />
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
<div id="debug" data-bind="visible: Debug">
    <hr />
    <h2>
        Debug (To turn of debugging set <i>"var debugEnabled = false;"</i> in _Layout.cshtml)</h2>
    <div data-bind="text: ko.toJSON(ViewModel)">
    </div>
</div>
