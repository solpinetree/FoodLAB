package com.aj22.foodlab.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aj22.foodlab.domain.Likes;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.dto.ReviewDTO;
import com.aj22.foodlab.service.LikesService;
import com.aj22.foodlab.service.ReviewImagesService;
import com.aj22.foodlab.service.ReviewService;
import com.aj22.foodlab.util.Pagination;
//import com.aj22.foodlab.util.S3FileUploadService;


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
	private LikesService likesService;
	@Autowired
	private ReviewImagesService reviewImagesService;
//	@Autowired
//	private S3FileUploadService s3Service;

	// 푸드로그 게시판
	@GetMapping("/list")
	public String loadReviewListPage(Model model, 
			@RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		Pagination pagination = reviewService.getPagination(currentPage);
		model.addAttribute("pagination", pagination);
		model.addAttribute("reviews", reviewService.selectList(pagination));
		return "review/reviews";
	}
	
	//search
	@RequestMapping(value = "/loadListBySearchKeyword", produces = "application/text;charset=utf8")
	public String loadRestaurantListDivSelectedBySearch(Model model,
			@RequestParam(required = false, defaultValue = "1") int currentPage, @RequestParam("search") String search, @RequestParam("option") String option)
			throws SQLException {		
			Pagination pagination = reviewService.getPaginationBySearchKeywordContent(currentPage, search, option);
			model.addAttribute("pagination", pagination);
			model.addAttribute("reviews", reviewService.selectList(pagination, search, option));
			model.addAttribute("search", search);
			model.addAttribute("option", option);
			model.addAttribute("numOfResults", reviewService.getNumOfRecordByName(search, option));
		
		return "review/reviews";
	}

	// 리뷰작성
	@GetMapping("/write")
	public String writeReview() {
		return "review/review-write";
	}

	// 리뷰 작성 처리
	@PostMapping("/writeProcess")
	public String writeReviewProcess(Review review, MultipartHttpServletRequest multipartRequest, String restaurantName,
			HttpServletRequest request) throws SQLException, IOException {
		
		String loadUrl = null;
		review = reviewService.save(review, restaurantName);
		
		reviewImagesService.saveReviewImages(multipartRequest, review);

		if (review.getReviewId() == null) {
			// TODO 리뷰 인서트 실패한 경우 로직
		} else {
			loadUrl = "redirect:/reviews/list";
		}

		return loadUrl;
	}
	
	@GetMapping("/review")
	public String viewReviewDetailPage(@RequestParam("reviewId") int reviewId, Model model, HttpServletRequest request) throws SQLException {
		ReviewDTO review = reviewService.select(reviewId);
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("sessionMember");
		
		// 리뷰를 삭제할 경우를 대비해서 전의 페이지 url 을 저장한다.
		if(member!=null){
			if(member.equals(review.getWriter())) {
				String referer = (String)request.getHeader("REFERER");
				session.setAttribute("urlHistory", referer);
			}
			model.addAttribute("heartImgUrl", likesService.getHeartImgUrl(new Likes(member.getId(), reviewId)));
		}

		model.addAttribute("review", review);
		model.addAttribute("reviewImages", reviewImagesService.findByReviewId(reviewId));

		return "review/review-detail";
	}
	
	@GetMapping("/delete")
	public String deleteReview(@RequestParam("reviewId") int reviewId, Model model, HttpServletRequest request) throws SQLException {
		
		String redirectUrl = null;
		
		if(reviewService.deleteReviewById(reviewId)==1) { // 삭제 성공한 경우 
			redirectUrl = (String) request.getSession().getAttribute("urlHistory");
			request.getSession().removeAttribute("urlHistory");
		}else {	//TODO: 삭제 실패한 경우 로직 구현
			
		}
		
		return "redirect:"+redirectUrl;
	}
}
