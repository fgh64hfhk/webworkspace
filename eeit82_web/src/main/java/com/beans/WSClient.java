package com.beans;

import jakarta.websocket.Session;

public class WSClient {
	private Session session;
	private String[] chat_message;
	
	public WSClient() {
		chat_message = new String[100];
	}
	
	public String[] getChat_message() {
		return chat_message;
	}

	public void setChat_message(String[] chat_message) {
		this.chat_message = chat_message;
	}

	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
