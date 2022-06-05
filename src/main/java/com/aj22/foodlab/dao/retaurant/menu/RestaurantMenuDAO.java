package com.aj22.foodlab.dao.retaurant.menu;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.RestaurantMenu;

public interface RestaurantMenuDAO {

	void close() throws SQLException;

	List<RestaurantMenu> select(int id) throws SQLException;

}
