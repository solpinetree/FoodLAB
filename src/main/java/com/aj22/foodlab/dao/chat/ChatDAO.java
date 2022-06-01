package com.aj22.foodlab.dao.chat;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import com.aj22.foodlab.domain.Chat;


public interface ChatDAO {
	int insert(Chat chat) throws SQLException;
	
	
	void close() throws SQLException;
	
	//List<Chat> selectList() throws SQLException;
	
	
	//�ð� ������ �����Ͽ� �޽����� ������
	//������ ��� ä�� ����Ʈ�� �ҷ���
	List<Chat> findbyChatroomId(int chatroomid) throws SQLException;
	Chat createFromResultSet(ResultSet rs) throws SQLException;
	
}
