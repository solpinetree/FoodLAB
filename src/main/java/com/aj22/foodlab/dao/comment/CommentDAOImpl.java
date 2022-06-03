package com.aj22.foodlab.dao.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.Comment;
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
	@Override
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}

	@Override
	public Integer insert(Comment comment) throws SQLException {
		
		Integer autoIncrement = null;
		String sql = null;
		
		if(comment.getParentCommentId()!=null) {
			sql = "INSERT INTO comment" + 
					"(review_id, member_id, content, parent_comment_id) " + 
					"VALUES(?, ?, ?, ?)";
		}else {
			sql = "INSERT INTO comment" + 
					"(review_id, member_id, content) " + 
					"VALUES(?, ?, ?)";
		}
		pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, comment.getReviewId());
		pstmt.setInt(2, comment.getMemberId());
		pstmt.setString(3, comment.getContent());
		if(comment.getParentCommentId()!=null) {
			pstmt.setInt(4, comment.getParentCommentId());
		}
	
		pstmt.executeUpdate();
	
		rs = pstmt.getGeneratedKeys(); 	// 쿼리 실행 후 생성된 AI 값 반환
		if(rs.next()) {
			autoIncrement = rs.getInt(1);
		}
		
		return autoIncrement;
	}

	@Override
	public int delete(int id) throws SQLException {
		int cnt = 0;
		
		String sql = "delete from comment where comment_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		cnt = pstmt.executeUpdate();
		
		return cnt;
	}

	@Override
	public int edit(Comment comment) throws SQLException {
		
		int cnt = 0;
		
		String sql = "update comment set content=?, updatedAt=? where comment_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, comment.getContent());
		pstmt.setTimestamp(2, comment.getUpdatedAt());
		pstmt.setInt(3, comment.getCommentId());
		
		cnt = pstmt.executeUpdate();
		
		return cnt;
	}

	@Override
	public List<Comment> selectByReviewId(int id) throws SQLException {
		
		List<Comment> comments = new ArrayList<>();
		
		String sql = "select * from comment where review_id=? order by createdAt asc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			comments.add(createFromResultSet(rs));
		}
	
		return comments;
	}
	
	@Override
	public List<Comment> selectByParentId(int id) throws SQLException {
		
		List<Comment> comments = new ArrayList<>();
		
		String sql = "select * from comment where parent_comment_id=? order by createdAt asc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			comments.add(createFromResultSet(rs));
		}
	
		return comments;
	}
	
	@Override
	public Comment selectByCommentId(int id) throws SQLException {
		
		Comment comment = null;
		
		String sql = "select * from comment where comment_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			comment = createFromResultSet(rs);
		}
	
		return comment;
	}
	
	public Comment createFromResultSet(ResultSet rs) throws SQLException {
		
		Comment comment = null;
		
		Integer commentId = rs.getInt("comment_id");
		Integer reviewId = rs.getInt("review_id");
		Integer writerId = rs.getInt("member_id");
		Timestamp createdAt = rs.getTimestamp("createdAt");
		Timestamp updatedAt = rs.getTimestamp("updatedAt");
		String content = rs.getString("content");
		Integer parentCommentId = rs.getInt("parent_comment_id");
		parentCommentId = rs.wasNull() ? null : parentCommentId;
		
		comment = new Comment(commentId, reviewId, writerId, createdAt, updatedAt, content, parentCommentId);
			
		return comment;
	}

	@Override
	public List<Comment> selectList() throws SQLException {
		
		List<Comment> comments = new ArrayList<>();
	
		String sql = "select * from comment";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			comments.add(createFromResultSet(rs));
		}
		
		return comments;
	}

}
