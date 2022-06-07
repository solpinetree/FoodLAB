package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.retaurant.archived.ArchivedRestaurantDAO;
import com.aj22.foodlab.dao.retaurant.archived.ArchivedRestaurantDAOImpl;
import com.aj22.foodlab.domain.ArchivedRestaurant;

@Service
public class ArchivedRestaurantService {

	public List<Integer> findMemberIdByRestaurantId(int restaurantId) throws SQLException {
		List<Integer> memberIds = null;
		ArchivedRestaurantDAO dao = new ArchivedRestaurantDAOImpl();
		memberIds = dao.selectByRestaurantId(restaurantId);
		dao.close();
		return memberIds;
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
