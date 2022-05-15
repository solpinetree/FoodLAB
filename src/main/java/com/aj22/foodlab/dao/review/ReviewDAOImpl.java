package com.aj22.foodlab.dao.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.common.ConnectionProvider;
import com.aj22.foodlab.dto.ReviewDTO;


public class ReviewDAOImpl implements ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	// FoodDAOImpl 객체가 생성될때 Connection도 생성된다.
	public ReviewDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}

	@Override
	public int insert(ReviewDTO review) throws SQLException {
		
		int cnt = 0;
		

		String sql = "INSERT INTO review" + 
				"(number_in_party, content, price_satisfaction, rate, title, thumbnail_origin_name, thumbnail_saved_name, thumbnail_saved_path, member_id, restaurant_id) " + 
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, review.getNumberInParty());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getPriceSatisfaction());
		pstmt.setInt(4, review.getRate());
		pstmt.setString(5, review.getTitle());
		pstmt.setString(6, review.getThumbnailOriginName());
		pstmt.setString(7, review.getThumbnailSavedName());
		pstmt.setString(8, review.getThumbnailSavedPath());
		pstmt.setInt(9, review.getWriterId());
		pstmt.setInt(10, review.getRestaurantId());
		cnt = pstmt.executeUpdate();
		
		
		return cnt;
	}

	@Override
	public int delete(int id) throws SQLException {
		int cnt = 0;
		
		String sql = "delete from review where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public int edit(ReviewDTO review) throws SQLException {
		
		int cnt = 0;

		String sql = "update review set number_in_party=?, content=?, price_satisfaction=?, rate=?,"
				+ " title=?, updatedAt=?, thumbnail_origin_name=?, thumbnail_saved_name=?, "
				+ " thumbnail_saved_path=?, restaurant_id=? where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, review.getNumberInParty());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getPriceSatisfaction());
		pstmt.setInt(4, review.getRate());
		pstmt.setString(5, review.getTitle());
		pstmt.setTimestamp(6, review.getUpdatedAt());
		pstmt.setString(7, review.getThumbnailOriginName());
		pstmt.setString(8, review.getThumbnailSavedName());
		pstmt.setString(9, review.getThumbnailSavedPath());
		pstmt.setInt(10, review.getRestaurantId());
		pstmt.setInt(11, review.getWriterId());
		cnt = pstmt.executeUpdate();
	
		return cnt;
	}

	@Override
	public ReviewDTO select(int id) throws SQLException {
		
		ReviewDTO review = new ReviewDTO();
		
		String sql = "select * from review where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			review = createFromResultSet(rs);
		}
	
		
		return review;
	}
	
	public ReviewDTO createFromResultSet(ResultSet rs) throws SQLException {
		
		ReviewDTO review = null;
		
		int reviewId = rs.getInt("review_id");
		int numberInParty = rs.getInt("number_in_party");
		String content = rs.getString("content");
		int priceSatisfaction = rs.getInt("price_satisfaction");
		int rate = rs.getInt("rate");
		String title = rs.getString("title");
		Timestamp createdAt = rs.getTimestamp("created_at");
		Timestamp updatedAt = rs.getTimestamp("updated_at");
		String thumbnailOriginName = rs.getString("thumbnail_origin_name");
		String thumbnailSavedName = rs.getString("thumbnail_saved_name");
		String thumbnailSavedPath = rs.getString("thumbnail_saved_path");
		int writerId = rs.getInt("member_id");
		int restaurantId = rs.getInt("restaurant_id");
		
		review = new ReviewDTO(reviewId, numberInParty, content, priceSatisfaction, rate, title, createdAt, updatedAt,
				thumbnailOriginName, thumbnailSavedName, thumbnailSavedPath, writerId, restaurantId);
	
		return review;
	}

	@Override
	public List<ReviewDTO> selectList() throws SQLException {
		
		List<ReviewDTO> reviews = new ArrayList<>();
		
		String sql = "select * from review";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			reviews.add(createFromResultSet(rs));
		}

		
		return reviews;
	}

//	@Override
//	public List<ReviewDTO> selectListByCategory(String category) throws SQLException {
//		List<ReviewDTO> foodList = new ArrayList<>();
//		
//		try {
//			String sql = "select * from mfdsfood order by category=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, category);
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				foodList.add(createFromResultSet(rs));
//			}
//		} finally {
//			close();
//		}
//		return foodList;
//	}

}
