package com.tutor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tutor.dao.TutorLiveMapper;
import com.tutor.entity.TutorLive;
import com.tutor.entity.TutorLiveExample;
import com.tutor.entity.TutorLiveExample.Criteria;
import com.tutor.service.TutorLiveService;

public class TutorLiveServiceImpl implements TutorLiveService {

	@Autowired
	TutorLiveMapper tutorLiveMapper;
	
	@Override
	public int add(TutorLive tutorLive) {
		return tutorLiveMapper.insertSelective(tutorLive);
	}

	@Override
	public TutorLive selectByPrimaryKey(int id) {
		return tutorLiveMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(TutorLive tutorLive) {
		return updateByPrimaryKeySelective(tutorLive);
	}

	@Override
	public List<TutorLive> getTutorLivesByCondition(TutorLive tutorLive) {
		TutorLiveExample example = new TutorLiveExample();
		Criteria criteria = example.createCriteria();
		if(tutorLive.getPermission()!=null){
			criteria.andPermissionEqualTo(tutorLive.getPermission());
		}
		if(tutorLive.getTeacherid()!=null){
			criteria.andTeacheridEqualTo(tutorLive.getTeacherid());
		}
		example.setOrderByClause("createtime desc");
		return tutorLiveMapper.selectByExample(example);
	}

}
