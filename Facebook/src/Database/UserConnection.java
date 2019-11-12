package Database;

import java.io.InputStream;
import java.sql.*;

import model.User;
import util.SocialSql;

public class UserConnection {
	private Connection con;
	private Statement st;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserConnection() {
		con=DBConnection.ConnectDB();
	}
	
	public boolean checkUserName(String name) {
		boolean isAvailable=true;
		try {
			ps=con.prepareStatement(SocialSql.GET_USER_NAME);
			rs=ps.executeQuery();
			while(rs.next()) {
//				System.out.println(rs.getString(3));
				if(rs.getString(3).equals(name)) {
					
					isAvailable=false;
				}
				
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
		return isAvailable;
	}
	
	public boolean RegisterUserDetails(User user) {
	
		int rowAffected=0;
		try {
			ps=con.prepareStatement(SocialSql.INSERT_USER_REGISTER_DETAILS);
			ps.setString(1, user.getName());
			ps.setString(2,user.getUsername());
			ps.setString(3, user.getPassword());
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
	
	public User LoginUser(User user) {
		User u1=new User();
		boolean isValid=false;
		try {
			ps=con.prepareStatement(SocialSql.GET_USER_NAME);
			rs=ps.executeQuery();
			while(rs.next()) {
				if(rs.getString(3).equals(user.getUsername()) && rs.getString(4).equals(user.getPassword())) {
					u1.setId(rs.getString(1));
					u1.setName(rs.getString(2));
					u1.setUsername(rs.getString(3));
					u1.setPassword(rs.getString(4));
					u1.setCorrect(true);
					isValid=true;		
				}	
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
		
		if(isValid) {
			return u1;
		}
		else {
			u1.setCorrect(false);
			return u1;
		}
		
	}
	
	public boolean ProfileUpdate(String myid,InputStream inputStream) {
		boolean isUpdated=false;
		   try {
	            // connects to the database
	          
	            // constructs SQL statement
	            String sql = "INSERT INTO profile (uid,photo) values (?, ?)";
	            ps = con.prepareStatement(sql);
	            ps.setString(1, myid);
	          
	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	              ps.setBlob(2, inputStream);
	            }
	 
	            // sends the statement to the database server
	            int row = ps.executeUpdate();
	            if (row > 0) {
	              isUpdated=true;
	            }
	        } catch (SQLException ex) {
	        	isUpdated=false;
	            ex.printStackTrace();
	        } finally {
	           try {
	        	   ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		              
	        }
		   if(isUpdated) {
			   return true;
		   }
		   else {
			   return false;
		   }
	}

}
