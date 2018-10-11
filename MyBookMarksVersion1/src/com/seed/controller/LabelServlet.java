package com.seed.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.seed.bean.LabelBean;
import com.seed.model.LabelModel;



//@WebServlet("/LabelServlet")
public class LabelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LabelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private String LABEL_ID_LIST = "labelList";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	LabelModel listLabel= new LabelModel();
    	//String result = request.getParameter(listLabel);
    	List<LabelBean> labelList = null;
    	try {
    		labelList = listLabel.listAllLabel(1);
    	} catch (SQLException e) {
    	e.printStackTrace();
    	}
    	
    	String destination ="practicepage.jsp";
    	System.out.println(labelList);
    	request.setAttribute(LABEL_ID_LIST, labelList);

    	RequestDispatcher rd = request.getRequestDispatcher(destination);

    	

   	rd.forward(request, response);


//  doGet(request, response);
    	}      

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		LabelBean labelBean = new LabelBean();
		LabelModel lableModel = new LabelModel();
		// The core Logic of the Registration application is present here.
		// We are going to insert user data in to the database.
		String result = request.getParameter("action");
		System.out.println(result);
		if (result.equalsIgnoreCase("save")) {
			
			HttpSession session = request.getSession();
			int uId = (int) session.getAttribute("uid");
			String labelName = request.getParameter("labelname");
			String labelNote = request.getParameter("note");
			
			labelBean.setUserId(uId);
			labelBean.setLabelName(labelName);
			labelBean.setNote(labelNote);
			
		}
		
		
		//doPost(request, response);
	}

}
