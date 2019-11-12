package util;

public final class SocialSql {

	public static final String CONNECT ="com.mysql.cj.jdbc.Driver";//mysql driver manager
	
	public static final String URL="jdbc:mysql://localhost/nature?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	public static  final String USERNAME="root";//DB Username=root
	
	public  static final String PASSWORD="";//DB password=root
	
	public static final String GET_USER_NAME="select * from user";
	
	public static final String INSERT_USER_REGISTER_DETAILS="insert into user(name,username,password) values(?,?,?)";
	
	public static final String INSERT_FRIENDLIST_DETAILS="insert into friend_list(uid,fid,check_va) values(?,?,?)";
	
	public static final String GET_FRIENDS_DETAILS="select * from user WHERE id = ANY(select fid from friend_list where uid=?)";
	
	public static final String GET_AVAILABLE_FRIENDS="select * from user WHERE id !=All(select fid from friend_list where uid=?)";
	
	public static final String REMOVE_CURRENT_FRIEND="delete from friend_list where fid=? and uid=?";
}
