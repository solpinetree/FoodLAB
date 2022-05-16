package com.aj22.foodlab.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDTO {
	private int reviewId;
	private int numberInParty;
	private String content;
	private int priceSatisfaction;
	private int rate;
	private String title;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String thumbnailOriginName;
	private String thumbnailSavedName;
	private String thumbnailSavedPath;
	private int writerId;
	private int restaurantId;
}
