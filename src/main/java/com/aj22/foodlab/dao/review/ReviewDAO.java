package com.aj22.foodlab.dao.review;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.Review;


public interface ReviewDAO {
	Integer insert(Review review) throws SQLException;
	void close() throws SQLException;
	int delete(int id) throws SQLException;
	int edit(Review review) throws SQLException;
	Review select(int id) throws SQLException;
	List<Review> selectList() throws SQLException;
	//List<ReviewDTO> selectListByCategory(String category) throws SQLException;
}
