package com.aj22.foodlab.dao.restaurant.archived;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.ArchivedRestaurant;
import com.aj22.foodlab.util.ConnectionProvider;

public class ArchivedRestaurantDAOImpl implements ArchivedRestaurantDAO{

	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public ArchivedRestaurantDAOImpl() {
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
	public int insert(ArchivedRestaurant archivedRestaurant) throws SQLException {
		
		int cnt = 0;
		
		String sql = "INSERT INTO archived_restaurant" + 
				"(member_id, restaurant_id) " + 
				"VALUES(?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, archivedRestaurant.getMemberId());
		pstmt.setInt(2, archivedRestaurant.getRestaurantId());
	
		cnt = pstmt.executeUpdate();
		
		return cnt;
	}
	
	@Override
	public int delete(ArchivedRestaurant archivedRestaurant) throws SQLException {
		int cnt = 0;
		
		String sql = "delete from archived_restaurant where restaurant_id=? AND member_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, archivedRestaurant.getRestaurantId());
		pstmt.setInt(2, archivedRestaurant.getMemberId());
		cnt = pstmt.executeUpdate();
	
		return cnt;
	}
	
	@Override
	public List<Integer> selectByMemberId(int memberId) throws SQLException {
		List<Integer> restaurantIdsArchived = new ArrayList<>();
		String sql = "select restaurant_id from archived_restaurant where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memberId);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			restaurantIdsArchived.add(rs.getInt("restaurant_id"));
		}
		
		return restaurantIdsArchived;
	}
	
	@Override
	public List<Integer> selectByRestaurantId(int restaurantId) throws SQLException {
		List<Integer> memberIdsArchivingThis = new ArrayList<>();
		String sql = "select member_id from archived_restaurant where restaurant_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, restaurantId);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			memberIdsArchivingThis.add(rs.getInt("member_id"));
		}
		
		return memberIdsArchivingThis;
	}
	
	public ArchivedRestaurant createFromResultSet(ResultSet rs) throws SQLException {
		
		ArchivedRestaurant archivedRestaurant = null;
		
		int memberId = rs.getInt("member_id");
		int restaurantId = rs.getInt("restaurant_id");
		
		archivedRestaurant = new ArchivedRestaurant(memberId, restaurantId);

		return archivedRestaurant;
	}

}
