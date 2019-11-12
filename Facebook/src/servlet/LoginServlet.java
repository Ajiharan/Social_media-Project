package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.UserConnection;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		User user=new User();
		user.setUsername(request.getParameter("uname"));
		user.setPassword(request.getParameter("pswd"));
		
		UserConnection connection=new UserConnection();
		User u1=connection.LoginUser(user);
		
		if(u1.isCorrect()){
			HttpSession session=request	.getSession();
			
			String id=u1.getId();
			
			session.setAttribute("myids", id);
			session.setAttribute("username",u1.getUsername());
			
			response.sendRedirect("Home.jsp?id="+id+"");
		}
		else {
			String error="Invalid Email_id/Password";
			response.sendRedirect("index.jsp?name="+error+"");
		}
		
	}

}
