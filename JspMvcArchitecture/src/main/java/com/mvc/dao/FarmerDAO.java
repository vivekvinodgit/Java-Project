package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.FarmerBean;

public class FarmerDAO {
	
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
	
	public static ArrayList<FarmerBean> listAllFarmers()throws SQLException{
		
		ArrayList<FarmerBean> farmerBean=new ArrayList<FarmerBean>();
		con=getDbConnection();
		
		try{
			pst=con.prepareStatement("SELECT * FROM farmer");
			rs=pst.executeQuery();
			
			while(rs.next()){
				
				FarmerBean farmer=new FarmerBean();
				farmer.setFarmerId(rs.getInt(1));
				farmer.setFarmerName(rs.getString(2));
				farmer.setFarmerAddress(rs.getString(3));
				farmer.setFarmerPhoneNumber(rs.getString(4));
				farmer.setItemId(rs.getInt(5));
				farmer.setCatId(rs.getInt(6));
				farmerBean.add(farmer);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return farmerBean;
	}
	
	public static boolean insertFarmer(FarmerBean farmerBean) {
		try {
			con=getDbConnection();
			pst=con.prepareStatement("insert into farmer(farmerName,farmerAddress,farmerPhoneNumber,itemId,catId) values(?,?,?,?,?)");
			pst.setString(1, farmerBean.getFarmerName());
			pst.setString(2, farmerBean.getFarmerAddress());
			pst.setString(3, farmerBean.getFarmerPhoneNumber());
			pst.setInt(4, farmerBean.getItemId());
			pst.setInt(5, farmerBean.getCatId());
			pst.executeUpdate();
			flag=true;
			DBDAO.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public static ArrayList<FarmerBean> fetchFarmerById(int farmerId)throws SQLException{
		ArrayList<FarmerBean> farmerBean=new ArrayList<FarmerBean>();
		
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM farmer where farmerId="+farmerId+" ");
			rs=pst.executeQuery();
			while(rs.next()){
				FarmerBean farmer = new FarmerBean();
				farmer.setFarmerId(rs.getInt(1));
				farmer.setFarmerName(rs.getString(2));
				farmer.setFarmerAddress(rs.getString(3));
				farmer.setFarmerPhoneNumber(rs.getString(4));
				farmer.setItemId(rs.getInt(5));
				farmer.setCatId(rs.getInt(6));
				farmerBean.add(farmer);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return farmerBean;
	}
	
	public static boolean updateFarmer(FarmerBean farmerBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("update farmer set farmerName=?,farmerAddress=?,farmerPhoneNumber=?,itemId=? ,catId=? where farmerId =?");
			pst.setString(1,farmerBean.getFarmerName());
			pst.setString(2, farmerBean.getFarmerAddress());
			pst.setString(3, farmerBean.getFarmerPhoneNumber());
			pst.setInt(4,farmerBean.getItemId());
			pst.setInt(5, farmerBean.getCatId());
			pst.setInt(6, farmerBean.getFarmerId());
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
	
	public static boolean deleteFarmer(FarmerBean farmerBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("delete from farmer where farmerId=?");
			pst.setInt(1,farmerBean.getFarmerId());
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
	
	public static int fetchCategoryIdByFarmerId(int farmerId)throws SQLException{
		
		FarmerBean farmer=new FarmerBean();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT catId FROM farmer where farmerId="+farmerId+" ");
			rs=pst.executeQuery();
			
			while(rs.next()){
			
				farmer.setCatId(rs.getInt(1));
			
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return farmer.getCatId();
	}
	
	public static int fetchItemIdByFarmerId(int farmerId)throws SQLException{
		
		FarmerBean farmer=new FarmerBean();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT itemId FROM farmer where farmerId="+farmerId+" ");
			rs=pst.executeQuery();
			
			while(rs.next()){
			
				farmer.setItemId(rs.getInt(1));
			
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return farmer.getItemId();
	}
	
}
