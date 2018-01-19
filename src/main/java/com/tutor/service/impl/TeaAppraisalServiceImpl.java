package com.tutor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.TeaappraisalMapper;
import com.tutor.entity.Teaappraisal;
import com.tutor.entity.TeaappraisalExample;
import com.tutor.entity.TeaappraisalExample.Criteria;
import com.tutor.service.TeaAppraisalService;

/*
 * 学生评论教师模块
 */
@Service
public class TeaAppraisalServiceImpl implements TeaAppraisalService {

	@Autowired
	TeaappraisalMapper teaappraisalMapper;
	
	/*
	 * 	添加学生评论教师实体
	 * 	返回1
	 */
	@Override
	public int addStuAppraisal(Teaappraisal teaappraisal) {
		return teaappraisalMapper.insertSelective(teaappraisal);
	}

	/*
	 * 	更新学生评论教师实体
	 * 	返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Teaappraisal teaappraisal) {
		return teaappraisalMapper.updateByPrimaryKeySelective(teaappraisal);
	}

	/*
	 * 	筛选学生评论教师实体
	 * 	返回学生评论教师实体列表
	 */
	@Override
	public List<Teaappraisal> getStuappraisalsByCondition(Teaappraisal teaappraisal) {
		TeaappraisalExample example = new TeaappraisalExample();
		Criteria criteria = example.createCriteria();
		if(teaappraisal.getApplyid()!=null){
			criteria.andApplyidEqualTo(teaappraisal.getApplyid());
		}
		if(teaappraisal.getContent()!=null){
			criteria.andContentEqualTo(teaappraisal.getContent());
		}
		if(teaappraisal.getScore()!=null){
			criteria.andScoreEqualTo(teaappraisal.getScore());
		}
		if(teaappraisal.getCreatetime()!=null){
			criteria.andCreatetimeEqualTo(teaappraisal.getCreatetime());
		}
		if(teaappraisal.getPermission()!=null){
			criteria.andPermissionEqualTo(teaappraisal.getPermission());
		}
		return teaappraisalMapper.selectByExample(example);
	}

	@Override
	public Teaappraisal selectByPrimaryKey(int id) {
		return teaappraisalMapper.selectByPrimaryKey(id);
	}

	
}
