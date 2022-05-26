package com.aj22.foodlab.dto;

import com.aj22.foodlab.domain.Chatroom;

public class ChatroomDTO {
	private Integer chatroomId;
	private String title;
	
	public ChatroomDTO(Chatroom chatroom){
		this.chatroomId = chatroom.getChatroomId();
		this.title = chatroom.getTitle();
	}
}
