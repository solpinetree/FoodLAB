package com.aj22.foodlab.service;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dao.review.ReviewDAO;
import com.aj22.foodlab.dao.review.ReviewDAOImpl;
import com.aj22.foodlab.domain.Restaurant;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.dto.ReviewDTO;
import com.aj22.foodlab.util.FileUpload;
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
	
	public Pagination getPaginationBySearchKeywordContent(int currentPage, String keyword, String option) throws SQLException{
		
		
		
		int res_id = restaurantService.getRestaurantIdFromName(keyword);
		int member_id = memberService.getMemberIdFromName(keyword);					
		
		int numOfRecords = getNumOfRecordByNameContent(keyword, option,res_id,member_id);
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		return pagination;
		
		
	}
	
	public int getNumOfRecordByName(String keyword, String option) throws SQLException{
		
		int res_id = restaurantService.getRestaurantIdFromName(keyword);
		int member_id = memberService.getMemberIdFromName(keyword);	
		int numOfRecords = getNumOfRecordByNameContent(keyword, option,res_id,member_id);
		
		return numOfRecords;
	}
	

	
	public ReviewDTO convertToDto(Review review) throws SQLException{
		ReviewDTO dto = new ReviewDTO(review);
		return dto;
	}
	
	
	public int countRecordsByRestaurantId(int restaurantId) throws SQLException{
		int cnt = 0;
		
		ReviewDAO dao = new ReviewDAOImpl();
		cnt = dao.countRecordsByRestaurantId(restaurantId);
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
	
	
	public List<ReviewDTO> selectList(Pagination pagination,String search,String option) throws SQLException{
		List<Review> reviews = null;
		List<ReviewDTO> reviewDTOs = new ArrayList<>();
		
		ReviewDAO dao = new ReviewDAOImpl();
		reviews = dao.selectList(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage(), search, option);
		dao.close();
		
		for(Review review : reviews) {
			ReviewDTO dto = new ReviewDTO(review);
			dto = setReviewWriterAndRestaurantAndLikesAndTimes(dto, review, "listPage");
			reviewDTOs.add(dto);
		}
			
		return reviewDTOs;
	}
	
	public List<ReviewDTO> findByRestaurantId(int restaurantId) throws SQLException{
		List<Review> reviews = null;
		List<ReviewDTO> reviewDTOs = new ArrayList<>();
		
		ReviewDAO dao = new ReviewDAOImpl();
		reviews = dao.selectByRestaurantId(restaurantId);
		dao.close();
		
		for(Review review : reviews) {
			ReviewDTO dto = new ReviewDTO(review);
			dto = setReviewWriterAndRestaurantAndLikesAndTimes(dto, review, "detailPage");
			reviewDTOs.add(dto);
		}
		
		return reviewDTOs;
	}
	
	public List<ReviewDTO> findContentBySearchWithLimit(Pagination pagination, String name) throws SQLException{
		List<Review> reviews = null;
		List<ReviewDTO> dto = new ArrayList<>();
		
		ReviewDAO dao = new ReviewDAOImpl();
		reviews = dao.findContentBySearchWithLimit(pagination.getFirstReviewId(), pagination.getNumOfRecordsPerPage(), name);
		dao.close();
		
		for(Review review : reviews) {
			dto.add(convertToDto(review));
		}
		
		return dto;
	}
	
	public Integer save(Review review, String restaurantName) throws SQLException {
		review.setRestaurantId(restaurantService.getRestaurantIdFromName(restaurantName));
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
	
	public float reviewAvgRateSelectByRestaurantId(int id) throws SQLException{
		float avg_rate = 0;
		
		ReviewDAO dao = new ReviewDAOImpl();
		avg_rate = dao.reviewAvgRateSelectByRestaurantId(id);
		dao.close();
		
		return avg_rate;
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
	
	public int getNumOfRecordByNameContent(String name, String option, int restaruant_id, int member_id) throws SQLException {
		

		int cnt = 0;
		
		ReviewDAO dao = new ReviewDAOImpl();
		cnt = dao.countRecords(name,member_id,restaruant_id, option);
		dao.close();
		
		return cnt;

		

	}
	
}
