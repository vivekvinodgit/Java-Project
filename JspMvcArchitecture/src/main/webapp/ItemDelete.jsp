<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page import="com.mvc.dao.ItemDAO,com.mvc.dao.CategoryDAO"%>
<%@page import="com.mvc.beans.ItemBean"%>

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
		<title>:: Delete Item ::</title>
	</head>
<body>
<%
	int itemId=Integer.parseInt(request.getParameter("iid"));
	ItemBean itemBean = new ItemBean();
	ArrayList<ItemBean> item=ItemDAO.fetchItemById(itemId);
%>
<h1>GoVeg Store</h1>
	<form name="ItemDelete" method="post" action="ItemDeleteAction.jsp">
		<table>
			<%
				for(ItemBean itm : item){
			%>
			<tr>
				<td></td>
				<td><input name="itemId" type="hidden" value="<%=itm.getItemId()%>"/></td>
			</tr>
			<tr>
				<td>Item Name</td>
				<td><input name="itemName" type="text" value="<%=itm.getItemName()%>"/></td>
			</tr>
			<tr>
				<td>Category Name</td>
				<td><input name="catName" type="text" value="<%=CategoryDAO.fetchCategoryNameByCatId(itm.getcatId())%>"/></td>
			</tr>
			<tr>
				<td>Item Price</td>
				<td><input name="itemPrice" type="text" value="<%=itm.getItemPrice()%>"/></td>
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