package com.seed.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.seed.bean.RegisterBean;
import com.seed.util.DBConnection;

public class RegisterDao {
	public String registerUser(RegisterBean registerBean)
	{
	
	String userName = registerBean.getUserName();
	String email = registerBean.getEmail();
	String password = registerBean.getPassword();
	String confPassword = registerBean.getConfPassword();
	
	Connection con = null;
	PreparedStatement preparedStatement = null;
	try
	{
	con = DBConnection.createConnection();
	System.out.println("In side insert");
	String query = "insert into registration(userName,email,password,confpassword) values(?,?,?,?)"; 
	preparedStatement = con.prepareStatement(query); 
	preparedStatement.setString(1, userName);
	preparedStatement.setString(2, email);
	preparedStatement.setString(3, password);
	preparedStatement.setString(4, confPassword);
	
	int i= preparedStatement.executeUpdate();
	if (i!=0) 
	return "SUCCESS";
	}
	catch(SQLException e)
	{
	e.printStackTrace();
	}
	return "Oops.. Something went wrong there..!";  
	}
	
	
	public String registerUsesrLogin(RegisterBean registerBean)//new code for testing.
	{
	/*public int registerUserLogin(RegisterBean registerBean) //this old code changed here return type string to integer.
	{

		
		//int userId = registerBean.getUserId();
	
	String dbName=null;
	String dbPassword=null;
	int dbuserId=0;
	int result=-1;
	
	Connection con = null;
	PreparedStatement preparedStatement = null;
	
	con = DBConnection.createConnection();
	System.out.println("In side insert");
	String query = "select * from registration where userName=? and password=?"; 
	try {
		preparedStatement = con.prepareStatement(query);
		
		//preparedStatement.setInt(1, 1);
		preparedStatement.setString(1, registerBean.getUserName());
		preparedStatement.setString(2, registerBean.getPassword());
		
	ResultSet rs= preparedStatement.executeQuery();

	if(rs.next()){
		
		dbuserId=rs.getInt(1);
		dbName = rs.getString(2);
		dbPassword = rs.getString(3);
		result=dbuserId;	
		return 	result;
	}
	}
			
	catch(SQLException e)
	{
	e.printStackTrace();
	}

		return result;
*/
		
		
		String userName = registerBean.getUserName(); //Keeping user entered values in temporary variables.
		String password = registerBean.getPassword();
		
		Connection con = null;
		Statement statement = null;
		
		ResultSet resultSet = null;
		String userNameDB = "";
		String passwordDB = "";
		
		
		try
		{
		con = DBConnection.createConnection(); //establishing connection
		statement = con.createStatement(); //Statement is used to write queries. Read more about it.
		resultSet = statement.executeQuery("select userName,password from registration"); //Here table name is users and userName,password are columns. fetching all the records and storing in a resultSet.
		while(resultSet.next()) // Until next row is present otherwise it return false
		{
		userNameDB = resultSet.getString("userName"); //fetch the values present in database
		passwordDB = resultSet.getString("password");
		if(userName.equals(userNameDB) && password.equals(passwordDB)){
		return "SUCCESS";} ////If the user entered values are already present in database, which means user has already registered so I will return SUCCESS message.
		}
		}
		catch(SQLException e)
		{
		e.printStackTrace();
		}
		return "Invalid user credentials"; // Just returning appropriate message otherwise
				
	}
}