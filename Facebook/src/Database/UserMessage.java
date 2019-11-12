package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.User;
import util.SocialSql;

public class UserMessage {
	private Connection con;
	private Statement st;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserMessage() {
		con=DBConnection.ConnectDB();
	}
	
	public ArrayList<User> getUsers(){
		ArrayList<User> list=new ArrayList<User>();
		
	
		try {
			ps=con.prepareStatement(SocialSql.GET_USER_NAME);
			rs=ps.executeQuery();
			while(rs.next()) {
				User u1=new User();
				u1.setId(rs.getString(1));
				u1.setName(rs.getString(2));
				u1.setUsername(rs.getString(3));
				list.add(u1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		finally {
			try {
				ps.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return list;
	}
	
}
