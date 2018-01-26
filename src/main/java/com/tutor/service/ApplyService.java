package com.tutor.service;

import java.util.List;

import com.tutor.entity.Apply;

public interface ApplyService {

	int addApply(Apply apply);
	
	List<Apply> getAppliesByCondition(Apply apply);
	
	int updateByPrimaryKeySelective(Apply apply);
	
	Apply selectByPrimaryKey(int id);
	
	
}
