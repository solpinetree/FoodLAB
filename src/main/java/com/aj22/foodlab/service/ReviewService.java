package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aj22.foodlab.dao.review.ReviewDAO;
import com.aj22.foodlab.dao.review.ReviewDAOImpl;
import com.aj22.foodlab.dto.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	private RestaurantService restaurantService;

	public List<ReviewDTO> selectList() throws SQLException{
		List<ReviewDTO> reviews = null;
		ReviewDAO dao = new ReviewDAOImpl();
		reviews = dao.selectList();
		dao.close();
		return reviews;
	}
	
	public Integer insert(ReviewDTO review) throws SQLException {
		ReviewDAO dao = new ReviewDAOImpl();
		Integer reviewId = dao.insert(review);
		dao.close();
		return reviewId;
	}
	
	public ReviewDTO select(int reviewId) throws SQLException{
		ReviewDAO dao = new ReviewDAOImpl();
		ReviewDTO review = dao.select(reviewId);
		dao.close();
		return review;
	}
}
