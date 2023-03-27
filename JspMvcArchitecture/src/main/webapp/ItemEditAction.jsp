<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.mvc.beans.ItemBean" %>
<%@page import="com.mvc.dao.ItemDAO" %>
<%@page language="java" import="java.util.*" %>

<%
	int itemId=Integer.parseInt(request.getParameter("itemId"));
	String itemName=request.getParameter("itemName");
	float itemPrice=Float.parseFloat(request.getParameter("itemPrice"));
	int catId=Integer.parseInt(request.getParameter("catId"));
	boolean flag=false;
	
	ItemBean itemBean = new ItemBean();
	itemBean.setItemId(itemId);
	itemBean.setItemName(itemName.toUpperCase().trim());
	itemBean.setItemPrice(itemPrice);
	itemBean.setcatId(catId);
	
	
	flag=ItemDAO.updateItem(itemBean);
	System.out.println(flag);
	if(flag){
		response.sendRedirect("ItemVED.jsp");
	}
	else{
		response.sendRedirect("error.jsp");
	}
%>