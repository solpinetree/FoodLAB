package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public Integer insert(ReviewDTO review, MultipartFile thumbImage, HttpServletRequest request) {
		return null;
	}
}
