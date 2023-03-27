<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.mvc.dao.ItemDAO"%>
<%@page import="com.mvc.beans.ItemBean"%>
<%@page language="java" import="java.util.*" %>
<%
	
	int itemId=Integer.parseInt(request.getParameter("itemId"));
	boolean flag=false;
	
	ItemBean itemBean = new ItemBean();
	itemBean.setItemId(itemId);
	flag=ItemDAO.deleteItem(itemBean);
	
	if(flag){
		response.sendRedirect("ItemVED.jsp");
	}
	else{
		response.sendRedirect("Error.jsp");
	}
%>