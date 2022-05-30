package com.aj22.foodlab.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chatroom {
	private int chatroomId;
	private String title;
	private String imgUrl;

}
