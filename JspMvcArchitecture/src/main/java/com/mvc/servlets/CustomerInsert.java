package com.mvc.servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

import com.mvc.beans.CustomerBean;
import com.mvc.dao.CustomerDAO;
import com.mvc.dao.ItemDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CustomerInsert() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerName = request.getParameter("customerName");
		int itemId=Integer.parseInt(request.getParameter("itemId"));  
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		Float price = 0F;
		int itmid=0;
		try {
			price = ItemDAO.fetchItemPriceByItemId(itemId);
			price = quantity*price +(((price*5)/100)*quantity);
			itmid=ItemDAO.fetchCategoryIdByItemId(itemId);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		LocalDate currentDate = LocalDate.now();
		// LocalDate to SQL date using valueOf() method.
        Date sqlDate = Date.valueOf(currentDate);
		
        
		
		CustomerBean customerBean=new CustomerBean();
		customerBean.setCustomerName(customerName);
		customerBean.setItemId(itemId);
		customerBean.setDate(sqlDate);
		customerBean.setCatId(itmid);
		customerBean.setQuantity(quantity);
		customerBean.setPrice(price);
		
		boolean flag = false;
		try {
			flag = CustomerDAO.InsertCustomer(customerBean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag){
	    	response.sendRedirect("CustomerView.jsp"); 
	    }else{
	    	response.sendRedirect("error.jsp"); 
	    	
	    }
		
	}

}
