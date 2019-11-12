package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import util.SocialSql;

public class DBConnection {
	private static Connection con;
	
	public static Connection ConnectDB() {
		
		try {
			Class.forName(SocialSql.CONNECT);
			 try {
				con=DriverManager.getConnection(SocialSql.URL,SocialSql.USERNAME,SocialSql.PASSWORD);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}

}
