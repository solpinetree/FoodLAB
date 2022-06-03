package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.util.Pagination;

@Service
public class RestaurantService {
	
	static final int NumOfRecordsPerPage = 12;

	public List<RestaurantDTO> selectList(Pagination pagination) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage());
		dao.close();
		return restaurants;
	}
	
	public List<RestaurantDTO> findByCategory(String category) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.select(category);
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
	
	public List<RestaurantDTO> selectByName(String name) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.select_name(name);
		dao.close();
		return restaurants;
	}
	
	public List<RestaurantDTO> findByCategoryWithPagination(Pagination pagination, String category) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		
		if(category.equals("��泥�")) {
			restaurants = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage());
		}else {
			restaurants = dao.findByCategoryWithLimit(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage(), category);
		}
		dao.close();
		return restaurants;
	}
	
	public Pagination getPaginationBySearchKeyword(int currentPage, String keyword) throws SQLException{
		
		int numOfRecords = getNumOfRecordByName(keyword);
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		return pagination;
	}
	
	public List<RestaurantDTO> findByNameWithPanination(Pagination pagination, String name) throws SQLException{
		List<RestaurantDTO> restaurants = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.findBySearchWithLimit(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage(), name);
		dao.close();
		return restaurants;
	}
	
	public Pagination getPaginationByCategory(int currentPage, String category) throws SQLException{
		
		int numOfRecords = 0;
		
		if(category.equals("all")) {
			numOfRecords = getNumOfRecord();
		}else {
			numOfRecords = getNumOfRecordOfCategory(category);
		}
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		return pagination;
	}
	
	public int getNumOfRecord() throws SQLException {
		int cnt = 0;
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		cnt = dao.countRecords();
		dao.close();
		
		return cnt;
	}

	public int getNumOfRecordOfCategory(String category) throws SQLException {
		int cnt = 0;
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		cnt = dao.countRecords_category(category);
		dao.close();
		
		return cnt;
	}
	
	public int getNumOfRecordByName(String name) throws SQLException {
		int cnt = 0;
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		cnt = dao.countRecordsByName(name);
		dao.close();
		
		return cnt;
	}
	
}
