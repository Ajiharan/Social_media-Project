package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.UserFriendlist;
import Database.UserMessage;
import model.User;

/**
 * Servlet implementation class AddFriend
 */
@WebServlet("/AddFriend")
public class AddFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String myid=request.getParameter("user_Id");
		String friend_id=request.getParameter("Friend_Id");
		UserFriendlist userFriendlist=new UserFriendlist();
		boolean isRequested=userFriendlist.Addfriend(myid, friend_id);
		
		if(isRequested) {
			
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/friendlist.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/friendlist.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
