<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" import="java.util.*" %>
<%@page import="com.mvc.beans.FarmerBean" %>
<%@page import="com.mvc.dao.FarmerDAO" %>    
<%@page import="com.mvc.dao.ItemDAO" %>

<%

	int farmerId=Integer.parseInt(request.getParameter("farmerId"));
	String farmerName = request.getParameter("farmerName");
	String farmerAddress = request.getParameter("farmerAddress"); 
	String farmerPhoneNumber = request.getParameter("farmerPhoneNumber");
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	
	FarmerBean farmerBean=new FarmerBean();
	farmerBean.setFarmerId(farmerId);
	farmerBean.setFarmerName(farmerName.toUpperCase().trim());
	farmerBean.setFarmerAddress(farmerAddress.toUpperCase().trim());
	farmerBean.setFarmerPhoneNumber(farmerPhoneNumber);
	farmerBean.setItemId(itemId);
	farmerBean.setCatId(ItemDAO.fetchCategoryIdByItemId(itemId));
	
	boolean flag=FarmerDAO.updateFarmer(farmerBean);
	
	if(flag){
    	response.sendRedirect("FarmerVED.jsp"); 
    }else{
    	response.sendRedirect("error.jsp");	
    }
	
	
%>