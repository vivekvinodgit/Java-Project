<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.util.*" %>
<%@page import="com.mvc.dao.CategoryDAO"%>
<%@page import="com.mvc.beans.CategoryBean"%>

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
		<title>::Category Delete::</title>
	</head>
<body>
<%
	int catId=Integer.parseInt(request.getParameter("cid"));
	CategoryBean categoryBean = new CategoryBean();
	ArrayList<CategoryBean> category=CategoryDAO.fetchCategoryById(catId);
%>
	<h1>GoVeg Store</h1>
	
	<form name="categoryDelete" method="post" action="CategoryDeleteAction.jsp">
		<table>
			<%
				for(CategoryBean cat : category){
			%>
			<tr>
				<td></td>
				<td><input name="catId" type="hidden" value="<%=cat.getCatId()%>"/></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input name="catName" type="text" value="<%=cat.getCatName()%>"/></td>
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