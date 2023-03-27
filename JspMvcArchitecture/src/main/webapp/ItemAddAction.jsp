<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mvc.beans.ItemBean" %>
<%@ page import="com.mvc.dao.ItemDAO" %>
  
 
<%
    
    int catId=Integer.parseInt(request.getParameter("catName"));
	String itemName=request.getParameter("itemName");
	float itemPrice=Float.parseFloat(request.getParameter("itemPrice"));
	
	System.out.println("catId====="+catId);
	System.out.println("ItemName====="+itemName);
	System.out.println("ItemPrice====="+itemPrice);
    
	ItemBean itemBean=new ItemBean();
    itemBean.setItemName(itemName.toUpperCase().trim());
    itemBean.setcatId(catId);
    itemBean.setItemPrice(itemPrice);
   	
    boolean flag=ItemDAO.InsertItem(itemBean);
	
    System.out.println(flag);
    if(flag){
    	response.sendRedirect("ItemVED.jsp"); 
    }else{
    	response.sendRedirect("error.jsp");	
    }
  
    
%>  
