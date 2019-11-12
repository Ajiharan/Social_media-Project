package servlet;

import java.io.IOException;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Database.UserConnection;
import model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		// TODO Auto-generated method stub
		
		User user=new User();
		user.setName(request.getParameter("fname"));
		user.setUsername(request.getParameter("uname"));
		user.setPassword(request.getParameter("pswd"));
		
		UserConnection connection=new UserConnection();
		
		if(connection.checkUserName(user.getUsername())) {
			if(connection.RegisterUserDetails(user)) {
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		else {
			request.setAttribute("UsernameError","UserName is already exists");
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Register.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
