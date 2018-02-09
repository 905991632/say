package com.tutor.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.TutorLiveMapper;
import com.tutor.dto.Live;
import com.tutor.entity.Teacher;
import com.tutor.entity.TutorLive;
import com.tutor.entity.TutorLiveExample;
import com.tutor.entity.TutorLiveExample.Criteria;
import com.tutor.service.TeacherService;
import com.tutor.service.TutorLiveService;

@Service
public class TutorLiveServiceImpl implements TutorLiveService {

	@Autowired
	TutorLiveMapper tutorLiveMapper;
	@Autowired
	TeacherService teacherService;
	
	
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
		if(tutorLive.getAddress()!=null){
			criteria.andAddressEqualTo(tutorLive.getAddress());
		}
		example.setOrderByClause("createtime desc");
		return tutorLiveMapper.selectByExample(example);
	}

	/*
	 * 返回值的注释
	 * 	0:没有完善信息不能申请直播
	 * 	1:没申请直播
	 * 	2:直播申请中
	 * 	其他返回值为直播间id号，表示已申请
	 */
	//
	@Override
	public int getTutorLiveStatusByTeacherId(int teacherId) {
		Teacher teacher = teacherService.selectByPrimaryKey(teacherId);
		if(teacher.getPermission()==0){
			return 0;
		}else {
			TutorLive tutorLive = new TutorLive();
			tutorLive.setTeacherid(teacherId);
			List<TutorLive> list = this.getTutorLivesByCondition(tutorLive);
			if(list.size()==0){
				return 1;
			}else if(list.get(0).getPermission()==0){
				return 2;
			}else {
				return 3;
			}
		}
	}

	@Override
	public TutorLive getTutorLiveByTeacherId(int teacherId) {
		TutorLive tutorLive = new TutorLive();
		tutorLive.setTeacherid(teacherId);
		List<TutorLive> list = this.getTutorLivesByCondition(tutorLive);
		return list.get(0);
	}

	@Override
	public List<Live> getLives(List<TutorLive> tutorLives) {
		List<Live> list = new ArrayList<Live>();
		for(int i=0;i<tutorLives.size();i++){
			Teacher teacher = teacherService.selectByPrimaryKey(tutorLives.get(i).getTeacherid());
			Live live =new Live(teacher, tutorLives.get(i));
			list.add(live);
		}	
		return list;
	}

	
	

}
