package com.seed.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection createConnection()
	{
	Connection con = null;
	
	try
	{
		String url = "jdbc:mysql://localhost:3306/mybook"; 
		String username = "root"; 
		String password = "root"; 
		
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password);
	System.out.println("Printing connection object "+con);
	}
	catch (ClassNotFoundException | SQLException e)
	{
	e.printStackTrace();
	}
	
	return con;
	}

}
