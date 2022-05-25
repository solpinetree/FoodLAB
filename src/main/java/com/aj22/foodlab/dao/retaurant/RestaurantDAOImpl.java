package com.aj22.foodlab.dao.retaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.util.ConnectionProvider;

public class RestaurantDAOImpl implements RestaurantDAO {


	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	// FoodDAOImpl 媛�泥닿� ���깅���� Connection�� ���깅����.
	public RestaurantDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB ���� 諛���
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}

	@Override
	public int insert(RestaurantDTO restaurant) throws SQLException {
		
		int cnt = 0;
		
		String sql = "INSERT INTO restaurant" + 
				"(name, address, tel, category, img_url, operation_hour) " + 
				"VALUES(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, restaurant.getName());
		pstmt.setString(2, restaurant.getAddress());
		pstmt.setString(3, restaurant.getTel());
		pstmt.setString(4, restaurant.getCategory());
		pstmt.setString(4, restaurant.getImgUrl());
		pstmt.setString(4, restaurant.getOperationHour());
	
		cnt = pstmt.executeUpdate();
		
		
		return cnt;
	}

	@Override
	public int delete(int id) throws SQLException {
		int cnt = 0;
		
		String sql = "delete from restaurant where restaurant_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		cnt = pstmt.executeUpdate();
	
		return cnt;
	}

	@Override
	public int edit(RestaurantDTO restaurant) throws SQLException {
		
		int cnt = 0;
		
		String sql = "update restaurant set name=?, address=?, tel=?, category=?, img_url=?, operation_hour=? where restaurant_id=?";
		pstmt.setString(1, restaurant.getName());
		pstmt.setString(2, restaurant.getAddress());
		pstmt.setString(3, restaurant.getTel());
		pstmt.setString(4, restaurant.getCategory());
		pstmt.setString(4, restaurant.getImgUrl());
		pstmt.setString(4, restaurant.getOperationHour());
		pstmt.setInt(5, restaurant.getRestaurantId());
		
		cnt = pstmt.executeUpdate();
		
		return cnt;
	}

	@Override
	public RestaurantDTO select(int id) throws SQLException {
		
		RestaurantDTO restaurant = new RestaurantDTO();
		
		String sql = "select * from restaurant where restaurant_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			restaurant = createFromResultSet(rs);
		}
		
		return restaurant;
	}
	
	@Override
	public List<RestaurantDTO> select(String category) throws SQLException {
		List<RestaurantDTO> restaurants = new ArrayList<>();
		String sql = "select * from restaurant where category=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "category");
		rs = pstmt.executeQuery();
		while (rs.next()) {
			restaurants.add(createFromResultSet(rs));
		}
		
		return restaurants;
	}
	
	public RestaurantDTO createFromResultSet(ResultSet rs) throws SQLException {
		
		RestaurantDTO restaurant = null;
		
		int restaurantId = rs.getInt("restaurant_id");
		String name = rs.getString("name");
		String address = rs.getString("address");
		float avgRate = rs.getFloat("avg_rate");
		String tel = rs.getString("tel");
		String category = rs.getString("category");
		String imgUrl = rs.getString("img_url");
		String operationHour = rs.getString("operation_hour");
		
		restaurant = new RestaurantDTO(restaurantId, name, address, avgRate, tel, category, imgUrl, operationHour);

		return restaurant;
	}

	@Override
	public List<RestaurantDTO> selectList(int startIdx, int listSize) throws SQLException {
		
		List<RestaurantDTO> restaurants = new ArrayList<>();
		
		String sql = "select * from restaurant limit ?, ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startIdx);
		pstmt.setInt(2, listSize);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			restaurants.add(createFromResultSet(rs));
		}
	
		
		return restaurants;
	}

	@Override
	public List<String> selectCategories() throws SQLException {

		List<String> categories = new ArrayList<>();
		
		String sql = "select distinct category from restaurant";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			categories.add(rs.getString("category"));
		}
		
		return categories;
	}
	
	@Override
	public Integer getRestaurantIDByName(String name) throws SQLException {
		
		Integer id = null;
		
		String sql = "select restaurant_id from restaurant where name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			id = rs.getInt("restaurant_id");
		}
		
		return id;
	}

	@Override
	public int countRecords() throws SQLException {
		int cnt = 0;
		
		String sql = "select count(*) from restaurant";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		return cnt;
	}

}
