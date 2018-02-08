package com.tutor.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.RequirementMapper;
import com.tutor.dao.StudentMapper;
import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;
import com.tutor.entity.RequirementExample;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Teaappraisal;
import com.tutor.entity.RequirementExample.Criteria;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.StuAppraisalService;
import com.tutor.service.TeaAppraisalService;

/*
 *  订单需求模块
 */
@Service
public class RequirementServiceImpl implements RequirementService {

	@Autowired
	RequirementMapper requirementMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	ApplyService applyService;
	@Autowired
	StuAppraisalService stuAppraisalService;
	@Autowired
	TeaAppraisalService teaAppraisalService;
	
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
		/*if (requirement.getPrice() != null) {
			criteria.andPriceEqualTo(requirement.getPrice());
		}
		if (requirement.getDetail() != null) {
			criteria.andDetailEqualTo(requirement.getDetail());
		}*/
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

	//通过id查询
	@Override
	public Requirement selectByPrimaryKey(int id) {
		return requirementMapper.selectByPrimaryKey(id);
	}

	//检测是否能够申请订单，1为可以，2为已申请，3为不可申请(用户为学生)
	@Override
	public int testPermission(HttpServletRequest request ,int requireId) {
		if(request.getSession().getAttribute("USER_TYPE")==null || request.getSession().getAttribute("USER_ID")==null){
			return 4;
		}
		String userType = (String)request.getSession().getAttribute("USER_TYPE");
		int userId = (int)request.getSession().getAttribute("USER_ID");
		if(userType.equals("学生")){
			return 3;
		}
		Apply apply = new Apply();
		apply.setPermission(0);
		apply.setRequireid(requireId);
		apply.setType("订单");
		apply.setTeacherid(userId);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		Apply apply1 = new Apply();
		apply1.setPermission(0);
		apply1.setRequireid(requireId);
		apply1.setType("预约");
		apply1.setTeacherid(userId);
		List<Apply> list1 = applyService.getAppliesByCondition(apply1);
		if(list.size()<1 && list1.size()<1){
			return 1;
		}
		return 2;
	}

	//通过apply查询家教信息
	@Override
	public List<Requirement> getRequirementByApply(List<Apply> list) {
		List<Requirement> list2 = new ArrayList<Requirement>();
		for(int i=0;i<list.size();i++){
			list2.add(requirementMapper.selectByPrimaryKey(list.get(i).getRequireid()));
		}
		return list2;
	}

	//取消家教信息
	@Override
	public int cancelRequirement(int id) {
		//1、将requirement.permission设为1
		Requirement requirement = new Requirement();
		requirement.setId(id);
		requirement.setPermission(1);
		this.updateByPrimaryKeySelective(requirement);
		//2、将所有apply.reuqireid=id的permission设为2
		Apply apply = new Apply();
		apply.setRequireid(id);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		for(int i=0;i<list.size();i++){
			list.get(i).setPermission(2);
			applyService.updateByPrimaryKeySelective(list.get(i));
		}
		return 1;
	}

	//接受预约
	@Override
	public int acceptRequirement(int teacherid,int requireid) {
		Apply apply = new Apply();
		apply.setRequireid(requireid);
		apply.setTeacherid(teacherid);
		apply.setPermission(0);
		apply.setType("预约");
		List<Apply> list = applyService.getAppliesByCondition(apply);
		int applyid = list.get(0).getId();
		apply.setId(applyid);
		apply.setPermission(1);
		int result = applyService.updateByPrimaryKeySelective(apply);
		apply = list.get(0);
		Teaappraisal teaappraisal = new Teaappraisal();
		Stuappraisal stuappraisal = new Stuappraisal();
		teaappraisal.setApplyid(applyid);
		teaappraisal.setPermission(0);
		teaappraisal.setStudentid(apply.getStudentid());
		teaappraisal.setTeacherid(apply.getTeacherid());
		stuappraisal.setApplyid(applyid);
		stuappraisal.setPermission(0);
		stuappraisal.setStudentid(apply.getStudentid());
		stuappraisal.setTeacherid(apply.getTeacherid());
		teaAppraisalService.addStuAppraisal(teaappraisal);
		stuAppraisalService.addStuAppraisal(stuappraisal);
		
		return result;
	}

	//拒绝预约
	@Override
	public int rejectRequirement(int teacherid, int requireid) {
		Apply apply = new Apply();
		apply.setRequireid(requireid);
		apply.setTeacherid(teacherid);
		apply.setPermission(0);
		apply.setType("预约");
		List<Apply> list = applyService.getAppliesByCondition(apply);
		apply.setId(list.get(0).getId());
		apply.setPermission(2);
		int result = applyService.updateByPrimaryKeySelective(apply);
		return result;
	}

	
	

}
