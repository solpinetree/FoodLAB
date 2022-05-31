package com.aj22.foodlab.dao.chat;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.dto.ChatDTO;

public interface ChatDAO {
	int insert(Chat chat) throws SQLException;
	void close() throws SQLException;
	
	//List<Chat> selectList() throws SQLException;
	
	
	//시간 순으로 정렬하여 메시지를 가져옴
	//현재의 모든 채팅 리시트를 불러옴
	ArrayList<Chat> getChatList(Timestamp createdAt) throws SQLException;
	Chat createFromResultSet(ResultSet rs) throws SQLException;
	
}
