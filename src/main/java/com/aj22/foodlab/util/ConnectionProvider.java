package com.aj22.foodlab.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	// JDBC driver name and database URL
	public static final String DB_PROPERTIES = "?serverTimezone=Asia/Seoul&useSSL=false"; // MySQL Connector J 8.0
	private static final String DB_SCHEMAS = "foodlab";
	public static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // deprecated "com.mysql.jdbc.Driver";  // try "com.mysql.cj.jdbc.Driver"
//	public static final String DB_URL = "jdbc:mysql://158.247.206.153/" + DB_SCHEMAS + DB_PROPERTIES;
	public static final String DB_URL = "jdbc:mysql://localhost/" + DB_SCHEMAS + DB_PROPERTIES;
	
	//  Database credentials
	public static final String USER = "labadmin";
	public static final String PASS = "1234";
	
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(JDBC_DRIVER); //STEP 2: Register JDBC driver
		} catch (ClassNotFoundException e) {
			e.getMessage();
		} 
		return DriverManager.getConnection(DB_URL,USER,PASS); //STEP 3: Open a connection
	}
}
