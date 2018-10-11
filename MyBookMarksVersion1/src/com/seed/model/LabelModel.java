package com.seed.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.seed.bean.LabelBean;
import com.seed.util.DBConnection;

public class LabelModel {

	public String addLabel(LabelBean labelBean)
	{
	
		String labelName = labelBean.getLabelName();
		String note = labelBean.getNote();

		
	Connection con = null;
	PreparedStatement preparedStatement = null;
	try
	{
	con = DBConnection.createConnection();
	System.out.println("In side insert");
	String query = "insert into label(labelName,note) values(?,?)"; 
	preparedStatement = con.prepareStatement(query); 
	preparedStatement.setString(1, labelName);
	preparedStatement.setString(2, note);
	
	
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
	
	//-------------------------------------------
	
	 public  List<LabelBean> listAllLabel(int userId) throws SQLException {
	        List<LabelBean> listLabel = new ArrayList<>();
	         
	              
	        Connection con = null;
	        Statement statement = null;
	        
	        	con=DBConnection.createConnection();
	        	String sql = "SELECT * FROM label";//where clause specific user used.
	        	statement = con.createStatement();
	        	ResultSet resultSet = statement.executeQuery(sql);
	 
	        while (resultSet.next()) {
	            LabelBean label = new LabelBean();
	            //label.setLabelId(resultSet.getInt("labelId"));
	            label.setLabelName(resultSet.getString("labelName"));
	            label.setNote(resultSet.getString("note"));
	            label.setCreatedOn(resultSet.getDate("createdOn"));
	             
	    
	            listLabel.add(label);
	        }
	         
	       // con.close();
	        resultSet.close();
	       statement.close();
	         
	        return listLabel;
	    }
	
	//--------------------------------------------------
		
	public String editLabel(LabelBean labelBean)
	{
		String labelName = labelBean.getLabelName();
		String note = labelBean.getLabelName();
		int userId = labelBean.getUserId();
		
	Connection con = null;
	PreparedStatement preparedStatement = null;
	try
	{
	con = DBConnection.createConnection();
	System.out.println("In side insert");
	String query = "update label set labelName=?,note=? where id = ?)"; 
	preparedStatement = con.prepareStatement(query); 
	preparedStatement.setString(1, labelName);
	preparedStatement.setString(2, note);
	preparedStatement.setInt(3, userId);
	
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
	
	public String deleteLabel(LabelBean labelBean)
	{
		int userId = labelBean.getUserId();
		
		
	Connection con = null;
	PreparedStatement preparedStatement = null;
	try
	{
	con = DBConnection.createConnection();
	System.out.println("In side insert");
	String query = "delete from label where id=?"; 
	preparedStatement = con.prepareStatement(query); 
	preparedStatement.setInt(1, userId);
	
	
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

}
