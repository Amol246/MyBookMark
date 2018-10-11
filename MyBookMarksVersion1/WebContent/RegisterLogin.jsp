<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register-Login</title>
<link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	

<script>
<%--old code------------------
 function validateform(){  
	var msg='<%=session.getAttribute("Message") %>';
	if(!msg)
	{
		document.getElementById("status").innerText=""; 
		msg.hide();
		return false;
		
	}else{
			
		document.getElementById("status").innerText=msg;  
		document.getElementById("status").style.display= 'block';
		//return false;
	}
	} --%>
 
</script>

<style>
/* #status {
	color: red; }*/

</style>

</head>
<body>
<div id="container_demo">
	<a class="hiddenanchor" id="toregister"></a>
	<a class="hiddenanchor" id="tologin"></a>
	<div id="wrapper">
	<span id="amit"> </span>  
	<div id="login" class="animate form">
			<form  name="vinform" action="RegisterServlet" autocomplete="on" method="post" onsubmit="return validateform()"> 
				<h1>Log in</h1> 
				
				
				<span id="status" style="color:red"></span>
				 
				<%-- <div id="p" name="p">
			         <div class="alert alert-danger" >
				 	${sessionScope.Message}
				 	 </div>
			     </div> --%> 
			     
<div><!-- new code --- background-color:#FFA3F9; border-color:#F42894; border-style: solid; border-width: 2px; padding: 10px"--- -->    
    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
    		: request.getAttribute("errMessage")%></span><br/>
</div>
			     				 
				<p> 
					<label for="username" class="uname" data-icon="u" > Your email or username </label>
					<input id="username" name="username" required="required" type="text" placeholder="myusername"  onkeyup="sendInfo()"/>
				</p>
				<p> 
					<label for="password" class="youpasswd" data-icon="p"> Your password </label>
					<input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
				</p>
				<p class="keeplogin"> 
					<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
					<label for="loginkeeping">Keep me logged in</label>
				</p>
				<p class="login button"> 
					<input type="submit" value="Login" id="btnSubmit" name="action"/> 
				</p>
				<p class="change_link">
					Not a member yet ?
					<a href="#toregister" class="to_register">Join us</a>
				</p>
			</form>
		</div>
<!-- --------------------- -->
<!-- <script type="text/javascript">

$("#login").on('click', function(){
    var username = $("#username").val();
    var password = $("#password").val();
    if(username == ""){
        $('#messageDiv').css("display","none");
        alert("Username is required");
        return;
    }
    if(password == ""){
        $('#messageDiv').css("display","none");
        alert("Password is required");
        return;
    }

</script>
 -->

		<div id="register" class="animate form">
			<form  action="RegisterServlet" autocomplete="on" method="post"> 
				<h1> Sign up </h1> 
				<p> 
					<label for="usernamesignup" class="uname" data-icon="u">Your username</label>
					<input id="usernamesignup" name="username" required="required" type="text" placeholder="mysuperusername690" />
				</p>
				<p> 
					<label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
					<input id="emailsignup" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/> 
				</p>
				<p> 
					<label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
					<input id="passwordsignup" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p> 
					<label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
					<input id="passwordsignup_confirm" name="confPassword" required="required" type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p class="signin button"> 
					<input type="submit" value="Register" name="action"/> 
				</p>
				<p class="change_link">  
					Already a member ?
					<a href="#tologin" class="to_register"> Go and log in </a>
				</p>
			</form>
		</div>
		
	</div>
</div>  
</body>
</html>