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

import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.dto.ReviewDTO;
import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.service.ReviewService;
import com.aj22.foodlab.util.Pagination;

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
	static final int NumOfRecordsPerPage = 10;

	// �몃��濡�洹� 寃�����
	@GetMapping("/list")
	public String loadReviewListPage(Model model, 
			@RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		
		// ��泥� 寃���湲� 媛���
		int totalRecord = reviewService.getNumOfRecord();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, totalRecord, NumOfRecordsPerPage);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("reviews", reviewService.selectList(pagination));

		return "review/reviews";
	}

	// 由щ럭����
	@GetMapping("/write")
	public String writeReview() {
		return "review/review-write";
	}

	// 由щ럭 ���� 泥�由�
	@PostMapping("/writeProcess")
	public String writeReviewProcess(Review review, MultipartFile thumbImage, String restaurantName,
			HttpServletRequest request) throws SQLException, IOException {
		// �ъ�⑹��媛� ���ν�� ���� �대��쇰�
		review.setRestaurantId(restaurantService.getRestaurantIdFromName(restaurantName));
		String returnUrl = null;
		Integer reviewId = reviewService.insert(review);

		if (reviewId == null) {
			// TODO 由щ럭 �몄���� �ㅽ�⑦�� 寃쎌�� 濡�吏�
		} else {
			returnUrl = "redirect:/reviews/review?reviewId=" + reviewId;
		}

		return returnUrl;
	}

	@GetMapping("/review")
	public String viewReviewDetailPage(@RequestParam("reviewId") int reviewId, Model model) throws SQLException {
		ReviewDTO review = reviewService.select(reviewId);

		if (review == null) {
			// TODO 由щ럭 媛��몄�ㅺ린 �ㅽ�⑦�� 寃쎌�� 濡�吏�
		} else {
			model.addAttribute("review", review);
		}

		return "review/review-detail";
	}
		

}
