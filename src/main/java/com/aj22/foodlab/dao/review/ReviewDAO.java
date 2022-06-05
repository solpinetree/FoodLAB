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
	List<Review> selectList(int startIdx, int listSize) throws SQLException;
	int countRecords() throws SQLException;
	int countRecordsByRestaurantId(int restaurantId) throws SQLException;
	List<Review> selectByRestaurantId(int id) throws SQLException;
	
	float reviewAvgRateSelectByRestaurantId(int id) throws SQLException;

}
