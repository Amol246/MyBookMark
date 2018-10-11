<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="image/book-icon2.ico" />
<title>Label page</title>
<link rel="stylesheet" href="css/bootstrap.min.css"	crossorigin="anonymous">
<script src="js/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<script src="umd/popper.min.js" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" crossorigin="anonymous"></script>
<script src="js/jquery-1.12.4.js" ></script>
<script src="DataTables/DataTables-1.10.16/css/jquery.dataTables.min.css"></script>

<link rel="stylesheet" type="text/css"
	href="DataTables/DataTables-1.10.16/css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<style type="text/css">
.container {
	padding: 0px;
}

tr.odd{
display:none;
 }

</style>



<style type="text/css">
.navbar {
	/*background:rgb(7, 79, 79);
	background:rgb(0, 56, 79);	*/
	/*background:#006699;*/
	background-color: rgb(7, 107, 117);
}

.active1 {
	background: rgb(22, 79, 103);
}

.navbar-brand {
	/* background:rgb(154, 73, 1);
 */
	/*background:rgb(0, 0, 103);*/
	/* background: rgb(40, 137, 154);*/
	background: #292F33;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> <span
				class="glyphicon glyphicon-book"></span> MyBookMarks
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li class=""><a href="#"><b>Home</b></a></li>
			<li class=""><a href="#"><span
					class="glyphicon glyphicon-tag"></span>Labels</a></li>
			<li class=""><a href="#"><span
					class="glyphicon glyphicon-bookmark"></span>BookMarks</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <span
					class="glyphicon glyphicon-user"></span> <%--old code <b>${sessionScope.Username}</b> --%>
					<span class="glyphicon glyphicon-user"></span>
       				<b><%=request.getAttribute("userName") %></b>
					<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Change Password</a></li>
					<li><a href="RegisterLogin.jsp">Logout</a></li>
				</ul></li>
			<!-- <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
		</ul>
	</div>
	</nav>

	<!-- Button trigger modal -->
	<div class="container" align="center">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#add-label-modal">Add Labels</button>
	</div>


	<!-- Modal for Add -->
	<div class="modal fade" id="add-label-modal" tabindex="-1"
		role="dialog" aria-labelledby="Add Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						<b>Add a BookMark Label</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="label-name" class="col-form-label">LabelName:</label>
							<input type="text" class="form-control" name="label-name" id="">
						</div>
						<div class="form-group">
							<label for="note-text" class="col-form-label">Note:</label>
							<textarea class="form-control" name="note-text" id=""></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addRow();">Save</button> -->
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="btn-add">Save</button>

				</div>
			</div>
		</div>
	</div>

<!-- --------------- end add model------- -->

<!-- Modal for edit -->
	<div class="modal fade" id="edit-label-modal" tabindex="-1"
		role="dialog" aria-labelledby="edit Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						<b>Edit a BookMark Label</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="label-name" class="col-form-label">LabelName:</label>
							<input type="text" class="form-control" name="label-name" id="labelEdit">
						</div>
						<div class="form-group">
							<label for="note-text" class="col-form-label">Note:</label>
							<textarea class="form-control" name="note-text" id="noteEdit"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary btn-update" data-dismiss="modal" id="">Update</button>
				</div>
			</div>
		</div>
	</div>

<!-- --------------- end edit model------- -->
	<div>
		<table id="myTable"	class="table table-striped table-bordered table-hover" width="100%"
			cellspacing="0">
			<thead>
				<tr>
					<th>Sr.No.</th>
					<th>Name</th>
					<th>Note</th>
					<th>Current date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Sr.No.</th>
					<th>Name</th>
					<th>Note</th>
					<th>Current date</th>
					<th>Action</th>
				</tr>
			</tfoot>

			<tbody id="lableTBody">
					
			</tbody>
		</table>
	</div>

	<script src="DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="DataTables/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
	
<script type="text/javascript">

$(document).ready(function(){
    $('#myTable').DataTable();
});
	
	
	
 $(function() {
	var count = 0;
	$('#btn-add').click(function(){
		//declare variable
		var _label = $('input[name="label-name"]').val();
		var _note = $('textarea[name="note-text"]').val();
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy=today.getFullYear();

		if(dd<10)
		{
			dd='0'+dd;
		}
		if(mm<10)
		{
			mm='0'+mm;
		}

		today=yyyy+'/'+mm+'/'+dd;

		count=count+1;

		
		var _tr = '<tr><td>'+count+'</td><td>'+_label+'</td><td>'+_note+'</td><td>'+today+'</td><td><button type="button" data-toggle="modal" data-target="#edit-label-modal" class="btn btn-success btn-edit"><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-danger btn-delete"><span class="glyphicon glyphicon-trash"></span></button></td></tr>';
		
		$('tbody').append(_tr);
		
	});
	
	var _trEdit=null;
	$("#lableTBody").on('click','.btn-edit',function(){
		_trEdit = $(this).closest('tr');
		var _label = $(_trEdit).find('td:eq(1)').text();
		var _note = $(_trEdit).find('td:eq(2)').text();

		$('input[name="label-name"]').val(_label);
		$('textarea[name="note-text"]').val(_note);
	});
	
	
	
	$('.btn-update').click(function(){
		if(_trEdit){
			var _label = $("#labelEdit").val();
			var _note = $("#noteEdit").val();
			
			 $(_trEdit).find('td:eq(1)').text(_label);
			 $(_trEdit).find('td:eq(2)').text(_note);
	
			 alert("Record has been updated..!")
		/* 	_trEdit = null; */
		}
	});
	
	$(document).on('click','.btn-delete',function(){
		$(this).closest('tr').remove();
	});
	
  $('#myTable').on('click','tbody tr', function(){
		myTable.row(this).edit();
	});
	
	myTable.row(':eq(1)').edit({
		title:'Edit first row'
	});
	/* 
	$('#myTable').on('click','tbody tr', function(){
		myTable.row(this).edit({
			buttons:[
				label:'Cancel', fn:function(){this.close();}},'Edit'
				]
		});
	 
	});*/ 
	
});
</script>

</body>
</html>