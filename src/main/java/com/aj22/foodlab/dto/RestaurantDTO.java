package com.aj22.foodlab.dto;

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
}
