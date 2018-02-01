package com.tutor.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;

public interface RequirementService {

	int addRequire(Requirement requirement);
	
	List<Requirement> getRequirementsByCondition(Requirement requirement);
	
	int updateByPrimaryKeySelective(Requirement requirement);
	
	Requirement selectByPrimaryKey(int id);
	
	int testPermission(HttpServletRequest request ,int requireId);
	
	List<Requirement> getRequirementByApply(List<Apply> list);
	
	int cancelRequirement(int id);
	
	int acceptRequirement(int teacherid,int requireid);
	
	int rejectRequirement(int teacherid,int requireid);
	
}
