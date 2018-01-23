package com.tutor.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tutor.entity.Requirement;
import com.tutor.service.RequirementService;

@Controller
public class RequirementController {

	@Autowired
	RequirementService requirementService;
	
	//前往发布订单需求页面
	@RequestMapping(value="/toStudent_requirement")
	public String toStudent_requirement(HttpServletRequest request,ModelMap modelMap){
		return "student_requirement";
	}
	
	@RequestMapping(value="student_requirement")
	public String student_requirement(Requirement requirement,HttpServletRequest request,ModelMap modelMap){
		requirement.setPermission(0);
		requirement.setStudentid(5);
		requirement.setCreatetime(new Date());
		int result = requirementService.addRequire(requirement);
		if(result!=1){
			modelMap.addAttribute("requirement_msg", "发布失败！！");
			return "redirect:toStudent_index";
		}else {
			modelMap.addAttribute("requirement_msg", "发布成功！！");
			return "redirect:toStudent_index";
		}
	}
	
	@RequestMapping(value="toStudent_myRequirement")
	public String toStudent_myRequirement(HttpServletRequest request,ModelMap modelMap){
		return "student_myRequirement";
	}

	@RequestMapping(value="toRequirement_list")
	public String toRequirement_list(HttpServletRequest request,ModelMap modelMap){
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		}
		Requirement requirement = new Requirement();
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
		List<Requirement> requirementsList = requirementService.getRequirementsByCondition(requirement);
		modelMap.addAttribute("requirementsList", requirementsList);
		return "requirement_list";
	}
	
	//前往发布订单需求页面
	@RequestMapping(value="/toRequirement_info")
	public String toRequirement_info(int id,HttpServletRequest request,ModelMap modelMap){
		modelMap.addAttribute("requirement", requirementService.selectByPrimaryKey(id));
		return "requirement_info";
	}
	
}
