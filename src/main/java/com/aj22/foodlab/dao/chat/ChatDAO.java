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
	
	
	//�ð� ������ �����Ͽ� �޽����� ������
	//������ ��� ä�� ����Ʈ�� �ҷ���
	ArrayList<Chat> getChatList(Timestamp createdAt) throws SQLException;
	Chat createFromResultSet(ResultSet rs) throws SQLException;
	
}
