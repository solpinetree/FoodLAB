package com.aj22.foodlab.dao.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import com.aj22.foodlab.service.ChatService;
import com.aj22.foodlab.domain.Chat;

@ServerEndpoint("/wsocket")
public class WebSocket {
	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
	
	@Autowired
	ChatService chatService;
	
	/*
	 *  websocket으로 브라우저가 접속하면 요청
	 */
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("client connect...");
		System.out.println("session id : " +session.getId());
		
		// WebSocket세션을 리스트에 저장
		sessions.add(session);
	}
	
	
	// websocket과 브라우저가 접속이 끊기면 요청
	@OnClose
	public void onClose(Session session){
		System.out.println("client is disconnected...");
		System.out.println(session.getId() + "클라이언트가 연결을 해제했습니다.");
		
		//	세션을 닫는다.
		sessions.remove(session);
	}
	
	//onerror event
	@OnError
	public void onError(Throwable t){
		t.printStackTrace();
	}
	

	
	//webSocket 으로 메시지가 오면 요청
	@OnMessage
	public void onMessage(String message, Session session) throws IOException
	{
		//	서버가 받는다.
		System.out.println("클라이언트가 보내온 메시지 : " + message);
		
		this.sendAll(session, message);
		
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(message);
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		
	}
	
	public void sendAll(Session session, String message) throws IOException
	{
		String[] messageSplit = message.split(":");
		String msgId = messageSplit[0];
		String msgContent = messageSplit[1];
		System.out.println("msgId : " + msgId);
		System.out.println("msgContent : " + msgContent);
		String recieverMessage = "server:" + message; 
		synchronized (sessions) {
			int i = 0;
			//	웹 소켓에 연결되어 있는 모든 아이디를 찾는다.	
			for (Session s : WebSocket.sessions) 
			{
			
				System.out.println("s.getId " + s.getId());

				System.out.println("session.getId " + session.getId());
				if (!s.getId().equals(session.getId()))
				{
					
					s.getBasicRemote().sendText(recieverMessage);
				}
			}
		}
		
	}

}
