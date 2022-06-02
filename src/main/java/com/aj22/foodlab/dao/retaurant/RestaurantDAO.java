package com.aj22.foodlab.dao.retaurant;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.dto.RestaurantDTO;

public interface RestaurantDAO {
	int insert(RestaurantDTO restaurant) throws SQLException;
	void close() throws SQLException;
	int delete(int id) throws SQLException;
	int edit(RestaurantDTO restaurant) throws SQLException;
	RestaurantDTO select(int id) throws SQLException;
	List<RestaurantDTO> select_name(String name) throws SQLException;
	List<RestaurantDTO> select(String category) throws SQLException;
	List<RestaurantDTO> selectList(int startIdx, int listSize) throws SQLException;
	List<RestaurantDTO> findByCategoryWithLimit(int startIdx, int listSize, String category) throws SQLException;
	List<String> selectCategories() throws SQLException;
	Integer getRestaurantIDByName(String name) throws SQLException;
	int countRecords() throws SQLException;
	int countRecords_category(String category) throws SQLException;
	List<RestaurantDTO> findBySearchWithLimit(int firstReviewId, int numOfRecordsPerPage, String name) throws SQLException;;
	
}
