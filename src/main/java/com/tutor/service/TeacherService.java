package com.tutor.service;

import java.util.List;

import com.tutor.dto.Pager;
import com.tutor.entity.Teacher;

public interface TeacherService {

	int addTeacher(Teacher teacher);
	
	Teacher selectByPrimaryKey(int id);
	
	List<Teacher> getTeacherByForeignKey(int foreignkey);
	
	int updateByPrimaryKeySelective(Teacher teacher);
	
	List<Teacher> getTeachersByCondition(Teacher teacher);
	
	Pager<Teacher> getTeachers(List<Teacher> list,int pageNum,int pageSize);
	
	int alterPasswordById(int id,String oldPassword,String newPassword);
	
}
