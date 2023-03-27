package com.mvc.servlets;

import java.io.IOException;

import com.mvc.beans.LoginBean;
import com.mvc.dao.LoginDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		
		LoginBean loginBean=new LoginBean();
		loginBean.setUserName(userName);
		loginBean.setPassword(password);
		
		boolean flag = false;
		try {
			flag = LoginDAO.validateUser(loginBean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 if(flag){
		    	response.sendRedirect("index.html"); 
		    }else{
		    	response.sendRedirect("LoginFailed.html"); 
		    	
		    }
		
	}

}
