package com.aj22.foodlab.dto;

import java.sql.Timestamp;

import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.domain.Comment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class ChatDTO {
	private ChatroomDTO chatroomId; // chatroom Id
	private MemberDTO writer; // Member id
	private String content; // 채팅내용
	private Timestamp createdAt;
	
	
	
	public ChatDTO(Chat chat) {
		this.chatroomId = null;
		this.writer = null;
		this.content = chat.getContent();
		this.createdAt = null;
	}
	
	public String TimestampToString(Timestamp createdAt) {
		String createdAtStr = createdAt.toString();
		
		return createdAtStr;
	}
}
