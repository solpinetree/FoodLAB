package com.aj22.foodlab.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RestaurantMenu {
	String restaurantName;
	String menuName;
	String price;
	Integer restaurantId;
}
