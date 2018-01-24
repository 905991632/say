package com.tutor.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.RequirementMapper;
import com.tutor.dao.StudentMapper;
import com.tutor.dao.TeacherMapper;
import com.tutor.dto.Pager;
import com.tutor.entity.Requirement;
import com.tutor.entity.RequirementExample;
import com.tutor.entity.RequirementExample.Criteria;
import com.tutor.service.RequirementService;

/*
 *  订单需求模块
 */
@Service
public class RequirementServiceImpl implements RequirementService {

	@Autowired
	RequirementMapper requirementMapper;

	@Autowired
	StudentMapper studentMapper;
	
	/*
	 * 添加订单需求 返回1
	 */
	@Override
	public int addRequire(Requirement requirement) {
		return requirementMapper.insertSelective(requirement);
	}

	/*
	 * 通过实体require查询订单列表 返回订单列表
	 */
	@Override
	public List<Requirement> getRequirementsByCondition(Requirement requirement) {
		RequirementExample example = new RequirementExample();
		Criteria criteria = example.createCriteria();
		if (requirement.getPermission() != null) {
			criteria.andPermissionEqualTo(requirement.getPermission());
		}
		if (requirement.getStudentid() != null) {
			criteria.andStudentidEqualTo(requirement.getStudentid());
		}
		if (requirement.getCourse() != null) {
			criteria.andCourseEqualTo(requirement.getCourse());
		}
		if (requirement.getSex() != null) {
			criteria.andSexLike("%"+requirement.getSex()+"%");
		}
		if(requirement.getAddress()!=null){
			criteria.andAddressEqualTo(requirement.getAddress());
		}
		if (requirement.getArea() != null) {
			criteria.andAreaEqualTo(requirement.getArea());
		}
		if (requirement.getPrice() != null) {
			criteria.andPriceEqualTo(requirement.getPrice());
		}
		if (requirement.getDetail() != null) {
			criteria.andDetailEqualTo(requirement.getDetail());
		}
		example.setOrderByClause("createTime desc");
		return requirementMapper.selectByExample(example);
	}

	/*
	 * 更新订单实体 返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Requirement requirement) {
		return requirementMapper.updateByPrimaryKeySelective(requirement);
	}

	@Override
	public Requirement selectByPrimaryKey(int id) {
		return requirementMapper.selectByPrimaryKey(id);
	}

	@Override
	public Pager<Requirement> getRequirements(List<Requirement> list, int pageNum) {
		Pager<Requirement> pager = new Pager<Requirement>(pageNum,9,list);
		return pager;
	}

	@Override
	public List<String> getPhotos(List<Requirement> list) {
		List<String> list2 = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			list2.add(studentMapper.selectByPrimaryKey(list.get(i).getStudentid()).getPhoto());
		}
		return list2;
	}
	
	

}
