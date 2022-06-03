package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.chat.ChatDAO;
import com.aj22.foodlab.dao.chat.ChatDAOImpl;
import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.dto.ChatDTO;


@Service
public class ChatService {
	
	@Autowired
	MemberService memberService;
	@Autowired
	ChatroomService chatroomService;
	
	public int insert(Chat chat) throws SQLException{
		ChatDAO dao = new ChatDAOImpl();
		int res = dao.insert(chat);
		dao.close();
		
		return res;
	}
	
	public List<ChatDTO> findbyChatroomId(int chatroomid) throws SQLException, ParseException{
		ChatDAO dao = new ChatDAOImpl();
		List<Chat> chats = dao.findbyChatroomId(chatroomid);
		dao.close();
		
		return findAllAsDTO(chats);
	}
	
	
	public List<ChatDTO> findAllAsDTO(List<Chat> ChatEntities) throws SQLException, ParseException{
		List<ChatDTO> chats = new ArrayList<>();
		
		for(Chat chat : ChatEntities) {
			chats.add(convertToDTO(chat));
		}
		
		return chats;
	}
	
	public ChatDTO convertToDTO(Chat chat) throws SQLException, ParseException {
		ChatDTO dto = new ChatDTO(chat);
		
		dto.setWriter(memberService.getusernameFromId(chat.getMemberId()));
		dto.setChatroomId(chatroomService.selectById(chat.getChatroomdId()));
		dto.setCreatedAt(chatroomService.formatTimestampForChat(chat.getCreatedAt()));
		return dto;
	}
}
