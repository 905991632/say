package com.tutor.dto;

import com.tutor.entity.Teacher;
import com.tutor.entity.TutorLive;

public class Live {

	private String photo;
	private int roomid;
	private int teacherid;
	public String getPhoto() {
		return photo;
	}
	public int getRoomid() {
		return roomid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public Live(Teacher teacher,TutorLive tutorLive){
		this.photo = teacher.getPhoto();
		this.roomid = tutorLive.getId();
		this.teacherid = tutorLive.getTeacherid();
	}
	
}
