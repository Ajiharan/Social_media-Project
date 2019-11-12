package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.User;
import util.SocialSql;

public class UserFriendlist {
	private Connection con;
	private Statement st;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserFriendlist() {
		con=DBConnection.ConnectDB();
	}
	
	public boolean Addfriend(String uid,String fid) {
		int rowAffected=0;
		try {
			ps=con.prepareStatement(SocialSql.INSERT_FRIENDLIST_DETAILS);
			ps.setString(1, uid);
			ps.setString(2,fid);
			ps.setString(3,"1");
			
			 rowAffected=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		finally {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return (rowAffected > 0);
	}
	public ArrayList<User> getFriendsList(String uid){
		ArrayList<User> list =new ArrayList<User>();

		try {
			ps=con.prepareStatement(SocialSql.GET_FRIENDS_DETAILS);
			ps.setString(1,uid);
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
	public ArrayList<User> getAvailableFriendsList(String uid){
		ArrayList<User> list =new ArrayList<User>();

		try {
			ps=con.prepareStatement(SocialSql.GET_AVAILABLE_FRIENDS);
			ps.setString(1,uid);
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
	
	public boolean RemoveUser(String uid,String fid) {
			int rowsdeleted=0;
			try {
				ps=con.prepareStatement(SocialSql.REMOVE_CURRENT_FRIEND);
				ps.setString(1,fid);
				ps.setString(2, uid);
				 rowsdeleted=ps.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return (rowsdeleted > 0);

	}
}
