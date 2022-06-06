package com.aj22.foodlab.dao.retaurant;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.Restaurant;

public interface RestaurantDAO {
	int insert(Restaurant restaurant) throws SQLException;
	void close() throws SQLException;
	int delete(int id) throws SQLException;
	int edit(Restaurant restaurant) throws SQLException;
	Restaurant select(int id) throws SQLException;
	List<Restaurant> select_name(String name) throws SQLException;
	List<Restaurant> select(String category) throws SQLException;
	List<Restaurant> selectList(int startIdx, int listSize) throws SQLException;
	List<Restaurant> findByCategoryWithLimit(int startIdx, int listSize, String category) throws SQLException;
	List<String> selectCategories() throws SQLException;
	Integer getRestaurantIDByName(String name) throws SQLException;
	String getRestaurantNameById(int id) throws SQLException;
	int countRecords() throws SQLException;
	int countRecords_category(String category) throws SQLException;
	List<Restaurant> findBySearchWithLimit(int firstReviewId, int numOfRecordsPerPage, String name) throws SQLException;
	int countRecordsByName(String name) throws SQLException;
	
	int RestaurantAvgRateUpdate(int id, float avg_rate) throws SQLException;
	
}
