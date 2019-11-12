package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.UserFriendlist;

/**
 * Servlet implementation class RemoveFriend
 */
@WebServlet("/RemoveFriend")
public class RemoveFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myid=request.getParameter("remove_fid");
		String friend_id=request.getParameter("remove_uid");
		UserFriendlist userFriendlist=new UserFriendlist();
		System.out.println("dsdsd");
		System.out.println(friend_id);
		boolean isDeleted=userFriendlist.RemoveUser(friend_id,myid);
		
		if(isDeleted) {
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/friendlist.jsp");
			
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Home.jsp");
			
			dispatcher.forward(request, response);
		}
		
	}

}
