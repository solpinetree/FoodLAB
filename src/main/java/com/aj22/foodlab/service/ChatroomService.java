package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.chat.ChatroomDAO;
import com.aj22.foodlab.dao.chat.ChatroomDAOImpl;

import com.aj22.foodlab.domain.Chatroom;

import com.aj22.foodlab.dto.ChatroomDTO;


@Service
public class ChatroomService {

	public List<ChatroomDTO> TotalList() throws SQLException{
		ChatroomDAO dao = new ChatroomDAOImpl();
		List<Chatroom> chatrooms = dao.TotalList();
		dao.close();
		
		return findAllAsDTO(chatrooms);
		
	}
	
	public List<ChatroomDTO> findAllAsDTO(List<Chatroom> chatroomEntities) throws SQLException{
		List<ChatroomDTO> chatrooms = new ArrayList<>();
		
		for(Chatroom chatroom : chatroomEntities) {
			chatrooms.add(convertToDTO(chatroom));
		}
		return chatrooms;
	}
	
	public ChatroomDTO convertToDTO(Chatroom chatroom) throws SQLException {
		ChatroomDTO dto = new ChatroomDTO(chatroom);
		
		return dto;
	}
	
}
