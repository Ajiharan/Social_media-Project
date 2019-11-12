<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
 .navbar .nav1  :hover{
	background-color: #555;
  		color: white;
}

.p1 a:hover{
	background-color:powderblue;
  		color: white;
}

</style>
 <meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Insert title here</title>
</head>

<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-info">
  <a class="navbar-brand" style="color:white;"  href="#">Nature</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav nav1" >
      <li class="nav-item active">
        <a class="nav-link" style="color:white;" href="Home.jsp"><i class="fa fa-home" style="font-size:20px;color:white;"></i> Home </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="color:white;" href="#"><i class="fa fa-info" style="font-size:20px;color:white;"></i> About page </a>
      </li>
      <li class="nav-item">
      <i class="fas fa-user-friends"></i>
        <a class="nav-link" style="color:white;" href="#"><i class="fa fa-user-plus" style="font-size:20px;color:white;"></i> Friend request </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" style="color:white;" href="friendlist.jsp"><i class="fa fa-group" style="font-size:20px;color:white;"></i> Friends </a>
      </li>
    
    </ul>
     <ul class="nav navbar-nav ml-auto">
	     <li class="nav-item">
	      <form action="LogoutServlet" method="post">  <a class="nav-link" style="color:white;"><i class="fa fa-sign-out" style="font-size:20px;color:white;"></i> <button  style="margin-top:-7px;" type="submit" class="btn btn-info">logout</button></a></form>
	      </li>
      
     </ul>
  </div>
</nav>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
				<img src="./view.jsp?mes_id=<%=session.getAttribute("myids").toString()%>" class="rounded-circle mt-3 " style="height:55px;width:55px;object-fit: cover;" alt="No image">
				<b><span class="lead bg-success" style="color:white;">${username }</span></b>
				<p class="p1"> <a data-toggle="modal" data-target="#profileUpdate" style=" cursor: pointer; color: black" class="btn btn-default cls1" ><b>Update</b></a></p>
		</div>
		<div class="col-md-6">
			<form class="form-inline mr-auto mt-4">
				<div class="input-group col-md-12">
			      <input class="form-control py-2" type="search" placeholder="search" id="example-search-input">
			      <span class="input-group-append">
			        <button class="btn btn-outline-secondary" type="button">
			            <i class="fa fa-search"></i>
			        </button>
			      </span>
				</div>
			</form>
		</div>
	
	</div>
</div>


	<div class="modal fade bd-example-modal-lg" id="profileUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">Edit Profile</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
	      		<div class="col-md-6">
	      		<%String id=session.getAttribute("myids").toString(); %>
	      			<h4 style="margin-top: 10px;">Change Profile</h4>
	      			<form method="post" class="form-horizontal" action="ProfileUploadDBServlet?id=<%=id%>" enctype="multipart/form-data">
	      			
	      			 	<img src="./view.jsp?mes_id=<%=session.getAttribute("myids").toString()%>" id ="previewimg" style="height:250px;width:300px;object-fit: contain;"  class="img-thumbnail" alt="Cinque Terre">
	      			 	<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label"> Upload Image</label>	 
							<div class="col-sm-10">
								<input type="file" name="photo" id='file' class="form-control" size="50"/>
							</div>
						</div>
					 	<button type="submit" style="margin-top:20px;margin-left:80px;" class="btn btn-primary">Update Profile</button>
					</form>
	      		</div>
	      		<div class="col-md-6">
	      			<h4 style="margin-top: 10px;">Change Password</h4>
					<form method="post" action="profile">
					  <input type="hidden" name="type" value="change_password">
					  <div class="form-group">
					    <label for="password">Password</label>
					    <input type="password" class="form-control" id="password" name="password" required placeholder="Type your new password">
					  </div>
					  <div class="form-group">
					    <label for="cpassword">Confirm Password</label>
					    <input type="password" class="form-control" id="cpassword" name="cpassword" required placeholder="Type your confirm password">
					  </div>
					  <button type="submit" style="float: right;" class="btn btn-primary">Update Password</button>
					</form>
	      		</div>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	 <script type="text/javascript">
	$(document).ready(function() {
// Function for Preview Image.
$(function() {
$(":file").change(function() {
if (this.files && this.files[0]) {
var reader = new FileReader();
reader.onload = imageIsLoaded;
reader.readAsDataURL(this.files[0]);
}
});
});
function imageIsLoaded(e) {
$('#message').css("display", "none");

$('#previewimg').attr('src', e.target.result);
};
$("#file").click(function() {


});
});

</script>
</body>
</html>