package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj22.foodlab.controller.ReviewController;
import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dao.retaurant.menu.RestaurantMenuDAO;
import com.aj22.foodlab.dao.retaurant.menu.RestaurantMenuDAOImpl;
import com.aj22.foodlab.domain.Restaurant;
import com.aj22.foodlab.domain.RestaurantMenu;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.util.Pagination;

@Service
public class RestaurantService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ArchivedRestaurantService archivedRestaurantService;
	
	static final int NumOfRecordsPerPage = 12;
	
	public List<RestaurantMenu> selectMenus(int id) throws SQLException{
		List<RestaurantMenu> menus = null;
		RestaurantMenuDAO dao = new RestaurantMenuDAOImpl();
		menus = dao.select(id);
		dao.close();
		return menus;
	}
	
	public RestaurantDTO convertToDto(Restaurant restaurant) throws SQLException{
		RestaurantDTO dto = new RestaurantDTO(restaurant);
		dto.setNumOfReviews(reviewService.countRecordsByRestaurantId(restaurant.getRestaurantId()));
		dto.setMemberIdsArchivingThis(archivedRestaurantService.findMemberIdByRestaurantId(restaurant.getRestaurantId()));
		return dto;
	}

	public List<RestaurantDTO> selectList(Pagination pagination) throws SQLException{
		List<Restaurant> restaurants = null;
		List<RestaurantDTO> dto = new ArrayList<>();
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage());
		
		for(Restaurant restaurant : restaurants) {
			dto.add(convertToDto(restaurant));
		}
		
		dao.close();
		return dto;
	}
	
	public List<RestaurantDTO> findByCategory(String category) throws SQLException{
		List<Restaurant> restaurants = null;
		List<RestaurantDTO> dto = new ArrayList<>();
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.select(category);
		
		for(Restaurant restaurant : restaurants) {
			dto.add(convertToDto(restaurant));
		}
		
		dao.close();
		return dto;
	}
	
	public List<RestaurantDTO> findByCategoryWithPagination(Pagination pagination, String category) throws SQLException{
		List<Restaurant> restaurants = null;
		List<RestaurantDTO> dto = new ArrayList<>();
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		
		if(category.equals("전체")) {
			restaurants = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage());
		}else {
			restaurants = dao.findByCategoryWithLimit(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage(), category);
		}
		
		for(Restaurant restaurant : restaurants) {
			dto.add(convertToDto(restaurant));
		}
		
		dao.close();
		return dto;
	}
	
	public List<RestaurantDTO> findByNameWithPanination(Pagination pagination, String name) throws SQLException{
		List<Restaurant> restaurants = null;
		List<RestaurantDTO> dto = new ArrayList<>();
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurants = dao.findBySearchWithLimit(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage(), name);
		dao.close();
		
		for(Restaurant restaurant : restaurants) {
			dto.add(convertToDto(restaurant));
		}
		
		return dto;
	}
	
	public RestaurantDTO selectById(int id) throws SQLException{
		Restaurant restaurant = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurant = dao.select(id);
		dao.close();
		return convertToDto(restaurant);
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
		if(id!=null) {
		return id;
		}
		else {
		return 1;
		}
		
		
	}
	
	public String getRestaurantNameById(int id) throws SQLException {
		String restaurantName = null;
		RestaurantDAO dao = new RestaurantDAOImpl();
		restaurantName = dao.getRestaurantNameById(id);
		dao.close();
		return restaurantName;
		
	}
	
	
	public Pagination getPaginationBySearchKeyword(int currentPage, String keyword) throws SQLException{
		
		int numOfRecords = getNumOfRecordByName(keyword);
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		return pagination;
	}
	
	
	public Pagination getPaginationByCategory(int currentPage, String category) throws SQLException{
		
		int numOfRecords = 0;
		
		if(category.equals("전체")) {
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
	
	public int countResult(String category) throws SQLException {
		if(category.equals("전체")) {
			return getNumOfRecord();
		}else {
			return getNumOfRecordOfCategory(category);
		}
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
	
	public int RestaurantAvgRateUpdate(int id, float avg_rate, float avgPriceSatisRate) throws SQLException{
		int cnt = 0;
		
		RestaurantDAO dao = new RestaurantDAOImpl();
		cnt = dao.RestaurantAvgRateUpdate(id, avg_rate, avgPriceSatisRate);
		dao.close();
		
		return cnt;
	}
	
}
