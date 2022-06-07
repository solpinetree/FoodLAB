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
	List<Review> findContentBySearchWithLimit(int startIdx, int listSize, String search) throws SQLException;
	int countRecordsByName(String name, String option,int member_id, int restaurant_id) throws SQLException;
	int countRecords(String name, int member_id, int restaurant_id, String option) throws SQLException;
	List<Review> selectList(int startIdx, int listSize, String search, String option) throws SQLException;
	
	float reviewAvgRateSelectByRestaurantId(int id) throws SQLException;
	
	//Restaurent category�� �����ϱ� ���ؼ� review(restaurantid)�� restaurant(restaurantid)�� ���ϴ� �Լ�
	List<Review> CategoryJoinByReviewRestaurantIdAndRestaurantId(String category) throws SQLException;

	
}
