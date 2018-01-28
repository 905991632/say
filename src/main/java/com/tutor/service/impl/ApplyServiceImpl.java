package com.tutor.service.impl;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.ApplyMapper;
import com.tutor.entity.Apply;
import com.tutor.entity.ApplyExample;
import com.tutor.entity.ApplyExample.Criteria;
import com.tutor.entity.Requirement;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Teaappraisal;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.StuAppraisalService;
import com.tutor.service.TeaAppraisalService;



/*
 * 订单申请模块
 */
@Service
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	ApplyMapper applyMapper;
	@Autowired
	RequirementService requirementService;
	@Autowired
	StuAppraisalService stuAppraisalService;
	@Autowired
	TeaAppraisalService teaAppraisalService;
	
	
	/*
	 * 	添加订单申请
	 */
	@Override
	public int addApply(Apply apply) {
		return applyMapper.insert(apply);
	}

	/*
	 * 	通过条件获取申请信息
	 * 	返回申请实体类
	 */
	@Override
	public List<Apply> getAppliesByCondition(Apply apply) {
		ApplyExample example = new ApplyExample();
		Criteria criteria = example.createCriteria();
/*		if(apply.getId()!=null){
			criteria.andIdEqualTo(apply.getId());
		}*/
		if(apply.getRequireid()!=null){
			criteria.andRequireidEqualTo(apply.getRequireid());
		}
		if(apply.getStudentid()!=null){
			criteria.andStudentidEqualTo(apply.getStudentid());
		}
		if(apply.getTeacherid()!=null){
			criteria.andTeacheridEqualTo(apply.getTeacherid());
		}
		if(apply.getPermission()!=null){
			criteria.andPermissionEqualTo(apply.getPermission());
		}
		if(apply.getType()!=null){
			criteria.andTypeEqualTo(apply.getType());
		}
		example.setOrderByClause("createTime desc");
		
		return applyMapper.selectByExample(example);
	}
	
	/*
	 * 	更新
	 * 	返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Apply apply) {
		return applyMapper.updateByPrimaryKeySelective(apply);
	}

	/*
	 * 通过id获取实体类
	 * 返回实体类
	 */
	@Override
	public Apply selectByPrimaryKey(int id) {
		return applyMapper.selectByPrimaryKey(id);
	}

	//接受订单申请
	@Override
	public int acceptApply(int id) {
		//1、把requirement的permission改为1
		Apply apply = this.selectByPrimaryKey(id);
		int requireid = apply.getRequireid();
		Requirement requirement = new Requirement();
		requirement.setId(requireid);
		requirement.setPermission(1);
		if(requirementService.updateByPrimaryKeySelective(requirement)!=1){
			return 0;
		}
		//2、把所有的Apply.requireid为requireid的permission都设置为2
		Apply apply1 = new Apply();
		apply1.setRequireid(requireid);
		List<Apply> list = this.getAppliesByCondition(apply1);
		for(int i=0;i<list.size();i++){
			list.get(i).setPermission(2);
			this.updateByPrimaryKeySelective(list.get(i));
		}
		//3、把apply.id为id的permission设置为1
		apply.setPermission(1);
		this.updateByPrimaryKeySelective(apply);
		//4、 teaappraisal、stuapparisal添加订单评价
		Teaappraisal teaappraisal = new Teaappraisal();
		Stuappraisal stuappraisal = new Stuappraisal();
		teaappraisal.setApplyid(id);
		teaappraisal.setPermission(0);
		stuappraisal.setApplyid(id);
		stuappraisal.setPermission(0);
		teaAppraisalService.addStuAppraisal(teaappraisal);
		stuAppraisalService.addStuAppraisal(stuappraisal);
		return 1;
	}

	
	
	
	
	
}
