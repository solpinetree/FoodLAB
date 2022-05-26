package com.aj22.foodlab.dao.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.domain.Chat;
import com.aj22.foodlab.domain.Comment;
import com.aj22.foodlab.dto.ChatDTO;
import com.aj22.foodlab.dto.ChatroomDTO;
import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.util.ConnectionProvider;

public class ChatDAOImpl implements ChatDAO{
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	//ChatDAOImpl Connection active
	public ChatDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB close
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}
	

	// 한줄 씩 채팅값 db에 입력
	@Override
	public int insert(Chat chat) throws SQLException {
		
		int cnt = 0;
		
		String sql = "INSERT INTO chat" + 
				"(chatroom_id, member_id, content) " + 
				"VALUES(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chat.getChatroomdId());
		pstmt.setInt(2, chat.getMemberId());
		pstmt.setString(3, chat.getContent());
		
		cnt = pstmt.executeUpdate();
		
		
		return cnt;
	}
	
	//chatroomId 로 chatroomId 에 있는 전체 chat 데이터를 List
	public List<Chat> selectByChatroomId(int id) throws SQLException{
		List<Chat> chats = new ArrayList<>();
		
		String sql = "select * from chat where chatroom_id = ? order by createdAt asc";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			chats.add(createFromResultSet(rs));
		}
		
		return chats;
	}
	
	public Chat createFromResultSet(ResultSet rs) throws SQLException {
		
		Chat chat = null;
		
		Integer chatroomdId = rs.getInt("chatroom_id");
		Integer memberId = rs.getInt("member_id");
		String content = rs.getString("content");
		Timestamp createdAt = rs.getTimestamp("createdAt");
		
		chat = new Chat(chatroomdId, memberId, content, createdAt);
			
		return chat;
	}
	
	
}
