<%@page import="com.mvc.beans.CategoryBean"%>
<%@page import="com.mvc.dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.beans.ItemBean" %>
<%@ page import="com.mvc.dao.ItemDAO" %>
<%@page language="java" import="java.sql.*,java.util.*" %>    
    
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
<title>:: Item View/Edit/Delete ::</title>
</head>
<body>
	
<h1>GoVeg Store</h1>
	<a href="index.html">HOME PAGE</a><br></br>
	<table>
	<tr>
	<th>Sl.No</th>
	<th>Item Name</th>
	<th>Category</th>
	<th>Item Price</th>
	<th>Edit</th>
	<th>Delete</th>
	</tr>
	
	<%
		int i=1;
	
		ArrayList<ItemBean> item=ItemDAO.listAllItems();
			
		for(ItemBean it : item){
		%>
		<tr>
		<td><%=i%></td>
		<td><%=it.getItemName()%></td>
		<td><%=CategoryDAO.fetchCategoryNameByCatId(it.getcatId())%></td>
		<td><%=it.getItemPrice() %></td>
		<td><a href="ItemEdit.jsp?iid=<%=it.getItemId()%>">Edit</a></td>
		<td><a href="ItemDelete.jsp?iid=<%=it.getItemId()%>">Delete</a></td>
		</tr>
		<%
		i++;
		}
	%>
	
	</table>
</body>
</html>