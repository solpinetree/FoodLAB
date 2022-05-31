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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.domain.Comment;
import com.aj22.foodlab.dto.ChatDTO;
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
	
	@GetMapping("/openchat")
	//@GetMapping("/{chatType}")
	public String chatDetail(@PathVariable String chatType) {
		//chat-openchat
		logger.info(chatType + ".jsp aaaa");
		
		return "chat/"+chatType;
	}
	
	
}
