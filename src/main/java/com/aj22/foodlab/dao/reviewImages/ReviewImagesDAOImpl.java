package com.aj22.foodlab.dao.reviewImages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.dto.RestaurantDTO;
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
				"(review_id, saved_name) " + 
				"VALUES(?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewImage.getReviewId());
		pstmt.setString(2, reviewImage.getSavedName());
		res = pstmt.executeUpdate();
		
		return res;
	}
	
	public ReviewImages createFromResultSet(ResultSet rs) throws SQLException {
		
		ReviewImages reviewImages = null;
		
		int reviewId = rs.getInt("review_id");
		String savedName = rs.getString("saved_name");
		
		reviewImages = new ReviewImages(reviewId, savedName);

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
}
