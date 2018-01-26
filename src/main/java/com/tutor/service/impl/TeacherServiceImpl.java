package com.tutor.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.LoginMapper;
import com.tutor.dao.TeacherMapper;
import com.tutor.dto.Pager;
import com.tutor.entity.Login;
import com.tutor.entity.Teacher;
import com.tutor.entity.TeacherExample;
import com.tutor.entity.TeacherExample.Criteria;
import com.tutor.service.TeacherService;

/*
 * 教师跟人信息模块
 */
@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherMapper teacherMapper;
	@Autowired
	LoginMapper loginMapper;
	
	//添加教师
	@Override
	public int addTeacher(Teacher teacher) {
		return teacherMapper.insertSelective(teacher);
	}

	//通过id获取教师
	@Override
	public Teacher selectByPrimaryKey(int id) {
		return teacherMapper.selectByPrimaryKey(id);
	}

	//通过外键获取教师
	@Override
	public List<Teacher> getTeacherByForeignKey(int foreignkey) {
		TeacherExample example = new TeacherExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginidEqualTo(foreignkey);
		return teacherMapper.selectByExample(example);
	}

	/*
	 * 	更新改动过的教师属性,需要有id
	 * 	返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Teacher teacher) {
		return teacherMapper.updateByPrimaryKeySelective(teacher);
	}

	/*
	 * 	通过条件获取教师列表
	 * 	
	 */
	@Override
	public List<Teacher> getTeachersByCondition(Teacher teacher) {
		TeacherExample example = new TeacherExample();
		Criteria criteria = example.createCriteria();
		
		if(teacher.getId()!=null){
			criteria.andIdEqualTo(teacher.getId());
		}
		if(teacher.getPermission()!=null){
			criteria.andPermissionEqualTo(teacher.getPermission());
		}
		if(teacher.getPhoto()!=null){
			criteria.andPhotoEqualTo(teacher.getPhoto());
		}
		if(teacher.getIdcard()!=null){
			criteria.andIdcardEqualTo(teacher.getIdcard());
		}
		if(teacher.getName()!=null){
			criteria.andNameEqualTo(teacher.getName());
		}
		if(teacher.getSex()!=null){
			criteria.andSexEqualTo(teacher.getSex());
		}
		if(teacher.getAge()!=null){
			criteria.andAgeEqualTo(teacher.getAge());
		}
		if(teacher.getMobile()!=null){
			criteria.andMobileEqualTo(teacher.getMobile());
		}
		if(teacher.getCourses()!=null){
			criteria.andCoursesLike("%"+teacher.getCourses()+"%");
		}
		if(teacher.getAddress()!=null){
			criteria.andAddressEqualTo(teacher.getAddress());
		}
		if(teacher.getArea()!=null){
			criteria.andAreaLike("%"+teacher.getArea()+"%");
		}
		if(teacher.getLoginid()!=null){
			criteria.andLoginidEqualTo(teacher.getLoginid());
		}
		example.setOrderByClause("loginTime desc");
		
		return teacherMapper.selectByExample(example);
	}

	//把list分页，返回当前页码的数据
	@Override
	public Pager<Teacher> getTeachers(List<Teacher> list, int pageNum,int pageSize) {
		Pager<Teacher> pager = new Pager<Teacher>(pageNum,pageSize,list);
		return pager;
	}

	//通过id把密码修改为password的值
	@Override
	public int alterPasswordById(int id,String oldPassword,String newPassword) {
		Login login = loginMapper.selectByPrimaryKey(teacherMapper.selectByPrimaryKey(id).getLoginid());
		if(!login.getPassword().equals(oldPassword)){
			return 2;
		}
		login.setPassword(newPassword);
		loginMapper.updateByPrimaryKey(login);
		return 1;
	}
	
	

}
