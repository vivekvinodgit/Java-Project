<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mvc.beans.CategoryBean" %>
<%@ page import="com.mvc.dao.CategoryDAO" %>
    
<%
    
    String catName=request.getParameter("catName");
    System.out.println("CatName====="+catName);
    
    CategoryBean categoryBean=new CategoryBean();
    
    categoryBean.setCatName(catName.toUpperCase().trim());
    
    boolean flag=CategoryDAO.InsertCategory(categoryBean);
    
    System.out.println(flag);
    if(flag){
    	response.sendRedirect("CategoryVED.jsp"); 
    }else{
    	response.sendRedirect("error.jsp");	
    }
    
%>