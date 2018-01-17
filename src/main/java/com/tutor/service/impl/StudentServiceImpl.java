package com.tutor.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.StudentMapper;
import com.tutor.entity.Student;
import com.tutor.entity.StudentExample;
import com.tutor.entity.StudentExample.Criteria;
import com.tutor.service.StudentService;

/*
 * 学生个人信息模块
 */
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;
	
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

	
	

}
