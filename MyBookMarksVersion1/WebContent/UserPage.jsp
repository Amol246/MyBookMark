<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserPage</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css"  crossorigin="anonymous">
<script src="js/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<script src="umd/popper.min.js" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js" crossorigin="anonymous"></script>
<style type="text/css">
.navbar{
	background-color: rgb(7, 107, 117);
	}
	
.active1{
	background:rgb(22, 79, 103);
	}

.navbar-brand{
	 background:#292F33;
	}
</style>
</head>
<body>
   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
 <span class="glyphicon glyphicon-book"></span>  MyBookMarks</a>
    </div>
    <ul class="nav navbar-nav">
      <li class=""><a href="Home.jsp"><b>Home</b></a></li>
      <li class="">
        <a href="LabelServlet"><span class="glyphicon glyphicon-tag"></span>Labels</a>
      </li>
      <li class="">
        <a href="#"><span class="glyphicon glyphicon-bookmark"></span>BookMarks</a>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      <span class="glyphicon glyphicon-user"></span>
      <%--${sessionScope.uid}--%> <b><%=request.getAttribute("userName") %><!--${sessionScope.Username}--old code --></b><span class="caret"></span></a></a>
      <ul class="dropdown-menu">
          <li><a href="#">Change Password</a></li>
          <li><a href="RegisterLogin.jsp">Logout</a></li>
        </ul>
      </li>
      <!-- <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
    </ul>
  </div>
</nav> 
  
<div class="container">
  <b>User Login Successful</b>
<br></br>
<b>Please <a href="#">Create Profile</a>Upgrade your information</b>
</div>
</body>
</html>