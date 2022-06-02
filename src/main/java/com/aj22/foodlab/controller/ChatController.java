package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.dto.ChatDTO;
import com.aj22.foodlab.dto.ChatroomDTO;
import com.aj22.foodlab.dto.MemberDTO;
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
	@Autowired
	ChatService chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	
	
	
	
	@GetMapping("")
	public String home(Locale locale, Model model) throws SQLException {
		logger.info("chat.jsp");
		
		List<ChatroomDTO> chatrooms = chatroomService.TotalList();
		
	
			/*
		<c:if test="${empty sessionScope.sessionMember.id}">
		<jsp:forward page="${root}/logins/login"/>

	</c:if>
*/		
		model.addAttribute("chatrooms", chatrooms);
		
		return "chat/chat";
	}
	
	@GetMapping("/chatroom")
	public String chatDetail(@RequestParam("chatroomId") Integer chatroomId, Model model) throws SQLException, ParseException {
		//chat-openchat
		
		
		String chatroomTitle = chatroomService.selectByChatroomId(chatroomId);
		List<ChatDTO> chatHistory = chatService.findbyChatroomId(chatroomId);
		
		
		model.addAttribute("chatroomTitle", chatroomTitle);
		model.addAttribute("chatroomId", chatroomId);
		model.addAttribute("chatHistory", chatHistory);
		
		logger.info(chatroomTitle + ".jsp");
		return "chat/chat-divide";
	}
	
	@PostMapping("/chatroom/insert")
	public String chatInsertforDB(@RequestParam Map<String, Object> map) throws SQLException, ParseException {
		Timestamp timeStamp = new Timestamp(System.currentTimeMillis());
		System.out.println(timeStamp);
		
		Integer chatroomId = Integer.parseInt((String) map.get("chatroomId"));
		Integer memberId = Integer.parseInt((String) map.get("memberId"));
		String content = (String) map.get("chatContent");
		
		Chat chat = new Chat(chatroomId , memberId, content, null);
		
		int insertchk = chatService.insert(chat);
		
		System.out.println("insert check : " + insertchk);
		
		return null;
		
	}
	
	
	
}
