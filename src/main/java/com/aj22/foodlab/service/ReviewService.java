package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.review.ReviewDAO;
import com.aj22.foodlab.dao.review.ReviewDAOImpl;
import com.aj22.foodlab.dto.ReviewDTO;

@Service
public class ReviewService {

	public List<ReviewDTO> selectList() throws SQLException{
		List<ReviewDTO> reviews = null;
		ReviewDAO dao = new ReviewDAOImpl();
		reviews = dao.selectList();
		return reviews;
	}
}
