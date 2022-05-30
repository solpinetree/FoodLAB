package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.review.ReviewDAO;
import com.aj22.foodlab.dao.review.ReviewDAOImpl;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.dto.ReviewDTO;
import com.aj22.foodlab.util.Pagination;

@Service
public class ReviewService {
	
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private LikesService likesService;
	
	static final int NumOfRecordsPerPage = 8;
	
	public int getNumOfRecord() throws SQLException{
		int cnt = 0;
		
		ReviewDAO dao = new ReviewDAOImpl();
		cnt = dao.countRecords();
		dao.close();
		
		return cnt;
	}

	public List<ReviewDTO> selectList(Pagination pagination) throws SQLException{
		List<Review> reviews = null;
		List<ReviewDTO> reviewDTOs = new ArrayList<>();
		
		ReviewDAO dao = new ReviewDAOImpl();
		reviews = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage());
		dao.close();
		
		for(Review review : reviews) {
			ReviewDTO dto = new ReviewDTO(review);
			dto = setReviewWriterAndRestaurantAndLikesAndTimes(dto, review, "listPage");
			reviewDTOs.add(dto);
		}
			
		return reviewDTOs;
	}
	
	public Integer insert(Review review) throws SQLException {
		ReviewDAO dao = new ReviewDAOImpl();
		Integer reviewId = dao.insert(review);
		dao.close();
		return reviewId;
	}
	
	public ReviewDTO select(int reviewId) throws SQLException{
		Review review = null;
		ReviewDTO dto = null;

		ReviewDAO dao = new ReviewDAOImpl();
		review = dao.select(reviewId);
		dao.close();
		
		dto = new ReviewDTO(review);
		dto = setReviewWriterAndRestaurantAndLikesAndTimes(dto, review, "detailPage");
		
		return dto;
	}
	
	private ReviewDTO setReviewWriterAndRestaurantAndLikesAndTimes(ReviewDTO dto, Review review, String page) throws SQLException {
		dto.setWriter(memberService.selectById(review.getWriterId()));
		dto.setRestaurant(restaurantService.selectById(review.getRestaurantId()));
		dto.setMembersIdsWhoLike(likesService.selectMemberIdByReviewId(review.getReviewId()));
		
		switch(page) {
		case "listPage":
			dto.setCreatedAt(formatTimestampForList(review.getCreatedAt()));
			break;
		case "detailPage":
			dto.setCreatedAt(formatTimestampForDetail(review.getCreatedAt()));
			if(review.getUpdatedAt()!=null) {
				dto.setUpdatedAt(formatTimestampForDetail(review.getUpdatedAt()));
			}
			break;
		}
		return dto;
	}
	
	public int deleteReviewById(int id) throws SQLException {
		int res = 0;
		
		ReviewDAO dao = new ReviewDAOImpl();
		res = dao.delete(id);
		dao.close();
		
		return res;
	}
	
	public Pagination getPagination(int currentPage) throws SQLException {
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, getNumOfRecord(), NumOfRecordsPerPage);
		
		return pagination;
	}
	
	static String formatTimestampForDetail(Timestamp timestamp) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		String formattedDate = null;
		if(timestamp != null) {
			formattedDate = simpleDateFormat.format(timestamp);
		}
		
		return formattedDate;
	}

	private static String formatTimestampForList(Timestamp timestamp){
		SimpleDateFormat simpleDateFormat = null;
		if(isToday(timestamp)) {
			simpleDateFormat = new SimpleDateFormat("HH:mm");
		}else {
			simpleDateFormat = new SimpleDateFormat("MM/dd");
		}
		
	    String formattedDate = simpleDateFormat.format(timestamp);
	    return formattedDate;
	}
	
	private static boolean isToday(Timestamp timestamp) {
		Timestamp today = new Timestamp(System.currentTimeMillis());
		if(today.getYear() == timestamp.getYear() && today.getMonth() == timestamp.getMonth() && today.getDay() == timestamp.getDay()) {
			return true;
		}
		return false;
	}
	
}
