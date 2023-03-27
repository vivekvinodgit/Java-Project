<%@page import="com.mvc.dao.FarmerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ page import="com.mvc.beans.FarmerBean" %>
<%@ page import="com.mvc.dao.ItemDAO" %>
<%@ page import="com.mvc.dao.FarmerDAO" %>

<%
	String farmerName = request.getParameter("farmerName");
	String farmerAddress = request.getParameter("farmerAddress"); 
	String farmerPhoneNumber = request.getParameter("farmerPhoneNumber");
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	
	FarmerBean farmerBean=new FarmerBean();
	farmerBean.setFarmerName(farmerName.toUpperCase().trim());
	farmerBean.setFarmerAddress(farmerAddress.toUpperCase().trim());
	farmerBean.setFarmerPhoneNumber(farmerPhoneNumber);
	farmerBean.setItemId(itemId);
	farmerBean.setCatId(ItemDAO.fetchCategoryIdByItemId(itemId));
	
	boolean flag=FarmerDAO.insertFarmer(farmerBean);
	
	if(flag){
    	response.sendRedirect("FarmerVED.jsp"); 
    }else{
    	response.sendRedirect("error.jsp");	
    }
	
%>