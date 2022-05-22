package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.likes.LikesDAO;
import com.aj22.foodlab.dao.likes.LikesDAOImpl;
import com.aj22.foodlab.domain.Likes;

@Service
public class LikesService {
	
	public List<Likes> selectByReviewId(int reviewId) throws SQLException {
		List<Likes> likes = null;
		LikesDAO dao = new LikesDAOImpl();
		likes = dao.selectByReviewId(reviewId);
		dao.close();
		return likes;
	}
	
	public int getLikesCount(int reviewId) throws SQLException {
		return selectByReviewId(reviewId).size();
	}
}
