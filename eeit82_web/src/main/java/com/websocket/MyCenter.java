package com.websocket;

import java.io.IOException;
import java.util.HashSet;
import java.util.LinkedList;

import com.beans.WSClient;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/mycenter")
public class MyCenter {
	private static HashSet<Session> sessions = null;
	private static LinkedList<WSClient> clients = null;

	public MyCenter() {
		if (sessions == null) {
			sessions = new HashSet<Session>();
			clients = new LinkedList<WSClient>();
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("Client connected.");
		System.out.println("Client source: " + session.getRequestURI().getHost());
		
		session.setMaxIdleTimeout(60 * 60 * 1000);
		
		if (sessions.add(session)) {
			WSClient client = new WSClient();
			client.setSession(session);
			clients.add(client);
		}
	}

	@OnMessage
	public void onMessage(String message, Session from_session) {
		System.out.println("message: " + message + " : " + from_session.getBasicRemote());
		
		for (Session session : sessions) {
			try {
				session.getBasicRemote().sendText(message);
			} catch (IOException e) {
				System.out.println(e);
			}
		}
	}

	@OnError
	public void onError(Throwable throwable) {
		throwable.printStackTrace();
	}

	@OnClose
	public void onClose(Session session) {
		for (WSClient client : clients) {
			if (client.getSession().equals(session)) {
				sessions.remove(session);
				clients.remove(client);
				break;
			}
		}
	}
}
