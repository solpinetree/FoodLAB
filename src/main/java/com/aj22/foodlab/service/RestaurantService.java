package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dto.RestaurantDTO;

@Service
public class RestaurantService {

	public List<RestaurantDTO> getRestaurants() throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.selectList();
		dao.close();
		return restaurants;
	}
	
	public List<String> getCategories() throws SQLException{
		List<String> categories = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		categories = dao.selectCategories();
		dao.close();
		return categories;
	}
	
	public Integer getRestaurantIdFromName(String name) throws SQLException {
		Integer id = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		id = dao.getRestaurantIDByName(name);
		dao.close();
		return id;
	}
	
	public RestaurantDTO getRestaurantById(int id) throws SQLException{
		RestaurantDTO restaurant = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurant = dao.select(id);
		dao.close();
		return restaurant;
	}

}
