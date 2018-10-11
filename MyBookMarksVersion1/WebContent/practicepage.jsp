<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="image/book-icon2.ico" />
<title>Label page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.12.4.js" ></script>
<script src="DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
<script src="DataTables/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
<script src="DataTables/DataTables-1.10.16/css/jquery.dataTables.min.css"></script>
<!-- <script type="text/javascript" src="js/table-demo.js"></script>-->
  <!-- 
 <script type="text/javascript">
 var basePath = &#039;${pageContext.request.contextPath}&#039;;
 </script> -->

<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-add').on("click",function(){
			var lname=$("#lname").val();
			var lnote=$("#lnote").val();
			
			$.ajax({
				url:"LabelServlet",
				data:{lname:lname,lnote:lnote},
				type:"post",
				success : function(res){
					$("#UserNames").append("<li>"+lname+"</li>");
					$("#msg").html("save record");
				},
				error:function(){
					$("#msg").html("Cannot save record");
				}
			});
			
			
		});
	});


/* var count=0;
	function addRow() {
		
		
		//get input value
		var labelname = document.getElementById('label-name').value;
		var notetext = document.getElementById('note-text').value;
		
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
		
		//get the html table
		// 0 = the first table
		var table = document.getElementsByTagName('table')[0];
		
		// add new empty row to the table
		// 0 = in the top
		//var newRow = table.insertRow(1);= add row from top of table;
		// table.rows.length = the end of table row.
		// table.rows.length/2+1 = the center of table 
		var newRow = table.insertRow(table.rows.length-1);
		
	
		//add cells to the row
		var cel0 = newRow.insertCell(0);
		var cel1 = newRow.insertCell(1);
		var cel2 = newRow.insertCell(2);
		var cel3 = newRow.insertCell(3);
		var cel4 = newRow.insertCell(4);
		var cel5 = newRow.insertCell(5);
		
		//add values to the cells
		cel0.innerHTML = count;
		cel1.innerHTML = labelname;
		cel2.innerHTML = notetext;
		cel3.innerHTML = today;
		cel4.innerHTML = "edit";
		cel5.innerHTML = "delete";
	}
 */
</script> 

<!-- <script>
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
var newRowCounter = 1;
var ourRow = document.getElementById("our-row");
var ourButton = document.getElementById("our-button");

function createNewRow(){
	var labelname = document.getElementById('label-name').value;
	var notetext = document.getElementById('note-text').value;
	
	//get the html table
	// 0 = the first table
	var table = document.getElementsByTagName('table')[0];
	
	// add new empty row to the table
	// 0 = in the top
	//var newRow = table.insertRow(1)= add row from top of table;
	// table.rows.length = the end of table row.
	// table.rows.length/2+1 = the center of table 
	var newRow = table.insertRow(table.rows.length-1);

	//add cells to the row
	var cel1 = newRow.insertCell(0);
	var cel2 = newRow.insertCell(1);
	
	//add values to the cells
	cel1.innerHTML = labelname;
	cel2.innerHTML = notetext;

	
	ourRow.innerHTML +="<tr><td>"+newRowCounter+"</td><td>"+cel1+"</td><td>"+cel2+"</td><td>"
						+today+"</td><td><span class="glyphicon glyphicon-pen"></span><button></button></td><td><span class="glyphicon glyphicon-tag"></span></td></tr>";
	newRowCounter++;
}


</script>
 -->
<link rel="stylesheet" type="text/css"	href="DataTables/DataTables-1.10.16/css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" type="text/css"	href="DataTables/datatables.min.css" />
<style type="text/css">
.container {
	padding: 0px;
}

/* tr.odd{
display:none;
 } */

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
			<li class=""><a href="Home.jsp"><b>Home</b></a></li>
			<li class=""><a href="#"><span
					class="glyphicon glyphicon-tag"></span>Labels</a></li>
			<li class=""><a href="#"><span
					class="glyphicon glyphicon-bookmark"></span>BookMarks</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <span
					class="glyphicon glyphicon-user"></span> <b>${sessionScope.Username}</b><span
					class="caret"></span></a></a>
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
							<input type="text" class="form-control" name="label-name" id="lname">
						</div>
						<div class="form-group">
							<label for="note-text" class="col-form-label">Note:</label>
							<textarea class="form-control" name="note-text" id="lnote"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addRow();">Save</button> -->
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="btn-add" value="Save" name="action">Save</button>

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
					<button type="button" class="btn btn-primary btn-update" data-dismiss="modal" id="" value="Update" name="action">Update</button>
				</div>
			</div>
		</div>
	</div>

<!-- --------------- end edit model------- -->
<!--  try for ajax call edit model -->
<script type="text/javascript">
	$(document).ready(function(){
		$('.btn-edit').click(function(){
			$.get('LabelServlet',function(responseText){
				$('#myTable').text(responseText);
				
			});
		});
	});

	
	$(".btn-edit").click(function(){
		$.ajax({
			url:''
		});
		
	});
</script>

<!-- ------- -->
<div id="userList">
		<ul id="UserNames">
			
		</ul>
	</div>

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
			<!-- <tbody id="lableTBody">
			</tbody> -->
		<tbody>
		<c:forEach var="label" items="${requestScope.labelList}">
                <tr>
                    <td>${label.labelId}</td>
                    <td>${label.labelName}</td>
                    <td>${label.note}</td>
                    <td>${label.createdOn}</td>
                    <td>
                        <a href="/edit?id=${label.labelId}"><button type="button" data-toggle="modal" data-target="#edit-label-modal" class="btn btn-success btn-edit"><span class="glyphicon glyphicon-pencil"></span></button></a>
                        <a href="/delete?id=${label.labelId}"><button type="button" class="btn btn-danger btn-delete"><span class="glyphicon glyphicon-trash"></span></button></a>                     
                    </td>
                </tr>
            </c:forEach>
		</tbody>
	
	
			<%-- <tbody>
				<%
					if (request.getAttribute("labelList") != null) {
						List<LabelBean> labelList = (List<LebelBean>) 
							request.getAttribute("labelList");
				%>
				<%
					if (labelList != null) {
					for (LabelBean label : listView) {
				%>
				<tr>
					<td></td>
					<td><%=label.getLabelName()%></td>
					<td><%=label.getNote()%></td>
					<td><%=label.getCreatedOn()%></td>
					<td></td>
					
				</tr>
				<%}
					}

				}%>

			</tbody>
 --%>
		</table>
</div>

	
<script type="text/javascript">


/* $(document).ready(function () {
    var mytable = $('.table').DataTable({
        "paging": true,
            "lengthChange": true,
            "searching":true,
            "ordering": true ,
            "info": true,
            "autoWidth": false,
            "sDom": 'lfrtip'
    });
    mytable.row.add(['asdsa34id', 'asdsa34id', 'asdsa34id', 'asdsa34id', 'asdsa34id']);
    mytable.draw();
}); */

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
		}
	});
	
	$(document).on('click','.btn-delete',function(){
		$(this).closest('tr').remove();
	});
	
  $('.Table').on('click','tbody tr', function(){
		myTable.row(this).edit();
	});
});
</script>

</body>
</html>