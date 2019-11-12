<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function validateForm() {
  var x = document.forms["myForm"]["pswd"].value;
  var y = document.forms["myForm"]["rpswd"].value;
  if (x != y) {
	 document.getElementById("pwd").value = "";
	 document.getElementById("rpwd").value = "";
   	 alert("Password didn't match");
    return false;
  }
}
</script>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4 text-center">Welcome To The Nature World</h1>
	    <p class="lead text-center">This is an social media for nature lovers...</p>
	  </div>
	</div>
<%
String unameError=(String)request.getAttribute("UsernameError");
%>

<div class="container">
	<div class="row">
		<div class="col-md-3"></div>	
		<div class="col-md-5">
			<h3 class="text-center">Register Form</h3>
			<form action="RegisterServlet" class="was-validated" name="myForm" onsubmit="return validateForm()" method="post">
			<div class="form-group">
			    <label for="uname">FullName:</label>
			    <input type="text" class="form-control" id="fname" placeholder="Enter name" name="fname" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="form-group">
			    <label for="uname">Username:</label>
			    <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			    <p style="color:red;">
					<%if(unameError !=null){
						out.println("<script>");
						out.println("alert('Username already exists...!!!');");
					
						out.println("</script>");
					} %>	
				</p>
			  </div>
			  <div class="form-group">
			    <label for="pwd">Password:</label>
			    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="form-group">
			    <label for="pwd">Re-Password:</label>
			    <input type="password" class="form-control" id="rpwd" placeholder="Enter Re password" name="rpswd" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="form-group form-check">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" name="remember" required> I agree term of conditions.
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">Check this checkbox to continue.</div>
			    </label>
			  </div>
			  <button type="submit" class="btn btn-primary">Register</button>
			  <a href="index.jsp"> I already have an account</a>
			</form>
		
		</div>
		<div class="col-md-4"></div>	
	</div>

</div>

</body>
</html>