package com.tutor.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tutor.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;

	//前往学生中心首页页面
	@RequestMapping(value = "toStudent_index")
	public String toStudent_index(HttpServletRequest request, ModelMap modelMap) {
		if (request.getParameter("requirement_msg") != null) {
			modelMap.addAttribute("requirement_msg", request.getParameter("requirement_msg"));
		}
		return "student_index";
	}

	// 前往学生中心基本资料页面
	@RequestMapping(value = "toStudent_info")
	public String toStudent_info(HttpServletRequest request, ModelMap modelMap) {
		return "student_info";
	}

	// 前往学生中心的我的老师页面
	@RequestMapping(value = "toStudent_myTeacher")
	public String toStudent_myTeacher(HttpServletRequest request, ModelMap modelMap) {
		return "student_myTeacher";
	}
	
	// 前往学生中心我的评价页面
	@RequestMapping(value = "toStudent_appraisal")
	public String toStudent_appraisal(HttpServletRequest request, ModelMap modelMap) {
		return "student_appraisal";
	}

	// 前往学生中心我的预约页面
	@RequestMapping(value = "toStudent_myOrder")
	public String toStudent_myOrder(HttpServletRequest request, ModelMap modelMap) {
		return "student_myOrder";
	}
}
