<%@page import="Database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
String getid=request.getParameter("mes_id");
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myids")==null){
		 response.sendRedirect("index.jsp");
	}



%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%

Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
try {
DBConnection db=new DBConnection();
con =db.ConnectDB();
String sqlQuery="select photo from profile where uid=? and id=(select max(id) from profile where uid=?)";
PreparedStatement ps=con.prepareStatement(sqlQuery);
ps.setString(1, getid);
ps.setString(2,  getid);
 rs=ps.executeQuery();
if (rs.next()) {
image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());
}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");

}
// display the image
response.setContentType("image/jpg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());

} 
%>
</body>
</html>