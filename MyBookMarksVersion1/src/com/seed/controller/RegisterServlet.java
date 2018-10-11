package com.seed.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.seed.bean.LabelBean;
import com.seed.bean.RegisterBean;
import com.seed.model.LabelModel;
import com.seed.model.RegisterDao;
import com.seed.util.DBConnection;


//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String result = request.getParameter("action");
		System.out.println(result);
		if (result.equalsIgnoreCase("Login")) {
		
			String userName = request.getParameter("username");
			String password = request.getParameter("password");
			
			/*old code.....
			 * HttpSession session = request.getSession();
			session.setAttribute("Username", userName);*/
			
			RegisterBean registerBean = new RegisterBean();

			// Using Java Beans - An easiest way to play with group of related
			// data
			//registerBean.setUserId(userId);
			registerBean.setUserName(userName);
			registerBean.setPassword(password);
			System.out.println(userName);

			RegisterDao registerDao = new RegisterDao();
			// The core Logic of the Registration application is present here.
			// We are going to insert user data in to the database.
		
			String userValidate = registerDao.registerUsesrLogin(registerBean); //Calling authenticateUser function
			if(userValidate.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
			{
			request.setAttribute("userName", userName); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
			request.getRequestDispatcher("UserPage.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
			}
			else
			{
			request.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
			request.getRequestDispatcher("RegisterLogin.jsp").forward(request, response);//forwarding the request
			}
			
			
			
			
			//--------------this below code is old code-----------//
			/*			int userRegistered = registerDao.registerUserLogin(registerBean);
			
			if (userRegistered > 0) {
				session.setAttribute("uid", userRegistered);
				RequestDispatcher rq = request.getRequestDispatcher("Home.jsp");
				rq.forward(request, response);

			} else {
				String message = "Invalid credentials";
				//request.setAttribute("message",message);
				//HttpSession session = request.getSession(true);
				session.setAttribute("Message", message);

				RequestDispatcher r = request.getRequestDispatcher("RegisterLogin.jsp");
				//r.forward(request, response);
				r.forward(request, response);
				
			}
*/			//---------------old code----------------//
		
		
		} else if (result.equalsIgnoreCase("Register")) {
			String userName = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confPassword = request.getParameter("confPassword");
			RegisterBean registerBean = new RegisterBean();

			// Using Java Beans - An easiest way to play with group of related
			// data
			registerBean.setUserName(userName);
			registerBean.setEmail(email);
			registerBean.setPassword(password);
			registerBean.setConfPassword(confPassword);

			RegisterDao registerDao = new RegisterDao();
			// The core Logic of the Registration application is present here.
			// We
			// are going to insert user data in to the database.
			String userRegistered = registerDao.registerUser(registerBean);
			try {
				if (userRegistered.equals("SUCCESS")) // On success, you can
														// display
														// a message to user on
														// Home
														// page
				{
					request.getRequestDispatcher("/Home.jsp").forward(request, response);
				} else // On Failure, display a meaningful message to the User.
				{
					request.setAttribute("errMessage", userRegistered);
				}
				request.getRequestDispatcher("/Register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			// this.register();
		}

	}
	//======================doget=============//
	
	
//private String LABEL_ID_LIST = "labelList";
	
/*	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

	doGet(request, response);	
	}
	private void listLabel(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	        List<LabelBean> listLabel = LabelModel.listAllLabel();
	        request.setAttribute("listBook", listLabel);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("practicepage.jsp");
	        dispatcher.forward(request, response);
	    }*/
		
		
		
		// Using Java Beans - An easiest way to play with group of related
		// data
		
	/*	
	List<LabelBean> labelList = null;
	try {
		labelList = listViews();
	} catch (SQLException e) {
	e.printStackTrace();
	}

	String destination = "/WEB-INF/practicepage.jsp";
	request.setAttribute(LABEL_ID_LIST, labelList);

	RequestDispatcher rd = request.getRequestDispatcher(destination);
	rd.forward(request, response);

	}


	public List<LabelBean> listViews() throws SQLException
	{
		List<LabelBean> lv = new ArrayList<LabelBean>();
		Connection con = null;
		PreparedStatement preparedStatement = null;
	
	con = DBConnection.createConnection();
	System.out.println("In side insert");

	String query = "select labelName,note,createdOn from label order by id asc";	
	
	
	preparedStatement = con.prepareStatement(query); 
	
	ResultSet resultSet = preparedStatement.executeQuery();

	while (resultSet.next()) {

	LabelBean label = new LabelBean();

	
	label.setLabelName(resultSet.getString("labelName"));
	label.setNote(resultSet.getString("note"));
	label.setCreatedOn(resultSet.getDate("createOn"));
	lv.add(label);
	}

	resultSet.close();
	preparedStatement.close();

	return lv;

	
	}

*/	

}
