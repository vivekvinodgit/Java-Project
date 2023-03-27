package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.CustomerBean;

public class CustomerDAO {
		
	static Connection con=null;
	static PreparedStatement pst=null;
	static ResultSet rs=null;
	static boolean flag=false;
	
	public static Connection getDbConnection() throws SQLException{
		try {
			DBDAO.connect();			
			con=DBDAO.getDBCon();
		}
		catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}catch (Exception exception) {
			exception.printStackTrace();
		}
		
		return con;
	}
	
	public static ArrayList<CustomerBean> listAllCustomers()throws SQLException{
		
		ArrayList<CustomerBean> custBean=new ArrayList<CustomerBean>();
		con=getDbConnection();
		
		try{
			pst=con.prepareStatement("SELECT * FROM customer");
			rs=pst.executeQuery();
			
			while(rs.next()){
				//LocalDate currentDate = LocalDate.now();
				 
		        // LocalDate to SQL date using valueOf() method.
		        //Date sqlDate = Date.valueOf(currentDate);
		        
				CustomerBean cust=new CustomerBean();
				cust.setCustomerId(rs.getInt(1));
				cust.setCustomerName(rs.getString(2));
				cust.setDate(rs.getDate(3));
				cust.setItemId(rs.getInt(4));
				cust.setCatId(rs.getInt(5));
				cust.setQuantity(rs.getInt(6));
				cust.setPrice(rs.getFloat(7));
				custBean.add(cust);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return custBean;
	}
	
	public static boolean InsertCustomer(CustomerBean customerBean) {
		try {
			
			
			con=getDbConnection();
			pst=con.prepareStatement("insert into customer(CustomerName,date,itemId,catId,price,quantity) values(?,?,?,?,?,?)");
			pst.setString(1, customerBean.getCustomerName());
			pst.setDate(2, customerBean.getDate());
			pst.setInt(3, customerBean.getItemId());
			pst.setInt(4, customerBean.getCatId());
			pst.setFloat(5, customerBean.getPrice());
			pst.setInt(6, customerBean.getQuantity());
			pst.executeUpdate();
			flag=true;
			DBDAO.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
}
