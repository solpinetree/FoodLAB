package com.aj22.foodlab.dao.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.aj22.foodlab.domain.Chatroom;
import com.aj22.foodlab.util.ConnectionProvider;

public class ChatroomDAOImpl implements ChatroomDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public ChatroomDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}
	
	@Override
	public List<Chatroom> TotalList() throws SQLException{
		List<Chatroom> chatrooms = new ArrayList<>();
		
		String sql = "select * from chatroom";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			chatrooms.add(createFromResultSet(rs));
		}
		
		return chatrooms;
	}
	
	//chatroomid - return chatroomTitle
	@Override
	public String selectByChatroomId(int chatroomid) throws SQLException {
		String chatroomTitle = null;
		
		String sql = "select title from chatroom where chatroom_id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatroomid);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			chatroomTitle = rs.getString("title");
		}
		
		return chatroomTitle;
	}
	
	public Chatroom createFromResultSet(ResultSet rs) throws SQLException {
		
		Chatroom chatroom = null;
		
		Integer chatroomId = rs.getInt("chatroom_id");
		System.out.println(chatroomId);
		String chatroomTitle= rs.getString("title");
		String imgUrl = rs.getString("img_url");
		chatroom = new Chatroom(chatroomId, chatroomTitle, imgUrl);
			
		return chatroom;
	}
	
}
