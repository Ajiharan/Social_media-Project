<%@page import="Database.UserFriendlist"%>
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

<%
UserFriendlist userFriendlist=new UserFriendlist();
	ArrayList<User> list=userFriendlist.getAvailableFriendsList(session.getAttribute("myids").toString());
	ArrayList<User> flist=userFriendlist.getFriendsList(session.getAttribute("myids").toString());
	if(list.size() > 0){
		for(User u2:flist){
			if(!u2.getId().equals(session.getAttribute("myids"))){

	%>

		<div class="container">
			 <div class="card flex-row flex-wrap mt-4">
			        <div class="card-header border-0">
			            <img src="view.jsp?mes_id=<%=u2.getId()%>" alt=""  class="img-thumbnail" style="height:100px;width:100px;">
			            
			        </div>
			        <div class="card-block px-2">
			            <h4 class="card-title"><%=u2.getName()%></h4>
			            <p class="card-text"><%=u2.getUsername() %></p>
			           
			           	<form action="RemoveFriend" method="post">
				           	<input type="hidden" name="remove_fid" value="<%= u2.getId()%>"/>
				           	<input type="hidden" name="remove_uid" value="<%= session.getAttribute("myids")%>"/>
				           	<input type="submit" style=" cursor: pointer; color:white" class="btn btn-warning" value="Undo request">
				        </form>
				       
			        </div>
			        <div class="w-100"></div>
			        
			  </div>
		</div>
		<%}}
			
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
			            <p class="card-text"><%=u1.getUsername() %></p>
			           
			           	<form action="AddFriend" method="post">
				           	<input type="hidden" name="Friend_Id" value="<%= u1.getId()%>"/>
				           	<input type="hidden" name="user_Id" value="<%= session.getAttribute("myids")%>"/>
				           	<input type="submit" style=" cursor: pointer; color:white" class="btn btn-primary" value="Add Friend">
				        </form>
				       
			        </div>
			        <div class="w-100"></div>
			        
			  </div>
		</div>
		<%}}
	
	
	
	
	}else{ %><h3 class="text-center">Please request some friends</h3><%} %>
	
</body>
</html>