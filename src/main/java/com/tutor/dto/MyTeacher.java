package com.tutor.dto;

import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;
import com.tutor.entity.Teaappraisal;
import com.tutor.entity.Teacher;

//我的老师类
public class MyTeacher {

	private int id;
	
	private String name;
	
	private String mobile;
	
	private int requireid;
	
	private String course;
	
	private int appraisalstatus;
	
	private int applyid;

	public MyTeacher(Teacher teacher,Requirement requirement,Teaappraisal teaappraisal,Apply apply){
		
		this.id = teacher.getId();
		
		this.name = teacher.getName();
		
		this.mobile = teacher.getMobile();
		
		this.requireid = requirement.getId();
		
		this.course = requirement.getCourse();
		
		this.appraisalstatus = teaappraisal.getPermission();
		
		this.applyid = apply.getId();
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getMobile() {
		return mobile;
	}

	public int getRequireid() {
		return requireid;
	}

	public String getCourse() {
		return course;
	}

	public int getAppraisalstatus() {
		return appraisalstatus;
	}

	public int getApplyid() {
		return applyid;
	}
	
	

}
