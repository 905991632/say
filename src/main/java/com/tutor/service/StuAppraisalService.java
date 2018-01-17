package com.tutor.service;

import java.util.List;
import com.tutor.entity.Stuappraisal;

public interface StuAppraisalService {
	
	int addStuAppraisal(Stuappraisal stuappraisal);
	
	int updateByPrimaryKeySelective(Stuappraisal stuappraisal);
	
	List<Stuappraisal> getStuappraisalsByCondition(Stuappraisal stuappraisal);
	
	Stuappraisal selectByPrimaryKey(int id);
}
