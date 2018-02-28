package com.tutor.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.alibaba.fastjson.JSON;
import com.tutor.dto.MyObject;
import com.tutor.dto.MyselfUtils;
import com.tutor.dto.NewRequirement;
import com.tutor.dto.Pager;
import com.tutor.dto.ResponseUtils;
import com.tutor.entity.Requirement;
import com.tutor.entity.Student;
import com.tutor.service.RequirementService;
import com.tutor.service.StudentService;

@Controller
public class RequirementController {

	@Autowired
	RequirementService requirementService;
	@Autowired
	StudentService studentService;
	
	@RequestMapping(value="toRequirement_list")
	public String toRequirement_list(HttpServletRequest request,ModelMap modelMap){
		if (MyselfUtils.isChooseCity(request)!=null) {
			return "chooseCity";
		}
		return "requirement_list";
	}
	
	//前往发布订单需求页面
	@RequestMapping(value="/toRequirement_info")
	public String toRequirement_info(int id,HttpServletRequest request,ModelMap modelMap){
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		if(request.getParameter("message")!=null){
			modelMap.addAttribute("message", request.getParameter("message"));
		}
		modelMap.addAttribute("requirement", requirementService.selectByPrimaryKey(id));
		modelMap.addAttribute("testPermission", requirementService.testPermission(request, id));
		return "requirement_info";
	}
	
	//requirement_list页面ajax请求订单列表
	@RequestMapping(value = "/requirement_list_ajax_requirementList")
	public void requirement_list_ajax_requirementList(HttpServletRequest request, HttpServletResponse response) {
		Requirement requirement = new Requirement();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		if(request.getParameter("sex")!=null){
			requirement.setSex(request.getParameter("sex"));
		}
		if(request.getParameter("course")!=null){
			requirement.setCourse(request.getParameter("course"));
		}
		if(request.getParameter("area")!=null){
			requirement.setArea(request.getParameter("area"));
		}
		String province = (String) request.getSession().getAttribute("USER_PROVINCE");
		String city = (String) request.getSession().getAttribute("USER_CITY");
		requirement.setAddress(province+","+city);
		requirement.setPermission(0);
		List<Requirement> list = requirementService.getRequirementsByCondition(requirement);
		List<Student> list2 = studentService.getStudentsByRequirements(list);
		List<NewRequirement> list3 = new ArrayList<NewRequirement>();
		for(int i=0;i<list.size();i++){
			NewRequirement newRequirement = new NewRequirement(list2.get(i), list.get(i));
			list3.add(newRequirement);
		}
		Pager<NewRequirement> pager = new Pager<NewRequirement>(pageNum, 12, list3);
		MyObject<NewRequirement> myObject = new MyObject<NewRequirement>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	
}
