package com.aj22.foodlab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/reviews")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	
	@GetMapping("/list")
	public String loadReviewListPage( Model model) {
		return "review/reviews";
	}
	
	// 리뷰작성
	@GetMapping("/write")
	public String writeReview() {
		return "review/review-write";
	}
	

	
}
