<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.beans.LoginBean" %>
<%@ page import="com.mvc.dao.LoginDAO" %>
    
<%
	
	String userName=request.getParameter("userName");
	String password=request.getParameter("password");
	
	LoginBean loginBean=new LoginBean();
	loginBean.setUserName(userName);
	loginBean.setPassword(password);
	
	boolean flag=LoginDAO.validateUser(loginBean);
	
	 if(flag){
	    	response.sendRedirect("index.html"); 
	    }else{
	    	out.println("<font color=red> UserName or Password is incorrect!!!<br>");
	    	out.println("<a href=login.jsp>Try Again!!!</a>");
	    }
%>