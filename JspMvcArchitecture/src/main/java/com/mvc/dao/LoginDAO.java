package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.beans.LoginBean;

public class LoginDAO {
	
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

	public static boolean validateUser(LoginBean loginBean)throws Exception{
		con=getDbConnection();
		boolean flag=false;
		
		try {
			
			pst=con.prepareStatement("SELECT * FROM user where userName=? and password=?");
			pst.setString(1, loginBean.getUserName());
			pst.setString(2, loginBean.getPassword());
			rs=pst.executeQuery();
			if(rs.next()){
				flag=true;
			}
			
		}
		catch(SQLException sql){
			sql.printStackTrace();
		}
		finally{
			con.close();
		}
		System.out.println("User data "+flag);
		return flag;
	}
	
}
