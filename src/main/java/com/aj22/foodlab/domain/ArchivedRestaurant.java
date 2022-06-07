package com.aj22.foodlab.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ArchivedRestaurant {

	private int memberId;
	private int restaurantId;
}
