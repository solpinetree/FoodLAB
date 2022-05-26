package com.aj22.foodlab.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chat {
	private Integer chatroomdId;
	private Integer memberId;
	private String content;
	private Timestamp createdAt;
}
