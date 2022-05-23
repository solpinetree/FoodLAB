package com.aj22.foodlab.dto;

import java.sql.Timestamp;

import com.aj22.foodlab.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDTO {
	private Integer reviewId;
	private Integer numberInParty;
	private String content;
	private Integer priceSatisfaction;
	private Integer rate;
	private String title;
	private String createdAt;
	private String updatedAt;
	private MemberDTO writer;
	private RestaurantDTO restaurant;
	private Integer likesCount;
	
	public ReviewDTO(Review review) {
		this.reviewId = review.getReviewId();
		this.numberInParty = review.getNumberInParty();
		this.content = review.getContent();
		this.priceSatisfaction = review.getPriceSatisfaction();
		this.rate = review.getRate();
		this.title = review.getTitle();
		this.createdAt = null;
		this.updatedAt = null;
		this.writer = null;
		this.restaurant = null;
		this.likesCount = null;
	}
}

