package com.tutor.controller;

import java.util.Date;

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
}
