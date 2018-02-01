package com.tutor.service;

import java.util.List;
import com.tutor.dto.MyStudent;
import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;
import com.tutor.entity.Student;


public interface StudentService {
	
	int addStudent(Student student);
	
	Student selectByPrimaryKey(int id);
	
	List<Student> getStudentByForeignKey(int foreignkey);
	
	List<Student> getStudentByCondition(Student student);
	
	int updateByPrimaryKeySelective(Student student);
	
	int alterPasswordById(int userId,String oldPassword,String newPassword);
	
	List<Student> getStudentsByApply(List<Apply> applies);
	
	List<MyStudent> getMyStudentsByApply(Apply apply);
	
	List<Student> getStudentsByRequirements(List<Requirement> list);
	
}
