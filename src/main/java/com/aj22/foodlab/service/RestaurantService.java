package com.aj22.foodlab.service;

import java.io.Console;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dao.review.ReviewDAO;
import com.aj22.foodlab.dao.review.ReviewDAOImpl;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.util.Pagination;

@Service
public class RestaurantService {

	public List<RestaurantDTO> selectList(Pagination pagination) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage());
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
	
	public RestaurantDTO selectById(int id) throws SQLException{
		RestaurantDTO restaurant = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurant = dao.select(id);
		dao.close();
		return restaurant;
	}
	
	public List<RestaurantDTO> selectByCategory(String category) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.select(category);
		dao.close();
		return restaurants;
	}

	public int getNumOfRecord() throws SQLException {
		int cnt = 0;
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		cnt = dao.countRecords();
		dao.close();
		
		return cnt;
	}
}
