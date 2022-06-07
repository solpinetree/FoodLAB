package com.aj22.foodlab.util;

import lombok.Data;

@Data
public class ChatSession {
	private int userCount;
	
	public ChatSession() {
		this.userCount = 0;
	}
}
