package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.service.ReviewImagesService;
import com.aj22.foodlab.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewImagesService reviewImageService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws SQLException{
		logger.info("index.jsp 진입");
//		model.addAttribute("categories", restaurantService.getCategories());
		return "/index";
	}
	
	
	@RequestMapping(value = "/loadRestaurantList", produces = "application/text;charset=utf8")
	public String getReviewByCategory(Model model) throws SQLException {
		
		System.out.println("RestaurantList");
		//오늘의 서비스왕 관련 메서드
		List<RestaurantDTO> restaurantByAvgRate = restaurantService.selectListWithLimit(0, 6); // 6개만 가져옴
		

		//오늘의 서비스왕 관련 model
		model.addAttribute("restaurantByAvgRate", restaurantByAvgRate);

		return "home/restaurant-avgRate-listing";

	}
	
	
	
	
	//index.jsp 메인화면에서 category에 따른 탭 나누는 부분
	@RequestMapping(value = "/loadReviewList", produces = "application/text;charset=utf8")
	public String getReviewByCategory(@RequestParam("category") String category, Model model) throws SQLException {
		
	
		
		// 푸드로그 관련 메서드
		List<Review> reviewByRestaurantCategoryList  = reviewService.CategoryJoinByReviewRestaurantIdAndRestaurantId(category);
		List<RestaurantDTO> restaurantList = new ArrayList<>();
		List<ReviewImages> reviewImageByReviewId = new ArrayList<>();
		
		//ReviewId 에 따른 image url 과 restaurant name 을 찾는 for문
		for(Review r : reviewByRestaurantCategoryList) {
			restaurantList.add(restaurantService.selectById(r.getRestaurantId()));
			reviewImageByReviewId.add(reviewImageService.findByReviewId(r.getReviewId()).size() == 0 ? null :reviewImageService.findByReviewId(r.getReviewId()).get(0));
		}
		
		
		
		
		//푸드로그 관련 model
		model.addAttribute("reviewImageByReviewId", reviewImageByReviewId); // imageURL
		model.addAttribute("restaurantList", restaurantList); // restaurant Name
		model.addAttribute("reviewByRestaurantCategoryList", reviewByRestaurantCategoryList); // Review
		

		return "home/review-current-listing";

	}
	
}
