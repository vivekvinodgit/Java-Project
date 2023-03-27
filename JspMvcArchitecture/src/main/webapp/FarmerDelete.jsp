<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@ page import="com.mvc.dao.FarmerDAO" %>
<%@ page import="com.mvc.dao.CategoryDAO" %>
<%@ page import="com.mvc.dao.ItemDAO" %>
<%@ page import="com.mvc.beans.FarmerBean" %>
<!DOCTYPE html>
<html>
<head>
		<style>
			body {
					background-image: url('images/background.jpg');
					background-size: cover;
	   				background-position: center;
	   				background-attachment: fixed;
	    			background-repeat: no-repeat;
			}
			h1 {
				text-align: center;
				background	: linear-gradient(-135deg, #43c35a, #090e24);
			}
		
		</style>
	<meta charset="UTF-8">
	<title>:: Delete Farmer ::</title>
</head>
<body>
	<%
	int farmerId=Integer.parseInt(request.getParameter("fid"));
	FarmerBean farmerBean = new FarmerBean();
	ArrayList<FarmerBean> farmer=FarmerDAO.fetchFarmerById(farmerId);
	
	%>
	<h1>GoVeg Store</h1>
	
	<form name="FarmerDelete" method="post" action="FarmerDeleteAction.jsp">
		<table>
			<%
				for(FarmerBean fmr : farmer){
			%>
			<tr>
				<td></td>
				<td><input name="farmerId" type="hidden" value="<%=fmr.getFarmerId()%>"/></td>
			</tr>
			<tr>
				<td>Farmer Name</td>
				<td><input name="farmerName" type="text" value="<%=fmr.getFarmerName()%>"/></td>
			</tr>
			<tr>
				<td>Farmer Address</td>
				<td><input name="farmerAdress" type="text" value="<%=fmr.getFarmerAddress()%>"/></td>
			</tr>
			<tr>
				<td>Farmer PhoneNumber</td>
				<td><input name="farmerPhoneNumber" type="text" value="<%=fmr.getFarmerPhoneNumber()%>"/></td>
			</tr>
			<tr>
				<td>Item Name</td>
				<td><input name="itemName" type="text" value="<%=ItemDAO.fetchItemNameByItemId(fmr.getItemId())%>"/></td>
			</tr>
			<tr>
				<td>Category Name</td>
				<td><input name="catName" type="text" value="<%=CategoryDAO.fetchCategoryNameByCatId(fmr.getCatId())%>"/></td>
			</tr>
			
			<% }%>
			<tr>
				<td></td>
				<td><input type="submit" value="DELETE"/></td>
			</tr>
		</table>
	</form>
	
</body>
</html>