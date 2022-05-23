package com.aj22.foodlab.dao.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.dto.CommentDTO;
import com.aj22.foodlab.util.ConnectionProvider;

public class CommentDAOImpl implements CommentDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	// FoodDAOImpl 객체가 생성될때 Connection도 생성된다.
	public CommentDAOImpl() {
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
	public int insert(CommentDTO comment) throws SQLException {
		
		int cnt = 0;
		
		try {
			String sql = "INSERT INTO comment" + 
					"(review_id, member_id, content, parent_comment_id) " + 
					"VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getReviewId());
			pstmt.setInt(2, comment.getWriterId());
			pstmt.setString(3, comment.getContent());
			pstmt.setInt(4, comment.getParentCommentId());
		
			cnt = pstmt.executeUpdate();
		}finally {
			close();
		}
		
		return cnt;
	}

	@Override
	public int delete(int id) throws SQLException {
		int cnt = 0;
		
		try {
			String sql = "delete from comment where comment_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}

	@Override
	public int edit(CommentDTO comment) throws SQLException {
		
		int cnt = 0;
		
		try {
			String sql = "update comment set content=?, updatedAt=? where comment_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getContent());
			pstmt.setTimestamp(2, comment.getUpdatedAt());
			pstmt.setInt(3, comment.getCommentId());
			
			cnt = pstmt.executeUpdate();
		}  finally {
			close();
		}
		return cnt;
	}

	@Override
	public CommentDTO select(int id) throws SQLException {
		
		CommentDTO comment = new CommentDTO();
		
		try {
			String sql = "select * from comment where comment_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				comment = createFromResultSet(rs);
			}
		}finally {
			close();
		}
		
		return comment;
	}
	
	public CommentDTO createFromResultSet(ResultSet rs) {
		
		CommentDTO comment = null;
		
		try {
			int commentId = rs.getInt("comment_id");
			int reviewId = rs.getInt("review_id");
			int writerId = rs.getInt("member_id");
			Timestamp createdAt = rs.getTimestamp("created_at");
			Timestamp updatedAt = rs.getTimestamp("updated_at");
			String content = rs.getString("content");
			int parentCommentId = rs.getInt("parent_comment_id");
			
			comment = new CommentDTO(commentId, reviewId, writerId, createdAt, updatedAt, content, parentCommentId);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comment;
	}

	@Override
	public List<CommentDTO> selectList() throws SQLException {
		
		List<CommentDTO> comments = new ArrayList<>();
		
		try {
			String sql = "select * from comment";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				comments.add(createFromResultSet(rs));
			}
		}  finally {
			close();
		}
		
		return comments;
	}

}
