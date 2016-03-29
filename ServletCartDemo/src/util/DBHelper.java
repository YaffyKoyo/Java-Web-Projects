package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=UTF-8";
	private static final String username = "root";
	private static final String password = "1234";

	private static Connection conn = null;
	//load the driver
	static{
		try{
			Class.forName(driver);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//single instance model return db object
	public static Connection getConnection() throws Exception {
		if(conn==null){
			conn = DriverManager.getConnection(url,username,password);
			return conn;
		}
		return conn;
	}
	
	public static void main(String[] args){
		try{
			Connection conn = DBHelper.getConnection();
			if(conn!=null){
				System.out.println("db connection succeed");
			}else{
				System.out.println("db connection failed");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
