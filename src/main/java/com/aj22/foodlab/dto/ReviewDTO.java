package com.aj22.foodlab.dto;

import java.util.List;

import com.aj22.foodlab.domain.Review;

import com.aj22.foodlab.domain.ReviewImages;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDTO {
	private Integer reviewId;
	private String content;
	private Integer rate;
	private String createdAt;
	private String updatedAt;
	private MemberDTO writer;
	private RestaurantDTO restaurant;
	private List<Integer> membersIdsWhoLike;

	private ReviewImages thumbnail;
	public ReviewDTO(Review review) {
		this.reviewId = review.getReviewId();
		this.content = review.getContent();
		this.rate = review.getRate();
		this.createdAt = null;
		this.updatedAt = null;
		this.writer = null;
		this.restaurant = null;
		this.membersIdsWhoLike = null;
		this.thumbnail = null;
	}
}

