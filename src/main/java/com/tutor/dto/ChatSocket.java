package com.tutor.dto;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.alibaba.fastjson.JSON;

@ServerEndpoint("/chatSocket/{roomid}/{type}/{username}")
public class ChatSocket {
	private static Map<String,HashMap<Session, String>> map=new HashMap<String,HashMap<Session, String>>();
	private static Map<Session, String> queryMap  = new HashMap<Session, String>();
	
	@OnOpen
	public void open(@PathParam("roomid") String roomid,@PathParam("username") String username,@PathParam("type") String type,Session session)throws Exception{
		if(type.equals("teacher")){
			username = "老师"+username;
		}else {
			username = "学生"+username;
		}
		if(queryMap.containsKey(session)){
			HashMap<Session, String> hashMap = map.get(roomid);
			hashMap.put(session, username);
		}else {
			queryMap.put(session, roomid);
			HashMap<Session, String> hashMap = new HashMap<Session, String>();
			hashMap.put(session, username);
			map.put(roomid, hashMap);
		}
		String msg="欢迎"+username+"来到本直播间<br>";
		broadcast(session,msg);
	}

	@OnMessage
	public void message(Session session,String msg){
		String roomid = queryMap.get(session);
		HashMap<Session, String> hashMap = map.get(roomid);
		String username = hashMap.get(session);
		String newmsg=username+":"+msg+"<br>";
		broadcast(session,newmsg);
	}
	@OnClose
	public void close(Session session){
		String roomid = queryMap.get(session);
		HashMap<Session, String> hashMap = map.get(roomid);
		String username = hashMap.get(session);
		hashMap.remove(session);
		String msg=username+"已离开直播间<br>";
		broadcast(session,msg);
	}
	
	
	public void broadcast(Session session,String msg){
		String roomid = queryMap.get(session);
		HashMap<Session, String> hashMap = map.get(roomid);
		ChatJson json =new ChatJson();
		json.setRoomid(Integer.parseInt(roomid));
		json.setAccount(hashMap.size());
		json.setMessage(msg);
		String message = JSON.toJSONString(json);
		for(Session session1:hashMap.keySet()){
			try {
				session1.getBasicRemote().sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	
	}


	
	/*
	private static Map<Session,String> map=new HashMap<Session,String>();
	
	private static HttpSession httpsession;
	
	@OnOpen
	public void open(@PathParam("roomid") String roomid,Session session)throws Exception{
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
	
*/
	
	
}
