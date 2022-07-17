package com.aj22.foodlab.dao.review.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.util.ConnectionProvider;

public class ReviewImagesDAOImpl implements ReviewImagesDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	// FoodDAOImpl 객체가 생성될때 Connection도 생성된다.
	public ReviewImagesDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납
	@Override
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}
	
	@Override
	public int insert(ReviewImages reviewImage) throws SQLException {
		
		int res = 0;

		String sql = "INSERT INTO review_images" + 
				"(review_id, saved_name, restaurant_id) " +
				"VALUES(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewImage.getReviewId());
		pstmt.setString(2, reviewImage.getSavedPath());
		pstmt.setInt(3, reviewImage.getRestaurantId());
		res = pstmt.executeUpdate();
		
		return res;
	}
	
	public ReviewImages createFromResultSet(ResultSet rs) throws SQLException {
		
		ReviewImages reviewImages = null;
		
		int reviewId = rs.getInt("review_id");
		String imgUrl = rs.getString("saved_name");
		int restaurantId = rs.getInt("restaurant_id");
		
		reviewImages = new ReviewImages(reviewId, imgUrl, restaurantId);

		return reviewImages;
	}
	
	@Override
	public List<ReviewImages> select(int id) throws SQLException {
		
		List<ReviewImages> images = new ArrayList<>();
		
		String sql = "select * from review_images where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			images.add(createFromResultSet(rs));
		}
		
		return images;
	}

	@Override
	public List<ReviewImages> selectByRestaurantId(int restaurantId) throws SQLException {
		
		List<ReviewImages> images = new ArrayList<>();
		
		String sql = "select * from review_images where restaurant_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, restaurantId);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			images.add(createFromResultSet(rs));
		}
		
		return images;
	}

	@Override
	public ReviewImages selectLimit1(int reviewId) throws SQLException{
		ReviewImages result = null;

		String sql = "select * from review_images where review_id=? limit 1";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			result = createFromResultSet(rs);
		}

		return result;
	}

	@Override
	public int countByReviewId(int reviewId) throws SQLException{
		int cnt = 0;

		String sql = "select count(*) from review_images where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewId);
		rs = pstmt.executeQuery();

		if(rs.next()) {
			cnt = rs.getInt(1);
		}

		return cnt;
	}
}
