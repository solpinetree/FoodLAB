package com.aj22.foodlab.dao.comment;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.dto.CommentDTO;

public interface CommentDAO {
	int insert(CommentDTO comment) throws SQLException;
	int delete(int id) throws SQLException;
	int edit(CommentDTO comment) throws SQLException;
	CommentDTO select(int id) throws SQLException;
	List<CommentDTO> selectList() throws SQLException;
	//List<ReviewDTO> selectListByCategory(String category) throws SQLException;
}
