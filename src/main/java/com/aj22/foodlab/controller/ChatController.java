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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.dto.ChatDTO;
import com.aj22.foodlab.service.ChatService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService chatService;
	
	
	
	@GetMapping("")
	public String home(Locale locale, Model model) {
		logger.info("chat.jsp 吏꾩엯");
		
		return "chat/chat";
	}
	
	@GetMapping("/{chatType}")
	public String chatDetail(@PathVariable String chatType) {
		//chat-openchat
		logger.info(chatType + ".jsp 吏꾩엯");
		
		return "chat/"+chatType;
	}
	
	@PostMapping("/openchat/insert")
	@ResponseBody
	public void insertChat(Chat chat) throws SQLException {
		System.out.println("insertChat_chatcontroller");
		int res = chatService.insert(chat);
		
		
		if(res != 0) {
			System.out.println("Chat_InsertError");
		}
	}
	
	
	private String html = "";
	
	@RequestMapping(value="/list", produces="application/text;charset=utf8")
	@ResponseBody
	public String getChats(@RequestParam int chatroomId) throws SQLException {
		html="";
		List<ChatDTO> chats =  chatService.findbyChatroomId(chatroomId);
		for (ChatDTO dto : chats) {
                html += 
                		"<article class = 'msg-container msg-self'>"
	                +		"<div class='msg-box'>"
	                +			"<div class = 'flr'>" 
	                +				"<div class = 'messages'>"  
	                +					"<p class = 'msg' id = 'chat'>" + dto.getContent() + "</p>"	
	                +				"</div>" 
	            	+				"<span class = 'timestamp'>"  
	            	+					"<span class = 'username'>" + dto.getWriter() + "</span>" + "&bull;" 
	            	+					"<span class = 'posttime'>" + dto.getCreatedAt() + "</span>"	
	            	+				"</span>"  
	                +			"</div>" 
	                +			"<img class = 'user-img' id = 'user-0' src = '//gravatar.com/avatar/56234674574535734573000000000001?d=retro'/>" 
	                +		"</div>"
                	+	"</article>";
            	

        }
		
		return html;
	}
	
}
