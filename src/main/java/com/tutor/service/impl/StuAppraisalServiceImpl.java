package com.tutor.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.StuappraisalMapper;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.StuappraisalExample;
import com.tutor.entity.StuappraisalExample.Criteria;
import com.tutor.service.StuAppraisalService;

/*
 * 	教师评论学生模块
 */
@Service
public class StuAppraisalServiceImpl implements StuAppraisalService {

	@Autowired
	StuappraisalMapper stuappraisalMapper;
	
	/*
	 * 	添加教师评论学生实体
	 * 	返回1
	 */
	@Override
	public int addStuAppraisal(Stuappraisal stuappraisal) {
		return stuappraisalMapper.insertSelective(stuappraisal);
	}
	
	/*
	 * 	更新教师评论学生实体
	 * 	返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Stuappraisal stuappraisal) {
		return stuappraisalMapper.updateByPrimaryKeySelective(stuappraisal);
	}

	/*
	 * 	筛选教师评论学生实体
	 * 	返回教师评论学生实体列表
	 */
	@Override
	public List<Stuappraisal> getStuappraisalsByCondition(Stuappraisal stuappraisal) {
		StuappraisalExample example = new StuappraisalExample();
		Criteria criteria = example.createCriteria();
		if(stuappraisal.getApplyid()!=null){
			criteria.andApplyidEqualTo(stuappraisal.getApplyid());
		}
		if(stuappraisal.getContent()!=null){
			criteria.andContentEqualTo(stuappraisal.getContent());
		}
		if(stuappraisal.getScore()!=null){
			criteria.andScoreEqualTo(stuappraisal.getScore());
		}
		if(stuappraisal.getCreatetime()!=null){
			criteria.andCreatetimeEqualTo(stuappraisal.getCreatetime());
		}
		if(stuappraisal.getPermission()!=null){
			criteria.andPermissionEqualTo(stuappraisal.getPermission());
		}
		return stuappraisalMapper.selectByExample(example);
	}

	@Override
	public Stuappraisal selectByPrimaryKey(int id) {
		return stuappraisalMapper.selectByPrimaryKey(id);
	}

	
}
