package com.tutor.service;

import java.util.List;
import com.tutor.entity.Teaappraisal;;

public interface TeaAppraisalService {

	int addStuAppraisal(Teaappraisal teaappraisal);
	
	int updateByPrimaryKeySelective(Teaappraisal teaappraisal);
	
	List<Teaappraisal> getStuappraisalsByCondition(Teaappraisal teaappraisal);
	
	Teaappraisal selectByPrimaryKey(int id);
}
