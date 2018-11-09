<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Inventory</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap.vertical-tabs.css">
<link href="css/jtable.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#example').jtable({
			title : 'The Item List',
			paging : true, //Enable paging
			pageSize : 5, //Set page size (default: 10)
			sorting : true, //Enable sorting
			defaultSorting : 'item_name ASC', //Set default sorting
			actions : {
				listAction : 'product?action=productlist',
				deleteAction : 'product?action=productcreate',
				updateAction : 'product?action=producupdate',
				createAction : 'product?action=productdelete'
			},
			fields : {
				item_id : {
					key : true,
					create : true,
					edit : true,
					list : true
				},
				item_name : {
					title : 'Name',
					width : '23%'
				},
				item_category : {
					title : 'Category',
					width : '23%'
				},
				item_costprice : {
					title : 'Cost'
				},
				item_unitprice : {
					title : 'Price'
				}
			}
		});

		//Load student list from server
		$('#example').jtable('load');

		$('#invoice').jtable({
			title : 'The Item List',
			paging : true, //Enable paging
			pageSize : 5, //Set page size (default: 10)
			sorting : true, //Enable sorting
			defaultSorting : 'item_name ASC', //Set default sorting
			actions : {
				listAction : 'product?action=productlist',
				deleteAction : 'product?action=productcreate',
				updateAction : 'product?action=producupdate',
				createAction : 'product?action=productdelete'
			},
			fields : {
				item_id : {
					key : true,
					create : true,
					edit : true,
					list : true
				},
				item_name : {
					title : 'Name',
					width : '23%'
					
				},
				item_category : {
					title : 'Category',
					width : '23%'
				},
				item_costprice : {
					title : 'Cost'
				},
				item_unitprice : {
					title : 'Price'
				}
			}
		});
		

		$('#example tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

		$('#button').click(function() {
			table.row('.selected').remove().draw(false);
		});

		$('#example tbody').on('dblclick', 'tr', function() {
			//console.log( table.row( this ).data().item_category );
			
			//$('#invoice tbody').closest("jtable-no-data-row").remove());
			$('#invoice').find('.jtable-no-data-row').remove();
			var tr = $(this).closest("tr").clone();
			src_row_no = tr.attr("data-record-key");
			row_found = $("#invoice tbody").find("[data-record-key='" + src_row_no + "']").length;
			if (row_found == 0)
				$("#invoice tbody").append(tr);	
			else
				alert("Alresdy Exists");
					
			
			
		});

	});
</script>
<style type="text/css">
#AddForm {
	display: none;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #474e5d;
	padding-top: 50px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}
</style>
</head>
<body>


	<div id="AddForm" class="modal">
		<form action="servlet/UpdateDb" class="form-horizontal modal-content"
			method="POST">
			Item ID:<br> <input type="text" name="itemId"><br>
			Item Name:<br> <input type="text" name="itemName" /><br>
			Item Category:<br> <input type="text" name="itemCat" /><br>
			Item Cost:<br> <input type="text" name="itemCost" /><br>
			Item Price:<br> <input type="text" name="itemPrice" /><br>
			<input type="submit" value="Save" />
			<button type="button"
				onclick="document.getElementById('AddForm').style.display='none'">Cancel</button>
		</form>
	</div>

	
	<div class=".container">
		<div class="row">
			<div class="col-xs-1">
				<!-- required for floating -->
				<!-- Nav tabs -->
				<ul class="nav nav-tabs tabs-left">
					<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
					<li><a href="#profile" data-toggle="tab"><span
							class="glyphicon glyphicon-floppy-open">Profile</span></a></li>
					<li><a href="#product" data-toggle="tab">Product</a></li>
					<li><a href="#messages" data-toggle="tab">Messages</a></li>
					<li><a href="#settings" data-toggle="tab">Settings</a></li>
				</ul>
			</div>
			<div class="col-xs-11">

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="home">Home</div>
					<div class="tab-pane" id="profile">Profile Tab.</div>
					<div class="tab-pane" id="product">
						<div class="row">
							<div class="col-xs-8">

								<div id="example"></div>
							</div>
							<div class="col-xs-4">
								<div id="invoice"></div>

							</div>
						</div>
						<div class="tab-pane" id="messages">Messages.</div>
						<div class="tab-pane" id="settings">Settings</div>
					</div>




				</div>

			</div>




		</div>
	</div>
</body>
</html>