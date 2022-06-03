package com.aj22.foodlab.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chatroom {
	private Integer chatroomId;
	private String title;
	private String imgUrl;

}
