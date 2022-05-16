package com.aj22.foodlab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class RestaurantDTO {
	private int restaurantId;
	private String name;
	private String address;
	private float avgRate;
	private String tel;
	private String category;
	private String imgUrl;
	private String operationHour;
}
