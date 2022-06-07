package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.retaurant.archived.ArchivedRestaurantDAO;
import com.aj22.foodlab.dao.retaurant.archived.ArchivedRestaurantDAOImpl;
import com.aj22.foodlab.domain.ArchivedRestaurant;
import com.aj22.foodlab.dto.RestaurantDTO;

@Service
public class ArchivedRestaurantService {
	
	@Autowired
	RestaurantService restaurantService;

	public List<Integer> findMemberIdByRestaurantId(int restaurantId) throws SQLException {
		List<Integer> memberIds = null;
		ArchivedRestaurantDAO dao = new ArchivedRestaurantDAOImpl();
		memberIds = dao.selectByRestaurantId(restaurantId);
		dao.close();
		return memberIds;
	}
	
	public List<RestaurantDTO> getRestaurantsByMemberId(int memberId) throws SQLException {
		List<Integer> restaurantIds = null;
		List<RestaurantDTO> restaurants = new ArrayList<>();
		ArchivedRestaurantDAO dao = new ArchivedRestaurantDAOImpl();
		restaurantIds = dao.selectByMemberId(memberId);
		dao.close();
		
		for(int id : restaurantIds) {
			restaurants.add(restaurantService.selectById(id));
		}
		
		return restaurants;
	}
	
	public int delete(ArchivedRestaurant archivedRestaurant) throws SQLException {
		ArchivedRestaurantDAO dao = new ArchivedRestaurantDAOImpl();
		int res = dao.delete(archivedRestaurant);
		dao.close();
		return res;
	}
	
	public int insert(ArchivedRestaurant archivedRestaurant) throws SQLException {
		ArchivedRestaurantDAO dao = new ArchivedRestaurantDAOImpl();
		int res = dao.insert(archivedRestaurant);
		dao.close();
		return res;
	}
}
