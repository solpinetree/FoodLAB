package com.aj22.foodlab.dao.reviewImages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
				"(review_id, saved_name) " + 
				"VALUES(?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewImage.getReviewId());
		pstmt.setString(2, reviewImage.getSavedName());
		res = pstmt.executeUpdate();
		
		return res;
	}
}
