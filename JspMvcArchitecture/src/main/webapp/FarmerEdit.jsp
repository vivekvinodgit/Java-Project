<%@page import="com.mvc.dao.ItemDAO"%>
<%@page import="com.mvc.beans.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" import="java.util.*" %>
<%@page import="com.mvc.beans.FarmerBean" %>
<%@page import="com.mvc.beans.ItemBean" %>
<%@page import="com.mvc.dao.FarmerDAO" %>    
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
<title>:: Edit Farmer ::</title>
</head>
<body>	
		
<%	
	int farmerId=Integer.parseInt(request.getParameter("fid"));
	FarmerBean farmerBean = new FarmerBean();
	ArrayList<FarmerBean> farmer=FarmerDAO.fetchFarmerById(farmerId);
	int itemId=FarmerDAO.fetchItemIdByFarmerId(farmerId);
	ArrayList<CategoryBean> category=CategoryDAO.listAllCategories();
	ArrayList<ItemBean> item=ItemDAO.listAllItems();
%>

<h1>GoVeg Store</h1>
	<form name="itemEdit" method="post" action="FarmerEditAction.jsp">
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
				<td><input name="farmerAddress" type="text" value="<%=fmr.getFarmerAddress()%>"/></td>
			</tr>
			<tr>
				<td>Farmer PhoneNumber</td>
				<td><input name="farmerPhoneNumber" type="text" value="<%=fmr.getFarmerPhoneNumber()%>"/></td>
			</tr>
			<tr>
			
				<td>Item Name</td>
				<td>
					<select name="itemId">
		                
		
		                <% for(ItemBean itm : item){%>
		
		                    <option value="<%=itm.getItemId()%>"><%=itm.getItemName()%></option>                    
		
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