package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.likes.LikesDAO;
import com.aj22.foodlab.dao.likes.LikesDAOImpl;
import com.aj22.foodlab.domain.Likes;
import com.aj22.foodlab.dto.ReviewDTO;

@Service
public class LikesService {
	
	@Autowired
	ReviewService reviewService;
	
	public List<Likes> selectByReviewId(int reviewId) throws SQLException {
		List<Likes> likes = null;
		LikesDAO dao = new LikesDAOImpl();
		likes = dao.selectByReviewId(reviewId);
		dao.close();
		return likes;
	}
	
	public List<Integer> selectMemberIdByReviewId(int reviewId) throws SQLException{
		LikesDAO dao = new LikesDAOImpl();
		List<Integer> membersIdsWhoLike = dao.selectMemberIdByReviewId(reviewId);
		dao.close();
		return membersIdsWhoLike;
	}
	
	public List<ReviewDTO> getReviewsByMemberId(int memberId) throws SQLException{
		List<ReviewDTO> reviews = new ArrayList<>();
		
		LikesDAO dao = new LikesDAOImpl();
		List<Integer> reviewIds= dao.selectByMemberId(memberId);
		dao.close();
		
		for(int id : reviewIds) {
			reviews.add(reviewService.selectForList(id));
		}
		
		return reviews;
	}
	
	public int getLikesCount(int reviewId) throws SQLException {
		return selectByReviewId(reviewId).size();
	}
	
	public String getHeartImgUrl(Likes likes) throws SQLException{
		if(!didThisMemberHitLike(likes)) {
			return "/foodlab/resources/img/icon/heart-empty.png";
		}
		return "/foodlab/resources/img/icon/heart-red.png";
	}
	
	public boolean didThisMemberHitLike(Likes likes) throws SQLException{
		LikesDAO dao = new LikesDAOImpl();
		Likes res = dao.selectByReviewIdAndMemberId(likes);
		dao.close();
		if(res == null) {
			return false;
		}else {
			return true;
		}
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
