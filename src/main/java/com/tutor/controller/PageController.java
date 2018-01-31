package com.tutor.controller;

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
import com.tutor.dto.Pager;
import com.tutor.dto.ResponseUtils;
import com.tutor.entity.Requirement;
import com.tutor.entity.Teaappraisal;
import com.tutor.entity.Teacher;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.TeacherService;

@Controller
public class PageController {

	@Autowired
	TeacherService teacherService;
	@Autowired
	RequirementService requirementService;
	@Autowired
	ApplyService applyService;
	
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
			model.addAttribute("teacherList", teacherService.getTeachers(teacherList,1,9).getDataList());
			model.addAttribute("requirementsList", requirementService.getRequirements(requirementsList, 1,9).getDataList());
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
			model.addAttribute("teacherList", teacherService.getTeachers(teacherList,1,9).getDataList());
			model.addAttribute("requirementsList", requirementService.getRequirements(requirementsList, 1,9).getDataList());
			model.addAttribute("photoList", photoList);
			return "index";
	}
	
	@RequestMapping(value = "/toTest")
	public String toTest(HttpServletRequest request, ModelMap model) {
		return "test";
	}
	
	@RequestMapping(value = "/tagSelect_test")
	public void tagSelect_test(HttpServletRequest request, HttpServletResponse response) {
		if(request.getParameter("pageNum")!=null){
			System.out.println("*******1="+request.getParameter("pageNum"));
		}
		if(request.getParameter("mode")!=null){
			System.out.println("*******2="+request.getParameter("mode"));
		}
		if(request.getParameter("stage")!=null){
			System.out.println("*******2="+request.getParameter("stage"));
		}
		if(request.getParameter("sector")!=null){
			System.out.println("*******2="+request.getParameter("sector"));
		}
		if(request.getParameter("board")!=null){
			System.out.println("*******2="+request.getParameter("board"));
		}
		String result = JSON.toJSONString("1");
		ResponseUtils.renderJson(response,result);
		
	}

	
	
	
}
