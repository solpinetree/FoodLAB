package com.aj22.foodlab.dao.chat;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import com.aj22.foodlab.domain.Chat;


public interface ChatDAO {
	int insert(Chat chat) throws SQLException;
	
	
	void close() throws SQLException;
	
	//List<Chat> selectList() throws SQLException;
	
	
	//시간 순으로 정렬하여 메시지를 가져옴
	//현재의 모든 채팅 리시트를 불러옴
	List<Chat> findbyChatroomId(int chatroomid) throws SQLException;
	Chat createFromResultSet(ResultSet rs) throws SQLException;
	
}
