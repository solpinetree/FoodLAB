package com.aj22.foodlab.dao.chat;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.Chatroom;

public interface ChatroomDAO {
	
	void close() throws SQLException;
	List<Chatroom> TotalList() throws SQLException;
	
	//Chatroom id �� ���� Title ��
	String selectByChatroomId(int chatroomid) throws SQLException;
	
	//Chatroom id �� ���� ��� ������
	Chatroom selectById(int chatroomid) throws SQLException;
	
	Chatroom createFromResultSet(ResultSet rs) throws SQLException;
	
	
}