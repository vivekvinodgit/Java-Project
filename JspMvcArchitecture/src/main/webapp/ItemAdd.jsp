<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" import="java.util.*" %>
<%@page import="com.mvc.beans.CategoryBean" %>
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
<script>  

	function validateform(){  
			var itemName=document.ItemNew.itemName.value;  
			var catName=document.ItemNew.catName.value; 
			var itemPrice=document.ItemNew.itemPrice.value;
			
			if(itemName==null || itemName==""){  
			  	alert("Item Name can't be null");  
			  	return false;  
			}else if(!(isNaN(itemName))){
				alert("Item Name must not contain digit");  
			  	return false;
			}
			
			if(catName==null || catName==""){  
			  	alert("Category Name can't be null");  
			  	return false;  
			}
			
			if(itemPrice==null || itemPrice==""){  
			  	alert("Item Price can't be null");  
			  	return false;  
			}else if(itemPrice==0){
				alert("Item Price can't be 0");  
			  	return false;			
			}
			
	}
			
</script>

<meta charset="UTF-8">
<title>:: New Item ::</title>
</head>
<body>

<h1>GoVeg Store</h1>
<%	
	
	CategoryBean categoryBean = new CategoryBean();
	ArrayList<CategoryBean> category=CategoryDAO.listAllCategories();
%>

	<form name="ItemNew" method="post" action="ItemAddAction.jsp" onsubmit="return validateform()">
		
		Item Name <input type="text" name="itemName"/><br>
				
				
		Category <select name="catName">
		                <option value="">SELECT CATEGORY</option>
		
		                <% for(CategoryBean cat : category){%>
		
		                    <option value="<%=cat.getCatId()%>"><%=cat.getCatName()%></option>                    
		
		                <%}%>
		        </select><br> 
		        
		            		
		Item Price <input type="text" name="itemPrice"/><br>
		
		<input type="submit" value="Save">
		
	</form>
</body>
</html>