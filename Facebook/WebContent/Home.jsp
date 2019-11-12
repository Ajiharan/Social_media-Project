<%@page import="java.util.ArrayList"%>
<%@page import="Database.UserMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.User"%>
<!DOCTYPE html>
<html>

<head>
	
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myids")== null){
		 response.sendRedirect("index.jsp");
	}



%>

<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>

<%UserMessage userMessage=new UserMessage();
	ArrayList<User> list=userMessage.getUsers();
	if(list.size() > 0){
		
	for(User u1:list){
		if(!u1.getId().equals(session.getAttribute("myids"))){

%>

	<div class="container">
		 <div class="card flex-row flex-wrap mt-4">
		        <div class="card-header border-0">
		            <img src="view.jsp?mes_id=<%=u1.getId()%>" alt=""  class="img-thumbnail" style="height:100px;width:100px;">
		        </div>
		        <div class="card-block px-2">
		            <h4 class="card-title"><%=u1.getName()%></h4>
		            <p class="card-text">Hi how are you thanusa?</p>
		           
		            <a data-toggle="modal" data-target="#<%=u1.getId() %>" style=" cursor: pointer; color:white" class="btn btn-primary" >Message</a>
		        </div>
		        <div class="w-100"></div>
		        
		  </div>
	</div>
	<%}}
	
	
	
	}else{ %><h3 class="text-center">Please request some friends</h3><%} %>
	<%UserMessage userMessage1=new UserMessage();
	ArrayList<User> list1=userMessage.getUsers();
	if(list.size() > 0){
		
	for(User u2:list1){

%>
	
	<div class="modal fade bd-example-modal-lg" id="<%=u2.getId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle"><%=u2.getName() %></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<form class="form-inline mr-auto mt-4">
					<div class="input-group col-md-12">
				     <textarea class="form-control" style="resize: none;" id="comment" placeholder="Enter your message"></textarea>
				      <span class="input-group-append">
				        <button class="btn btn-outline-secondary" type="submit">
				            <i class="fa fa-send"></i>
				        </button>
				      </span>
					</div>
				</form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%} } %>
</body>
</html>