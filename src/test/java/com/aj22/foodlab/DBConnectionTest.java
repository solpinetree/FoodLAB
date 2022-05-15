package com.aj22.foodlab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;

import com.aj22.foodlab.common.ConnectionProvider;

public class DBConnectionTest {

	@Test
	public void selectFromRestaurantTable() throws SQLException, ClassNotFoundException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String res = null;
		
		try{
	        Class.forName(ConnectionProvider.JDBC_DRIVER);
	        conn =  DriverManager.getConnection(ConnectionProvider.DB_URL, ConnectionProvider.USER, ConnectionProvider.PASS);
	        String sql = "select name from restaurant where restaurant_id=1";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	    	if (rs.next()) {
				res = rs.getString("name");
			}
	    	
	    	System.out.println("restaurant_id = 1 인 식당의 이름은 : "+res);
		}finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();			
			if(conn != null) conn.close();
		}
		 
	}
}
