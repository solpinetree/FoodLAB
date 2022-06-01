package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	
	public String selectByChatroomId(int chatroomid) throws SQLException{
		String chatroomTitle = null;
		ChatroomDAO dao = new ChatroomDAOImpl();
		chatroomTitle = dao.selectByChatroomId(chatroomid);
		dao.close();
		
		return chatroomTitle;
		
	}
	
	public ChatroomDTO selectById(int chatroomid) throws SQLException{
		Chatroom chatroom = null;
		ChatroomDAO dao = new ChatroomDAOImpl();
		chatroom = dao.selectById(chatroomid);
		dao.close();
		
		return convertToDTO(chatroom);
	}
	
	public String formatTimestampForChat(Timestamp timestamp) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
		String chatTimeLog = null; // chat log time

		if(timestamp!= null) {
			chatTimeLog = dateFormat.format(timestamp);
			
		}
		return chatTimeLog;
		
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
