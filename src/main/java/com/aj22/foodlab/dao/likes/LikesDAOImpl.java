package com.aj22.foodlab.dao.likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.Likes;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.util.ConnectionProvider;

public class LikesDAOImpl implements LikesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	// FoodDAOImpl 객체가 생성될때 Connection도 생성된다.
	public LikesDAOImpl() {
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

	public Likes createFromResultSet(ResultSet rs) throws SQLException {
		
		Likes like = null;
		
		int memberId = rs.getInt("member_id");
		int reviewId = rs.getInt("review_id");
		
		like = new Likes(memberId, reviewId);
	
		return like;
	}
	
	
	@Override
	public List<Likes> selectByReviewId(int reviewId) throws SQLException {
		List<Likes> likes = new ArrayList<>();
		
		String sql = "select * from likes where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewId);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			likes.add(createFromResultSet(rs));
		}

		return likes;
	}
	
	
}
