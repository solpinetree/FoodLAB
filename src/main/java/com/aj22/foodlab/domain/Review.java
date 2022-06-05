package com.aj22.foodlab.domain;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private Integer reviewId;
	private Integer numberInParty;
	private String content;
	private Integer priceSatisfaction;
	private Integer rate;
	private String title;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Integer writerId;
	private Integer restaurantId;
	private Integer isDummy;
	private String dummyUsername;
	private String dummyImg;
	private String dummyCreatedAt;
}
