package com.aj22.foodlab.dto;


import java.sql.Timestamp;

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
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String thumbnailOriginName;
	private String thumbnailSavedName;
	private String thumbnailSavedPath;
	private Integer writerId;
	private Integer restaurantId;
}
