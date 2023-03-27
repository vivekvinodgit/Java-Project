<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" import="java.util.*" %>
<%@ page import="com.mvc.beans.ItemBean" %>
<%@ page import="com.mvc.dao.ItemDAO" %>

<%	
	
	ItemBean itemBean = new ItemBean();
	ArrayList<ItemBean> item=ItemDAO.listAllItems();
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
			background	: linear-gradient(-135deg, #43c35a, #090e24);
		}
	
	</style>
<script>  

	function validateform(){  
			var phno=document.farmerNew.farmerPhoneNumber.value;  
			var farmerName=document.farmerNew.farmerName.value; 
			var farmerAddress=document.farmerNew.farmerAddress.value;
			var itemId=document.farmerNew.itemId.value;
			
			if(phno==null || phno==""){  
			  	alert("Phone Number can't be null");  
			  	return false;  
			}else if(isNaN(phno)){ 
				alert("Phone Number must be digit"); 
				return false; 
			}else if(phno.length!=10){  
			  	alert("Phone Number must have 10 digit");  
			  	return false;  
			}  
			
			if(farmerAddress==null || farmerAddress==""){  
			  	alert("Address can't be null");  
			  	return false;  
			}
			
			if(farmerName==null || farmerName==""){  
			  	alert("Name can't be null");  
			  	return false;  
			}else if(!(isNaN(farmerName))){
				alert("Name must not contain digit");  
			  	return false;
			}
			
			if(itemId==null || itemId==""){  
			  	alert("Please select an item");  
			  	return false;  
			}
	}
			
</script>  
<meta charset="UTF-8">
<title>:: New Farmer ::</title>
</head>
<body>
	
<h1>GoVeg Store</h1>
	<form name="farmerNew" method="post" action="FarmerAddAction.jsp" onsubmit="return validateform()">
		Farmer Name <input type="text" name="farmerName"/><br>
		Farmer Address <input type="text" name="farmerAddress"/><br>
		Farmer Phone Number <input type="text" name="farmerPhoneNumber"/><br>
		Item Name 
					<select name="itemId">
		                <option value="">SELECT ITEM</option>
		
		                <% for(ItemBean itm : item){%>
		
		                    <option value="<%=itm.getItemId()%>"><%=itm.getItemName()%></option>                    
		
		                <%}%>
		        </select><br> 

		<input type="submit" value="Save">
	</form>


</body>
</html>