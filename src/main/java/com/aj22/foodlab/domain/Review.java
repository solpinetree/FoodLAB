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
	private String content;
	private Integer rate;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Integer writerId;
	private Integer restaurantId;
}
