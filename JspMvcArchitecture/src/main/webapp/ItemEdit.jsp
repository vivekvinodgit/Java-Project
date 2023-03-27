<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page import="com.mvc.beans.ItemBean" %>
<%@page import="com.mvc.beans.CategoryBean" %>
<%@page import="com.mvc.dao.ItemDAO" %>    
<%@page import="com.mvc.dao.CategoryDAO" %>

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
<title>:: Edit Item ::</title>
</head>
<body>
<%	
	int itemId=Integer.parseInt(request.getParameter("iid"));
	ItemBean itemBean = new ItemBean();
	ArrayList<ItemBean> item=ItemDAO.fetchItemById(itemId);
	ArrayList<CategoryBean> category=CategoryDAO.listAllCategories();
%>

<h1>GoVeg Store</h1>
	<form name="itemEdit" method="post" action="ItemEditAction.jsp">
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
				<td>Item Price</td>
				<td><input name="itemPrice" type="text" value="<%=itm.getItemPrice()%>"/></td>
			</tr>
			
			<tr>
			
				<td>Category</td>
				<td>
					<select name="catId">
		                
		
		                <% for(CategoryBean cat : category){%>
		
		                    <option value="<%=cat.getCatId()%>"><%=cat.getCatName()%></option>                    
		
		                <%}%>
	       			 </select>
	       		</td>
			</tr>
			
				<% }%>
				
			<tr>
				<td></td>
				<td><input type="submit" value="UPDATE"/></td>
			</tr>
		</table>
	</form>
</body>
</html>