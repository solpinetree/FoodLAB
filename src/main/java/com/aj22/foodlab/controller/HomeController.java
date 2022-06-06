package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.service.ReviewImagesService;
import com.aj22.foodlab.service.ReviewService;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.dto.CommentDTO;
import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.dto.RestaurantDTO;
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
		
		
		
		model.addAttribute("categories", restaurantService.getCategories());
		
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "/index";
	}
	
	
	//index.jsp 메인화면에서 category에 따른 탭 나누는 부분
	@PostMapping("/index/reviewcategory")
	@ResponseBody
	public void getReviewByCategory(@RequestParam String category, Model model) throws SQLException {
		
		List<Review> reviewByRestaurantCategoryList  = reviewService.CategoryJoinByReviewRestaurantIdAndRestaurantId(category);
		List<String> restaurantName = new ArrayList<>();
		List<ReviewImages> reviewImageByReviewId = new ArrayList<>();
		
		//ReviewId 에 따른 image url 과 restaurant name 을 찾는 for문
		for(Review r : reviewByRestaurantCategoryList) {
			restaurantName.add(restaurantService.getRestaurantNameById(r.getRestaurantId()));
			reviewImageByReviewId = reviewImageService.findByReviewId(r.getReviewId());
		}
		
		model.addAttribute("reviewImageByReviewId", reviewImageByReviewId); // imageURL
		model.addAttribute("restaurantName", restaurantName); // restaurant Name
		model.addAttribute("reviewByRestaurantCategoryList", reviewByRestaurantCategoryList); // Review
	}
	
}
