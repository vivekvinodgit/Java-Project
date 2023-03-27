<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.mvc.dao.FarmerDAO"%>
<%@page import="com.mvc.beans.FarmerBean"%>
<%@page language="java" import="java.util.*" %>
<%
	
	int farmerId=Integer.parseInt(request.getParameter("farmerId"));
	boolean flag=false;
	
	FarmerBean farmerBean = new FarmerBean();
	farmerBean.setFarmerId(farmerId);
	flag=FarmerDAO.deleteFarmer(farmerBean);
	
	System.out.println(flag);
	if(flag){
		response.sendRedirect("FarmerVED.jsp");
	}
	else{
		response.sendRedirect("Error.jsp");
	}
%>