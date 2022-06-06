package com.aj22.foodlab.dto;

import java.util.List;

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
	private List<Integer> membersIdsWhoLike;
	private Integer isDummy;
	private String dummyUsername;
	private String dummyImg;
	private String dummyCreatedAt;
	
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
		this.membersIdsWhoLike = null;
		this.isDummy = review.getIsDummy();
		this.dummyUsername = review.getDummyUsername();
		this.dummyImg = review.getDummyImg();
		this.dummyCreatedAt = review.getDummyCreatedAt();
	}
}

