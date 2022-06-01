package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aj22.foodlab.dto.ChatroomDTO;
import com.aj22.foodlab.service.ChatService;
import com.aj22.foodlab.service.ChatroomService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatroomService chatroomService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService chatService;
	
	
	
	@GetMapping("")
	public String home(Locale locale, Model model) throws SQLException {
		logger.info("chat.jsp");
		
		List<ChatroomDTO> chatrooms = chatroomService.TotalList();
		
		
		
		model.addAttribute("chatrooms", chatrooms);
		
		return "chat/chat";
	}
	
	@GetMapping("/chatroom")
	public String chatDetail(@RequestParam("chatroomId") Integer chatroomId, Model model) throws SQLException {
		//chat-openchat
		
		
		String chatroomTitle = chatroomService.selectByChatroomId(chatroomId);
		
		model.addAttribute("chatroomTitle", chatroomTitle);
		model.addAttribute("chatroomId", chatroomId);
		
		logger.info(chatroomTitle + ".jsp");
		return "chat/chat-divide";
	}
	
	
}
