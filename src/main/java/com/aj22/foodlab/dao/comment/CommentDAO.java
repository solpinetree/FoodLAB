package com.aj22.foodlab.dao.comment;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.Comment;
import com.aj22.foodlab.dto.CommentDTO;

public interface CommentDAO {
	Integer insert(Comment comment) throws SQLException;
	int delete(int id) throws SQLException;
	int edit(Comment comment) throws SQLException;
	List<Comment> selectByReviewId(int id) throws SQLException;
	List<Comment> selectList() throws SQLException;
	//List<ReviewDTO> selectListByCategory(String category) throws SQLException;
	void close() throws SQLException;
	List<Comment> selectByParentId(int id) throws SQLException;
	Comment selectByCommentId(int id) throws SQLException;
}
