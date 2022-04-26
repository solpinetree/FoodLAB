package com.aj22.foodlab.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@GetMapping("")
	public String home(Locale locale, Model model) {
		logger.info("chat.jsp 진입");
		
		return "chat/chat";
	}
	
	@GetMapping("/{chatType}")
	public String chatDetail(@PathVariable String chatType) {
		// 일반채팅 : chat/openchat
		logger.info(chatType + ".jsp 진입");
		
		return "chat/"+chatType;
	}
	
}
