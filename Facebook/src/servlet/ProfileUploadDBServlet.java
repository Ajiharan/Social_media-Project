package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Database.UserConnection;



/**
 * Servlet implementation class ProfileUploadDBServlet
 */
@WebServlet("/ProfileUploadDBServlet")
@MultipartConfig(maxFileSize = 161772150) 
public class ProfileUploadDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		   String mes="*No profile Image Selected*";
//	         AirlineSql myair=new AirlineSql();
	        InputStream inputStream = null; // input stream of the upload file
	        
			String myid=request.getParameter("id");
	         
	        // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("photo");
	        boolean isTrue=false;
//	        if(request.getPart("photo").getSize()==0) {
//	        	isTrue=true;
//	        	response.sendRedirect("EditProfile.jsp?mes="+mes+"");
//	        }
	        if(!isTrue) {
	        	
	       
		        if (filePart != null) {
		            // prints out some information for debugging
		            System.out.println(filePart.getName());
		            System.out.println(filePart.getSize());
		            System.out.println(filePart.getContentType()); 
		            // obtains input stream of the upload file
		            inputStream = filePart.getInputStream();
		            UserConnection connection=new UserConnection();
			        boolean rowAffected=connection.ProfileUpdate(myid, inputStream);
			            // forwards to the message page
			        if(rowAffected) {
			        	PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('sccessfully updated...!!!');");
						out.println("location='AddEmployee.jsp';");
						out.println("</script>");
			        	   getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
			        }
			        else {
			        	PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('unsccessfull...!!!');");
						out.println("location='AddEmployee.jsp';");
						out.println("</script>");
			        	   getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
			        }
		        }
		       
		            
	        }
	}

}
