package com.aj22.foodlab.controller;

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

import com.aj22.foodlab.dto.ReviewDTO;
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
	public String writeReviewProcess(ReviewDTO review, MultipartFile thumbImage, HttpServletRequest request) {
		
		return null;
	}
	
}
