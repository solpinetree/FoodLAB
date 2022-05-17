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
	List<RestaurantDTO> selectList() throws SQLException;
	List<String> selectCategories() throws SQLException;
	//List<ReviewDTO> selectListByCategory(String category) throws SQLException;
	Integer getRestaurantIDByName(String name) throws SQLException;
}
