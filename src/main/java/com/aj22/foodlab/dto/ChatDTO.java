package com.aj22.foodlab.dto;



import com.aj22.foodlab.domain.Chat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class ChatDTO {
	private ChatroomDTO chatroomId; // chatroom Id
	private String writer; // Member id
	private String content; 
	private String createdAt;
	
	
	
	public ChatDTO(Chat chat) {
		this.chatroomId = null;
		this.writer = null;
		this.content = chat.getContent();
		this.createdAt = null;
	}
	
	
}
