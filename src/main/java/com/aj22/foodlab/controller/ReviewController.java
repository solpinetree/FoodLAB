package com.aj22.foodlab.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aj22.foodlab.common.FileUpload;
import com.aj22.foodlab.dto.FileDTO;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.dto.ReviewDTO;
import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/reviews")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private RestaurantService restaurantService;
	
	// 푸드로그로 연결
	@GetMapping("/list")
	public String loadReviewListPage(Model model) throws SQLException {
		model.addAttribute("reviews", reviewService.selectList());
		return "review/reviews";
	}
	
	// 리뷰작성
	@GetMapping("/write")
	public String writeReview() {
		return "review/review-write";
	}
	
	// 리뷰 작성 처리
	@PostMapping("/writeProcess")
	public String writeReviewProcess(ReviewDTO review, MultipartFile thumbImage, String restaurantName, HttpServletRequest request) throws SQLException, IOException {
		// 사용자가 입력한 식당 이름으로 
		review.setRestaurantId(restaurantService.getRestaurantIdFromName(restaurantName));
		String returnUrl = null;
		FileDTO filedto =(new FileUpload()).uploadFileToDirectoryUnderUploadPath(thumbImage, "review-thumb");
	
		review.setThumbnailOriginName(filedto.getOriginName());
		review.setThumbnailSavedName(filedto.getSavedName());
		review.setThumbnailSavedPath(filedto.getSavedPath());
		
		Integer reviewId = reviewService.insert(review);
		
		if(reviewId == null) {
			// 리뷰 인서트 실패한 경우 로직	
		}else {
			returnUrl = "redirect:/reviews/review?reviewId="+reviewId;
		}
		
		return returnUrl;
	}
	
	// 하나의 리뷰 디테일 페이지
	@GetMapping("/review")
	public String viewReviewDetailPage(@RequestParam("reviewId") int reviewId, Model model) throws SQLException {
		ReviewDTO review = reviewService.select(reviewId);
		RestaurantDTO restaurant = null;
		
		if(review.getRestaurantId()!=null) {
			restaurant = restaurantService.getRestaurantById(review.getRestaurantId()); 
		}else { // 리뷰가 참조하고 있는 레스토랑이 restaurant table에 없는 경우
			
		}
		
		if(review==null) {
			// 리뷰 가져오기 실패한 경우
		}else {
			model.addAttribute("review", review);
			if(restaurant!=null) {
				model.addAttribute("restaurant", restaurant);
			}
		}
		return "review/review-detail";
	}
	
}
