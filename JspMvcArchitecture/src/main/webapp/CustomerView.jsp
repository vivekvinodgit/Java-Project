<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page language="java" import="java.util.*" %>
<%@ page import="com.mvc.dao.CustomerDAO" %>
<%@ page import="com.mvc.dao.CategoryDAO" %>
<%@ page import="com.mvc.dao.ItemDAO" %>
<%@ page import="com.mvc.beans.CustomerBean" %> 
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
<title>:: Customer View ::</title>
</head>
<body>

<h1>GoVeg Store</h1>
		<a href="index.html">HOME PAGE</a><br></br>
	<table>
	<tr>
	<th>Sl.No</th>
	<th>Customer Name</th>
	<th>Item Name</th>
	<th>Category</th>
	<th>Date</th>
	<th>Quantity</th>
	<th>Item Price(+5% GST)</th>
	
	</tr>
	
	<%
		int i=1;
		
		ArrayList<CustomerBean> customer=CustomerDAO.listAllCustomers();
		
		for(CustomerBean cust : customer){
		%>
		<tr>
		<td><%=i%></td>
		<td><%=cust.getCustomerName()%></td>
		<td><%=ItemDAO.fetchItemNameByItemId(cust.getItemId())%></td>
		<td><%=CategoryDAO.fetchCategoryNameByCatId(cust.getCatId())%></td>
		<td><%=cust.getDate()%></td>
		<td><%=cust.getQuantity()%></td>
		<td><%=cust.getPrice()%></td>
		
		</tr>
		<%
		i++;
		}
	%>
	</table>
</body>
</html>