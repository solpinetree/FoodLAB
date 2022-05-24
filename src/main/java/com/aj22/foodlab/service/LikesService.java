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
	
	public boolean didThisMemberHitLike(Likes likes) throws SQLException{
		LikesDAO dao = new LikesDAOImpl();
		Likes res = dao.selectByReviewIdAndMemberId(likes);
		if(res == null) {
			return false;
		}
		return true;
	}
	
	public int insert(Likes likes) throws SQLException{
		int res = 0;
		
		LikesDAO dao = new LikesDAOImpl();
		res = dao.insert(likes);
		dao.close();
		
		return res;
	}
	
	public int delete(Likes likes) throws SQLException{
		int res = 0;
		
		LikesDAO dao = new LikesDAOImpl();
		res = dao.delete(likes);
		dao.close();
		
		return res;
	}
	
	public void toggle(Likes likes) throws SQLException{
		if(didThisMemberHitLike(likes)) {
			delete(likes);
		}else {
			insert(likes);
		}
	}
}
