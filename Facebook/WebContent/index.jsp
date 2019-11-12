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
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4 text-center">Welcome To The Nature World</h1>
	    <p class="lead text-center">This is an social media for nature lovers...</p>
	  </div>
	</div>


<div class="container">
	<div class="row">
		<div class="col-md-3"></div>	
		<div class="col-md-5">
			<h3 class="text-center">Login Form</h3>
		<form action="LoginServlet" class="needs-validation" name="myForm" method="post" novalidate>
			  <div class="form-group">
			    <label for="uname">Username:</label>
			    <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
			    <div class="valid-feedback">Valid.</div>
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  <div class="form-group">
			    <label for="pwd">Password:</label>
			    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
			  
			    <div class="invalid-feedback">Please fill out this field.</div>
			  </div>
			  
			 	<% 
						
					String name=request.getParameter("name");
					if(session.getAttribute("myids")==null && name !=null){
						out.println("<script>");
						out.println("alert('Invalid Login...!!!');");
					
						out.println("</script>");
							
				} %>
				
			  <button type="submit" class="btn btn-primary">Login</button>
			  <a href="Register.jsp"> I don't have any account</a>
			</form>
			
			<script>
			// Disable form submissions if there are invalid fields
			(function() {
			  'use strict';
			  window.addEventListener('load', function() {
			    // Get the forms we want to add validation styles to
			    var forms = document.getElementsByClassName('needs-validation');
			    // Loop over them and prevent submission
			    var validation = Array.prototype.filter.call(forms, function(form) {
			      form.addEventListener('submit', function(event) {
			        if (form.checkValidity() === false) {
			          event.preventDefault();
			          event.stopPropagation();
			        }
			        form.classList.add('was-validated');
			      }, false);
			    });
			  }, false);
			})();
			</script>
		
		</div>
		<div class="col-md-4"></div>	
	</div>

</div>
 
</body>
</html>