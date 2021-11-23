package proviso.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/* 
Keegan Jones

JdbcManager.java. This is a helper class that we will use to connect to MySQL.
*/



public class JdbcManager 
{
	// define private variables
	private String jdbcUrl;
	private String jdbcUserName; 
	private String jdbcPassword;
	
	public JdbcManager() 
	{
		// give value to variables
		jdbcUrl = "jdbc:mysql://localhost:3306/proviso?useSSL=false";
		jdbcUserName = "proviso_user";
		jdbcPassword = "MySQL5IsGreat!";
		
		// Try/catch for error handling.
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (ClassNotFoundException ex)
		{
			System.out.println(ex.toString());
		}
	}
	
	// Connect to DB.
	public Connection getConn() 
	{
		Connection conn = null;
		
		System.out.println("jdbcUrl: " + jdbcUrl + "; jdbcUserName: " + jdbcUserName + "; jdbcPassword: " + jdbcPassword);
		
		try 
		{
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		}
		catch (SQLException ex) 
		{
			System.out.println("Inside catch block of JdbcManager class");
			System.out.println("Could not connect to DB: " + ex.getMessage());
		}
		
		return conn;
	}
	
	
	// Always close connection.
	public void closeConn(Connection conn) 
	{
		if (conn != null) 
		{
			try 
			{
				conn.close();
			}
			catch (SQLException ex)
			{
				System.out.println("Could not close DB connection: " + ex.getMessage());
			}
		}
	}
}