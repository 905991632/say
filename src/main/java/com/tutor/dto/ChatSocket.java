package com.tutor.dto;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatSocket")
public class ChatSocket {
	private static Map<Session,String> map=new HashMap<Session,String>();
	
	private static HttpSession httpsession;
	
	@OnOpen
	public void open(Session session)throws Exception{
		String username = (String)httpsession.getAttribute("USER_TYPE")+(int)httpsession.getAttribute("USER_ID");
		map.put(session, username);
		String msg="欢迎"+username+"来到本直播间<br>";
		broadcast(map,msg);
		
	}

	@OnMessage
	public void message(Session session,String msg){
		String username = map.get(session);
		String newmsg=username+":"+msg+"<br>";
		broadcast(map,newmsg);
	}
	@OnClose
	public void close(Session session){
		String username = map.get(session);
		map.remove(session);
		String msg=username+"已离开直播间<br>";
		broadcast(map,msg);
	}
	
	
	public void broadcast(Map<Session,String> mp,String msg){
		for(Session session:mp.keySet()){
			try {
				session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	
	}

	public static void setHttpsession(HttpSession httpsession) {
		ChatSocket.httpsession = httpsession;
	}


	
	
	
	
	
	/*
	private static List<Session> sessions=new ArrayList<Session>();
	@OnOpen
	public void open(Session session){
		this.sessions.add(session);
		
	}

	@OnMessage
	public void message(String msg){
		this.broadcast(sessions, msg);
	}
	
	public void broadcast(List<Session> ss,String msg){
		for(Iterator iterator=ss.iterator();iterator.hasNext();){
			Session session=(Session)iterator.next();
			try {
				session.getBasicRemote().sendText(msg+"<br>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	*/
	
	
}
