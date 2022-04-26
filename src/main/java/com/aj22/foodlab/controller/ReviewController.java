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
	public String res( Model model) {
		logger.info("reviews.jsp 진입");
		
		return "review/reviews";
	}
	
	@GetMapping("/write")
	public String writeReview() {
		logger.info("review-write.jsp 진입");
		
		return "review/review-write";
	}
	
}
