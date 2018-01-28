package com.tutor.service;

import java.util.List;
import com.tutor.entity.Apply;
import com.tutor.entity.Teaappraisal;;

public interface TeaAppraisalService {

	int addStuAppraisal(Teaappraisal teaappraisal);
	
	int updateByPrimaryKeySelective(Teaappraisal teaappraisal);
	
	List<Teaappraisal> getTeaappraisalsByCondition(Teaappraisal teaappraisal);
	
	Teaappraisal selectByPrimaryKey(int id);
	
	List<Teaappraisal> getTeaappraisalByApply(List<Apply> list);
	
	Teaappraisal getTeaappraisalByApplyid(int applyid);
	
	int toAppraisal(Teaappraisal teaappraisal);
}
