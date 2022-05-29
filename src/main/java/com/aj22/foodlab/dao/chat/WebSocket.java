package com.aj22.foodlab.dao.chat;

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
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("client connect...");
		System.out.println("session id : " +session.getId());
		
		sessions.add(session);
	}
	
	
	@OnClose
	public void onClose(Session session){
		System.out.println("client is disconnected...");
		System.out.println(session.getId() + "Ŭ���̾�Ʈ�� ������ �����߽��ϴ�.");
		
		sessions.remove(session);
	}
	
	//onerror event
	@OnError
	public void onError(Throwable t){
		t.printStackTrace();
	}
	

	
	@OnMessage
	public void onMessage(String message, Session session)
	{
		//	������ �޴´�.
		System.out.println("Ŭ���̾�Ʈ�� ������ �޽��� : ");
		System.out.println(message);
		
		this.sendAll(session, message);
		
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(message);
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		
	}
	
	public void sendAll(Session session, String message)
	{
		System.out.println("sendAll : " + session.getId() + ":" +message);
		try {
			int i = 0;
			for (Session s : WebSocket.sessions) 
			{
				System.out.println(++i);
				if (!s.getId().equals(session.getId()))
				{
					s.getBasicRemote().sendText(message);
				}
			}
		}catch(Exception e) {e.printStackTrace();}
	}
	
}
