package com.tutor.dto;

import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Student;

//我的学生
public class MyStudent {

	private int id;
	
	private String name;
	
	private String mobile;
	
	private int requireid;
	
	private String course;
	
	private int appraisalstatus;
	
	private int applyid;

	public MyStudent(Student Student,Requirement requirement,Stuappraisal stuappraisal,Apply apply){
		
		this.id = Student.getId();
		
		this.name = Student.getName();
		
		this.mobile = Student.getMobile();
		
		this.requireid = requirement.getId();
		
		this.course = requirement.getCourse();
		
		this.appraisalstatus = stuappraisal.getPermission();
		
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
