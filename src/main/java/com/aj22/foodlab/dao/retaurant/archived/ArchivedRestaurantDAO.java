package com.aj22.foodlab.dao.retaurant.archived;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.ArchivedRestaurant;

public interface ArchivedRestaurantDAO {
	
	void close() throws SQLException;
	int insert(ArchivedRestaurant archivedRestaurant) throws SQLException;
	int delete(ArchivedRestaurant archivedRestaurant) throws SQLException;
	List<ArchivedRestaurant> selectByMemberId(int memberId) throws SQLException;
	List<ArchivedRestaurant> selectByRestaurantId(int restaurantId) throws SQLException;
}