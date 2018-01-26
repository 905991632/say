package com.tutor.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tutor.dto.Pager;
import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;

public interface RequirementService {

	int addRequire(Requirement requirement);
	
	List<Requirement> getRequirementsByCondition(Requirement requirement);
	
	int updateByPrimaryKeySelective(Requirement requirement);
	
	Requirement selectByPrimaryKey(int id);
	
	Pager<Requirement> getRequirements(List<Requirement> list, int pageNum,int pageSize);
	
	List<String> getPhotos(List<Requirement> list);
	
	int testPermission(HttpServletRequest request ,int requireId);
	
	List<Requirement> getRequirementByApply(Apply apply);
	
}
