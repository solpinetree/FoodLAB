package com.aj22.foodlab.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Likes {
	private int memberId;
	private int reviewId;
}
