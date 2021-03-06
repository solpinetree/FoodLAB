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
	
	@Override
	public int insert(Likes likes) throws SQLException {
		
		int cnt = 0;

		String sql = "INSERT INTO likes" + 
				"(review_id, member_id) " + 
				"VALUES(?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, likes.getReviewId());
		pstmt.setInt(2, likes.getMemberId());
		cnt = pstmt.executeUpdate();
		
		return cnt;
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
	
	@Override
	public List<Integer> selectByMemberId(int memberId) throws SQLException {
		List<Integer> reviewIds = new ArrayList<>();
		
		String sql = "select review_id from likes where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memberId);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			reviewIds.add(rs.getInt("review_id"));
		}

		return reviewIds;
	}
	
	@Override
	public Likes selectByReviewIdAndMemberId(Likes likes) throws SQLException {
		Likes res = null;
		
		String sql = "select * from likes where review_id=? and member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, likes.getReviewId());
		pstmt.setInt(2, likes.getMemberId());
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			res = createFromResultSet(rs);
		}

		return res;
	}
	
	@Override
	public int delete(Likes likes) throws SQLException {
		int cnt = 0;
		
		String sql = "delete from likes where review_id=? and member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, likes.getReviewId());
		pstmt.setInt(2, likes.getMemberId());
		cnt = pstmt.executeUpdate();

		return cnt;
	}
	
	@Override
	public List<Integer> selectMemberIdByReviewId(int reviewId) throws SQLException{
		List<Integer> memberIds = new ArrayList<>();
		
		String sql = "select member_id from likes where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, reviewId);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			memberIds.add(rs.getInt("member_id"));
		}
		return memberIds;
	}
	
}
