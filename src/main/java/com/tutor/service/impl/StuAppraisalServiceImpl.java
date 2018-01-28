package com.tutor.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tutor.dao.StuappraisalMapper;
import com.tutor.entity.Apply;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.StuappraisalExample;
import com.tutor.entity.StuappraisalExample.Criteria;
import com.tutor.service.ApplyService;
import com.tutor.service.StuAppraisalService;
import com.tutor.service.TeaAppraisalService;

/*
 * 	教师评论学生模块
 */
@Service
public class StuAppraisalServiceImpl implements StuAppraisalService {

	@Autowired
	StuappraisalMapper stuappraisalMapper;
	@Autowired
	TeaAppraisalService teaAppraisalService;
	@Autowired
	ApplyService applyService;
	
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
		if(stuappraisal.getStudentid()!=null){
			criteria.andStudentidEqualTo(stuappraisal.getStudentid());
		}
		if(stuappraisal.getTeacherid()!=null){
			criteria.andTeacheridEqualTo(stuappraisal.getTeacherid());
		}
/*		if(stuappraisal.getContent()!=null){
			criteria.andContentEqualTo(stuappraisal.getContent());
		}
		if(stuappraisal.getScore()!=null){
			criteria.andScoreEqualTo(stuappraisal.getScore());
		}
		if(stuappraisal.getCreatetime()!=null){
			criteria.andCreatetimeEqualTo(stuappraisal.getCreatetime());
		}*/
		if(stuappraisal.getPermission()!=null){
			criteria.andPermissionEqualTo(stuappraisal.getPermission());
		}
		return stuappraisalMapper.selectByExample(example);
	}

	@Override
	public Stuappraisal selectByPrimaryKey(int id) {
		return stuappraisalMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Stuappraisal> getStuappraisalByApply(List<Apply> list) {
		List<Stuappraisal> list2 = new ArrayList<Stuappraisal>();
		for(int i=0;i<list.size();i++){
			Stuappraisal stuappraisal = this.getStuappraisalByApplyid(list.get(i).getId());
			list2.add(stuappraisal);
		}
		return list2;
	}

	@Override
	public Stuappraisal getStuappraisalByApplyid(int applyid) {
		StuappraisalExample example = new StuappraisalExample();
		Criteria criteria = example.createCriteria();
		criteria.andApplyidEqualTo(applyid);
		List<Stuappraisal> list = stuappraisalMapper.selectByExample(example);
		return list.get(0);
	}

	@Override
	public int toAppraisal(Stuappraisal stuappraisal) {
		//评价
		this.updateByPrimaryKeySelective(stuappraisal);
		int applyid = stuappraisal.getApplyid();
		//判断老师是否评价
		if(teaAppraisalService.getTeaappraisalByApplyid(applyid).getPermission()==1){
			Apply apply = applyService.selectByPrimaryKey(applyid);
			apply.setPermission(3);
			applyService.updateByPrimaryKeySelective(apply);
		}
		return 1;
	}

	
}
