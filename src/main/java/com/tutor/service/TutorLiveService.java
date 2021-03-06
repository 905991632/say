package com.tutor.service;

import java.util.List;

import com.tutor.dto.Live;
import com.tutor.entity.TutorLive;

public interface TutorLiveService {
	
	int add(TutorLive tutorLive);
	
	TutorLive selectByPrimaryKey(int id);
	
	int updateByPrimaryKeySelective(TutorLive tutorLive);
	
	List<TutorLive> getTutorLivesByCondition(TutorLive tutorLive);
	
	int getTutorLiveStatusByTeacherId(int teacherId);
	
	TutorLive getTutorLiveByTeacherId(int teacherId);
	
	List<Live> getLives(List<TutorLive> tutorLives);
}
