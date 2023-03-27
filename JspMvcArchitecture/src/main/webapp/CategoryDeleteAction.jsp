<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.mvc.dao.CategoryDAO"%>
<%@page import="com.mvc.beans.CategoryBean"%>
<%@page language="java" import="java.sql.*,java.util.*" %>
<%
	
	int id=Integer.parseInt(request.getParameter("catId"));
	boolean flag=false;
	
	CategoryBean categoryBean = new CategoryBean();
	categoryBean.setCatId(id);
	flag=CategoryDAO.deleteCategory(categoryBean);
	
	if(flag){
		response.sendRedirect("CategoryVED.jsp");
	}
	else{
		response.sendRedirect("Error.jsp");
	}
%>