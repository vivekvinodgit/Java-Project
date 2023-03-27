<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.mvc.beans.CategoryBean" %>
<%@page import="com.mvc.dao.CategoryDAO" %>
<%@page language="java" import="java.sql.*,java.util.*" %>

<%
	int id=Integer.parseInt(request.getParameter("catId"));
	String catName=request.getParameter("catName");
	boolean flag=false;
	
	CategoryBean categoryBean = new CategoryBean();
	categoryBean.setCatId(id);
	categoryBean.setCatName(catName.toUpperCase().trim());
	flag=CategoryDAO.updateCategory(categoryBean);

	if(flag){
		response.sendRedirect("CategoryVED.jsp");
	}
	else{
		response.sendRedirect("error.jsp");
	}
%>