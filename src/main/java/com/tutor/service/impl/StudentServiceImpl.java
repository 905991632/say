package com.tutor.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.LoginMapper;
import com.tutor.dao.StudentMapper;
import com.tutor.dto.MyStudent;
import com.tutor.entity.Apply;
import com.tutor.entity.Login;
import com.tutor.entity.Requirement;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Student;
import com.tutor.entity.StudentExample;
import com.tutor.entity.StudentExample.Criteria;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.StuAppraisalService;
import com.tutor.service.StudentService;
import com.tutor.service.TeaAppraisalService;
import com.tutor.service.TeacherService;

/*
 * 学生个人信息模块
 */
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;
	@Autowired
	LoginMapper loginMapper;
	@Autowired
	ApplyService applyService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	TeaAppraisalService teaAppraisalService;
	@Autowired
	RequirementService requirementService;
	@Autowired
	StuAppraisalService stuAppraisalService;
	
	
	/*
	 *	添加学生
	 * 	return 成功返回1
	 */
	@Override
	public int addStudent(Student student) {
		return studentMapper.insertSelective(student);
	}

	/*
	 * 	通过主键id查找学生
	 * 	return 学生实体类
	 */
	@Override
	public Student selectByPrimaryKey(int id) {
		return studentMapper.selectByPrimaryKey(id);
	}

	/*
	 * 	通过外键查询学生
	 * 	return 学生列表  （虽然返回列表，实际数据最多一条，一个用户对应一个学生信息或教师信息）
	 */
	@Override
	public List<Student> getStudentByForeignKey(int foreignkey) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginidEqualTo(foreignkey);
		return studentMapper.selectByExample(example);
	}

	/*
	 * 	根据主键，student属性值不为null就更新
	 * 	return 成功返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Student student) {
		return studentMapper.updateByPrimaryKeySelective(student);
	}

	/*
	 * 	通过查询与学生属性值不为空的部分相同的学生（类似模糊查询）
	 * 	return 学生列表
	 */
	@Override
	public List<Student> getStudentByCondition(Student student) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		if(student.getId()!=null){
			criteria.andIdEqualTo(student.getId());
		}
		if (student.getName()!=null) {
			criteria.andNameEqualTo(student.getName());
		}
		if (student.getSex()!=null) {
			criteria.andSexEqualTo(student.getSex());
		}
		if(student.getAge()!=null){
			criteria.andAgeEqualTo(student.getAge());
		}
		if(student.getMobile()!=null){
			criteria.andMobileEqualTo(student.getMobile());
		}
		if (student.getAddress()!=null) {
			criteria.andAddressEqualTo(student.getAddress());
		}
		if (student.getArea()!=null) {
			criteria.andAreaEqualTo(student.getArea());
		}
		if(student.getLoginid()!=null){
			criteria.andLoginidEqualTo(student.getLoginid());
		}
		example.setOrderByClause("loginTime desc");
		List<Student> students = studentMapper.selectByExample(example);
		return students;
	}

	//修改密码
	@Override
	public int alterPasswordById(int userId, String oldPassword, String newPassword) {
		Login login = loginMapper.selectByPrimaryKey(studentMapper.selectByPrimaryKey(userId).getLoginid());
		if(!login.getPassword().equals(oldPassword)){
			return 2;
		}
		login.setPassword(newPassword);
		loginMapper.updateByPrimaryKey(login);
		return 1;
	}

	@Override
	public List<Student> getStudentsByApply(List<Apply> applies) {
		List<Student> list = new ArrayList<Student>();
		for(int i=0;i<applies.size();i++){
			list.add(this.selectByPrimaryKey(applies.get(i).getStudentid()));
		}
		return list;
	}

	//通过apply获取我的学生
	@Override
	public List<MyStudent> getMyStudentsByApply(Apply apply) {
		List<Apply> list = applyService.getAppliesByCondition(apply);
		List<Requirement> requirementList = requirementService.getRequirementByApply(list);
		List<Student> studentList = this.getStudentsByApply(list);
		List<Stuappraisal> stuappraisalList = stuAppraisalService.getStuappraisalByApply(list);
		List<MyStudent> myStudents = new ArrayList<MyStudent>();
		for(int i = 0;i<studentList.size();i++){
			MyStudent mStudent = new MyStudent(studentList.get(i), requirementList.get(i), stuappraisalList.get(i), list.get(i));
			myStudents.add(mStudent);
		}
		return myStudents;
	}

	//通过requirement获取学生
	@Override
	public List<Student> getStudentsByRequirements(List<Requirement> list) {
		List<Student> list2 = new ArrayList<Student>();
		for(int i=0;i<list.size();i++){
			list2.add(this.selectByPrimaryKey(list.get(i).getStudentid()));
		}
		return list2;
	}
	

	
	

}
