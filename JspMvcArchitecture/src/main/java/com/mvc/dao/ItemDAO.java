package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.CategoryBean;
import com.mvc.beans.CustomerBean;
import com.mvc.beans.FarmerBean;
import com.mvc.beans.ItemBean;

public class ItemDAO {
	
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
	
	public static ArrayList<ItemBean> listAllItems()throws SQLException{
		ArrayList<ItemBean> ItemBean=new ArrayList<ItemBean>();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM Item");
			rs=pst.executeQuery();
			while(rs.next()){
				ItemBean item=new ItemBean();
				item.setItemId(rs.getInt(1));
				item.setItemName(rs.getString(2));
				item.setcatId(rs.getInt(3));
				item.setItemPrice(rs.getFloat(4));
				ItemBean.add(item);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return ItemBean;
	}
	
	public static ArrayList<ItemBean> fetchItemById(int itemId)throws SQLException{
		ArrayList<ItemBean> itemBean=new ArrayList<ItemBean>();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM item where itemId="+itemId+" ");
			rs=pst.executeQuery();
			while(rs.next()){
				ItemBean itm=new ItemBean();
				itm.setItemId(rs.getInt(1));
				itm.setItemName(rs.getString(2));
				itm.setcatId(rs.getInt(3));
				itm.setItemPrice(rs.getFloat(4));
				itemBean.add(itm);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return itemBean;
	}
	
	public static boolean InsertItem(ItemBean itemBean) {
		try {
			con=getDbConnection();
			pst=con.prepareStatement("insert into item(ItemName,catId,ItemPrice) values(?,?,?)");
			pst.setString(1, itemBean.getItemName());
			pst.setInt(2, itemBean.getcatId());
			pst.setFloat(3, itemBean.getItemPrice());
			pst.executeUpdate();
			flag=true;
			DBDAO.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public static boolean updateItem(ItemBean itemBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("update item set itemName=?,itemPrice=? ,catId=? where itemId =?");
			pst.setString(1,itemBean.getItemName());
			pst.setFloat(2, itemBean.getItemPrice());
			pst.setInt(3, itemBean.getcatId());
			pst.setInt(4,itemBean.getItemId());
			pst.executeUpdate();
			flag=true;
		}
		catch(SQLException sql){
			sql.printStackTrace();
		}
		finally{
			con.close();
		}
		return flag;
	}
	
	public static boolean deleteItem(ItemBean itemBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("delete from item where itemId =?");
			pst.setInt(1,itemBean.getItemId());
			pst.executeUpdate();
			flag=true;
		}
		catch(SQLException sql){
			sql.printStackTrace();
		}
		finally{
			con.close();
		}
		return flag;
	}
	
	public static boolean deleteAllItemByCatId(CategoryBean categoryBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("delete from item where catId =?");
			pst.setInt(1,categoryBean.getCatId());
			pst.executeUpdate();
			flag=true;
		}
		catch(SQLException sql){
			sql.printStackTrace();
		}
		finally{
			con.close();
		}
		return flag;
	}
	
	public static int fetchCategoryIdByItemId(int itemId)throws SQLException{
		
		FarmerBean farmer=new FarmerBean();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT catId FROM item where itemId="+itemId+" ");
			rs=pst.executeQuery();
			
			while(rs.next()){
			
				farmer.setCatId(rs.getInt(1));
			
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return farmer.getCatId();
	}
	
	public static String fetchItemNameByItemId(int itemId)throws SQLException{
		
		ItemBean item=new ItemBean();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM Item where ItemId="+itemId+" ");
			rs=pst.executeQuery();
			while(rs.next()){
			
				item.setItemName(rs.getString("ItemName"));
			
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return item.getItemName();
	}
	
	public static float fetchItemPriceByItemId(int itemId)throws SQLException{
		
		CustomerBean customer=new CustomerBean();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT itemPrice FROM item where itemId="+itemId+" ");
			rs=pst.executeQuery();
			
			while(rs.next()){
			
				customer.setPrice(rs.getFloat(1));
			
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return customer.getPrice();
	}
	
}
