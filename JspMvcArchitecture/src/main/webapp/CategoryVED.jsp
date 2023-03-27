<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.beans.CategoryBean" %>
<%@ page import="com.mvc.dao.CategoryDAO" %>
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
<title>:: Category View/Edit/Delete ::</title>
</head>
<body>

<h1>GoVeg Store</h1>
	<a href="index.html">HOME PAGE</a><br></br>
	<table>
	<tr>
	<th>Sl.No</th>
	<th>Category Name</th>
	<th>Edit</th>
	<th>Delete</th>
	</tr>
	
	<%
		int i=1;
	
		ArrayList<CategoryBean> category=CategoryDAO.listAllCategories();
		for(CategoryBean cat : category){
		%>
		<tr>
		<td><%=i%></td>
		<td><%=cat.getCatName()%></td>
		<td><a href="CategoryEdit.jsp?cid=<%=cat.getCatId()%>">Edit</a></td>
		<td><a href="CategoryDelete.jsp?cid=<%=cat.getCatId()%>">Delete</a></td>
		</tr>
		<%
		i++;
		}
	%>
	
	</table>
</body>
</html>