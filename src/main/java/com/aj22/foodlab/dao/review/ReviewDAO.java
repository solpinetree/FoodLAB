package com.aj22.foodlab.dao.review;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.dto.ReviewDTO;


public interface ReviewDAO {
	int insert(ReviewDTO review) throws SQLException;
	int delete(int id) throws SQLException;
	int edit(ReviewDTO review) throws SQLException;
	ReviewDTO select(int id) throws SQLException;
	List<ReviewDTO> selectList() throws SQLException;
	//List<ReviewDTO> selectListByCategory(String category) throws SQLException;
}
