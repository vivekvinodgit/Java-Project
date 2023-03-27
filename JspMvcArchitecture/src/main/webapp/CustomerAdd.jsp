<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page language="java" import="java.util.*"%>
<%@ page import="com.mvc.beans.ItemBean"%>
<%@ page import="com.mvc.dao.ItemDAO"%>
<%@page import="com.mvc.beans.CategoryBean"%>
<%@page import="com.mvc.dao.CategoryDAO"%>

<%
ItemBean itemBean = new ItemBean();
ArrayList<ItemBean> item = ItemDAO.listAllItems();
CategoryBean categoryBean = new CategoryBean();
ArrayList<CategoryBean> category = CategoryDAO.listAllCategories();
%>

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
	background: linear-gradient(-135deg, #43c35a, #090e24);
}
</style>
<script>
	function validateform() {
		
		var customerName = document.CustomerNew.customerName.value;
		var itemId=document.CustomerNew.itemId.value;  
		var quantity=document.CustomerNew.quantity.value;
		
		if (customerName == null || customerName == "") {
			alert("Name can't be null");
			return false;
		} else if (!(isNaN(customerName))) {
			alert("Name must not contain digit");
			return false;
		}
		
		if(itemId==null || itemId==""){  
		  	alert("Item Name can't be null");  
		  	return false;  
		}
		
		if (quantity == null || quantity == "") {
			alert("Quantity can't be null");
			return false;
		} else if (isNaN(quantity)) {
			alert("Quantity must be digit");
			return false;
		}
		
		
	}
</script>
<meta charset="UTF-8">
<title>:: New Farmer ::</title>
</head>
<body>

	<h1>GoVeg Store</h1>
	<form name="CustomerNew" method="post" action="CustomerInsert"
		onsubmit="return validateform()">
		
		Customer Name <input type="text" name="customerName" /><br> 
		
		Item Name 
		
		<select name="itemId">
	
			<option value="">SELECT ITEM</option>

			<%
			for (ItemBean itm : item) {
			%>

			<option value="<%=itm.getItemId()%>"><%=itm.getItemName()%></option>

			<%}%>
		</select><br> 
		
		Quantity <input type="text" name="quantity" /><br> 
		
		
			<input type="submit" value="Save">
	</form>


</body>
</html>