package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.CategoryBean;

public class CategoryDAO {
	
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
	
	public static boolean InsertCategory(CategoryBean categoryBean) {
		try {
			con=getDbConnection();
			pst=con.prepareStatement("insert into category(catName) values(?)");
			pst.setString(1, categoryBean.getCatName());
			pst.executeUpdate();
			flag=true;
			DBDAO.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public static ArrayList<CategoryBean> listAllCategories()throws SQLException{
		ArrayList<CategoryBean> categoryBean=new ArrayList<CategoryBean>();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM category");
			rs=pst.executeQuery();
			while(rs.next()){
				CategoryBean category=new CategoryBean();
				category.setCatId(rs.getInt(1));
				category.setCatName(rs.getString(2));
				categoryBean.add(category);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	
		return categoryBean;
	}
	
	public static ArrayList<CategoryBean> fetchCategoryById(int catId)throws SQLException{
		ArrayList<CategoryBean> categoryBean=new ArrayList<CategoryBean>();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM category where catId="+catId+" ");
			rs=pst.executeQuery();
			while(rs.next()){
			CategoryBean cat=new CategoryBean();
			cat.setCatId(rs.getInt(1));
			cat.setCatName(rs.getString(2));
			categoryBean.add(cat);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return categoryBean;
	}
	
	public static boolean updateCategory(CategoryBean categoryBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("update category set catName=? where catId =?");
			pst.setString(1,categoryBean.getCatName());
			pst.setInt(2,categoryBean.getCatId());
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
	
	public static boolean deleteCategory(CategoryBean categoryBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		try {
			pst=con.prepareStatement("delete from category where catId =?");
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
		if(flag)
			ItemDAO.deleteAllItemByCatId(categoryBean);
		
		return flag;
		
	}
	
	public static String fetchCategoryNameByCatId(int catId)throws SQLException{
		
		CategoryBean cat=new CategoryBean();
		con=getDbConnection();
		try{
			pst=con.prepareStatement("SELECT * FROM category where catId="+catId+" ");
			rs=pst.executeQuery();
			while(rs.next()){
			
				cat.setCatId(rs.getInt(1));
				cat.setCatName(rs.getString(2));
			
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return cat.getCatName();
	}
	
}
