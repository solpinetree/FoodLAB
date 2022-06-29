package com.aj22.foodlab.dao.restaurant.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.RestaurantMenu;
import com.aj22.foodlab.util.ConnectionProvider;

public class RestaurantMenuDAOImpl implements RestaurantMenuDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public RestaurantMenuDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}
	
	@Override
	public List<RestaurantMenu> select(int id) throws SQLException {
		List<RestaurantMenu> menu = new ArrayList<>();
		String sql = "select * from restaurant_menu where restaurant_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			menu.add(createFromResultSet(rs));
		}
		
		return menu;
	}
	
	public RestaurantMenu createFromResultSet(ResultSet rs) throws SQLException {
		
		RestaurantMenu menu = null;
		
		String restaurantName = rs.getString("restaurant_name");
		String menuName = rs.getString("menu_name");
		String price = rs.getString("price");
		int restaurantId = rs.getInt("restaurant_id");
		
		menu = new RestaurantMenu(restaurantName, menuName, price, restaurantId);

		return menu;
	}
}
