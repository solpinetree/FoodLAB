package com.aj22.foodlab.dto;

import com.aj22.foodlab.domain.Restaurant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RestaurantDTO {
	private Integer restaurantId;
	private String name;
	private String address;
	private Float avgRate;
	private String tel;
	private String category;
	private String imgUrl;
	private String operationHour;
	private Integer numOfReviews;
	
	public RestaurantDTO(Restaurant restaurant) {
		restaurantId = restaurant.getRestaurantId();
		name = restaurant.getName();
		address = restaurant.getAddress();
		avgRate = restaurant.getAvgRate();
		tel = restaurant.getTel();
		category = restaurant.getCategory();
		imgUrl = restaurant.getImgUrl();
		operationHour = restaurant.getOperationHour();
		numOfReviews = null;
	}
}
