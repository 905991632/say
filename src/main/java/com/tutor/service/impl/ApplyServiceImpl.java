package com.tutor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.ApplyMapper;
import com.tutor.entity.Apply;
import com.tutor.entity.ApplyExample;
import com.tutor.entity.ApplyExample.Criteria;
import com.tutor.service.ApplyService;

/*
 * 订单申请模块
 */
@Service
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	ApplyMapper applyMapper;
	
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
		if(apply.getId()!=null){
			criteria.andIdEqualTo(apply.getId());
		}
		if(apply.getRequireid()!=null){
			criteria.andRequireidEqualTo(apply.getRequireid());
		}
		if(apply.getStudentid()!=null){
			criteria.andRequireidEqualTo(apply.getStudentid());
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

	
}
