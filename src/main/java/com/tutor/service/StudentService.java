package com.tutor.service;

import java.util.List;

import com.tutor.dto.MyTeacher;
import com.tutor.entity.Apply;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Student;


public interface StudentService {
	
	int addStudent(Student student);
	
	Student selectByPrimaryKey(int id);
	
	List<Student> getStudentByForeignKey(int foreignkey);
	
	List<Student> getStudentByCondition(Student student);
	
	int updateByPrimaryKeySelective(Student student);
	
	int alterPasswordById(int userId,String oldPassword,String newPassword);
	
	List<MyTeacher> getMyTeachersByApply(Apply apply);
	
	
}
