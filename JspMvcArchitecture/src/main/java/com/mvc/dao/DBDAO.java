package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO {
	
	private static Connection dbCon;
	private static String dbURL;
	private static String dbDriver;
	private static String userName;
	private static String passWord;
	
	private static void dgInit() {
		try {
			
			dbDriver="com.mysql.cj.jdbc.Driver";
			dbURL="jdbc:mysql://localhost:3306/govegstore";
			userName="root";
			passWord="password";
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
	
	public static void connect() throws ClassCastException,SQLException{
		dgInit();
		try {
			
			Class.forName(dbDriver);
			dbCon=DriverManager.getConnection(dbURL,userName,passWord);
			setDBCon(dbCon);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void setDBCon(Connection con) {
		dbCon=con;
	}
	
	public static Connection getDBCon() {
		return dbCon;
	}

	public static void close() throws SQLException {
		dbCon.close();
	}
	
}
