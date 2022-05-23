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
	
	// 리뷰 작성자와 식당, 좋아요수, 시간(작성시간, 수정시간)을  채워주는 함수
	private ReviewDTO setReviewWriterAndRestaurantAndLikesAndTimes(ReviewDTO dto, Review review, String page) throws SQLException {
		dto.setWriter(memberService.selectById(review.getWriterId()));
		dto.setRestaurant(restaurantService.selectById(review.getRestaurantId()));
		dto.setLikesCount(likesService.getLikesCount(review.getReviewId()));
		
		switch(page) {
		// review list 페이지와 상세페이지가 보여주는 작성시간과 수정시간의 포맷이 다르기 때문에 따로 처리해준다.
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
	
	private static String formatTimestampForDetail(Timestamp timestamp) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		String formattedDate = simpleDateFormat.format(timestamp);
		
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
