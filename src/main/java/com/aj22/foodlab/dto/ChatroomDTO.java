package com.aj22.foodlab.dto;

import com.aj22.foodlab.domain.Chatroom;

import lombok.Data;

@Data
public class ChatroomDTO {
	private Integer chatroomId;
	private String title;
	private String imgUrl;
	
	
	public ChatroomDTO(Chatroom chatroom){
		this.chatroomId = chatroom.getChatroomId();
		this.title = chatroom.getTitle();
		this.imgUrl = chatroom.getImgUrl();
	}
	
}
