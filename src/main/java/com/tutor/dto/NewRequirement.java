package com.tutor.dto;

import com.tutor.entity.Requirement;
import com.tutor.entity.Student;

public class NewRequirement {

	int id;

	String course;

	String sex;

	String area;

	String photo;

	public NewRequirement(Student student, Requirement requirement) {
		this.id = requirement.getId();
		this.course = requirement.getCourse();
		this.sex = requirement.getSex();
		this.area = requirement.getArea();
		this.photo = student.getPhoto();
	}

	public int getId() {
		return id;
	}

	public String getCourse() {
		return course;
	}

	public String getSex() {
		return sex;
	}

	public String getArea() {
		return area;
	}

	public String getPhoto() {
		return photo;
	}

}
