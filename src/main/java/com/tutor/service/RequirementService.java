package com.tutor.service;

import java.util.List;

import com.tutor.dto.Pager;
import com.tutor.entity.Requirement;

public interface RequirementService {

	int addRequire(Requirement requirement);
	
	List<Requirement> getRequirementsByCondition(Requirement requirement);
	
	int updateByPrimaryKeySelective(Requirement requirement);
	
	Requirement selectByPrimaryKey(int id);
	
	Pager<Requirement> getRequirements(List<Requirement> list, int pageNum);
	
	List<String> getPhotos(List<Requirement> list);
	
}
