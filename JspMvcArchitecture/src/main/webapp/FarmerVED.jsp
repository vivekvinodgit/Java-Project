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
<title>:: Farmer View/Edit/Delete ::</title>
</head>
<body>

<h1>GoVeg Store</h1>
		<a href="index.html">HOME PAGE</a><br></br>
	<table>
	<tr>
	<th>Sl.No</th>
	<th>Farmer Name</th>
	<th>Farmer Address</th>
	<th>Farmer Phone Number</th>
	<th>Item Name</th>
	<th>Category Name</th>
	<th>Edit</th>
	<th>Delete</th>
	
	</tr>
	
	<%
		int i=1;
	
		ArrayList<FarmerBean> farmer=FarmerDAO.listAllFarmers();
		for(FarmerBean fmr : farmer){
		%>
		<tr>
		<td><%=i%></td>
		<td><%=fmr.getFarmerName()%></td>
		<td><%=fmr.getFarmerAddress()%></td>
		<td><%=fmr.getFarmerPhoneNumber()%></td>
		<td><%=ItemDAO.fetchItemNameByItemId(fmr.getItemId())%></td>
		<td><%=CategoryDAO.fetchCategoryNameByCatId(fmr.getCatId())%></td>
		<td><a href="FarmerEdit.jsp?fid=<%=fmr.getFarmerId()%>">Edit</a></td>
		<td><a href="FarmerDelete.jsp?fid=<%=fmr.getFarmerId()%>">Delete</a></td>
		</tr>
		<%
		i++;
		}
	%>
	</table>
</body>
</html>