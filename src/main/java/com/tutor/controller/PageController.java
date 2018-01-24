package com.tutor.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tutor.dto.MyselfUtils;
import com.tutor.entity.Requirement;
import com.tutor.entity.Teacher;
import com.tutor.service.RequirementService;
import com.tutor.service.TeacherService;

@Controller
public class PageController {

	@Autowired
	TeacherService teacherService;
	
	@Autowired
	RequirementService requirementService;
	
	
	//前往个人中心
	@RequestMapping(value="toPersonal")
	public String toPersonal(HttpServletRequest request,ModelMap modelMap){
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		String USER_TYPE = (String) request.getSession().getAttribute("USER_TYPE");
		if(USER_TYPE.equals("学生")){
			return "student_index";
		}else {
			return "teacher_index";
		}
	}
	
	// 前往首页
	@RequestMapping(value = "/")
	public String index1(HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		} 
			String province = (String) request.getSession().getAttribute("USER_PROVINCE");
			String city = (String) request.getSession().getAttribute("USER_CITY");
			Teacher teacher = new Teacher();
			teacher.setPermission(0);
			teacher.setAddress(province + "," + city);
			List<Teacher> teacherList = teacherService.getTeachersByCondition(teacher);
			Requirement requirement = new Requirement();
			requirement.setPermission(0);
			requirement.setAddress(province + "," + city);
			List<Requirement> requirementsList = requirementService.getRequirementsByCondition(requirement);
			List<String> photoList = requirementService.getPhotos(requirementsList);
			model.addAttribute("teacherList", teacherService.getTeachers(teacherList, 1).getDataList());
			model.addAttribute("requirementsList", requirementService.getRequirements(requirementsList, 1));
			model.addAttribute("photoList", photoList);
			return "index";
	}

	// 前往首页
	@RequestMapping(value = "/index")
	public String index2(HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		} 
			String province = (String) request.getSession().getAttribute("USER_PROVINCE");
			String city = (String) request.getSession().getAttribute("USER_CITY");
			Teacher teacher = new Teacher();
			teacher.setPermission(0);
			teacher.setAddress(province + "," + city);
			List<Teacher> teacherList = teacherService.getTeachersByCondition(teacher);
			Requirement requirement = new Requirement();
			requirement.setPermission(0);
			requirement.setAddress(province + "," + city);
			List<Requirement> requirementsList = requirementService.getRequirementsByCondition(requirement);
			List<String> photoList = requirementService.getPhotos(requirementsList);
			model.addAttribute("teacherList", teacherService.getTeachers(teacherList, 1).getDataList());
			model.addAttribute("requirementsList", requirementService.getRequirements(requirementsList, 1).getDataList());
			model.addAttribute("photoList", photoList);
			return "index";
	}
	
}
