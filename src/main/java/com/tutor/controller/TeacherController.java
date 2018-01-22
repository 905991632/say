package com.tutor.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tutor.entity.Teacher;
import com.tutor.service.TeacherService;

@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;
	
	// 前往老师订单页面
	@RequestMapping(value = "toTeacher_myRequirement")
	public String toTeacher_myRequirement(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_myRequirement";
	}

	// 前往老师订单页面
	@RequestMapping(value = "toTeacher_myStudent")
	public String toTeacher_myStudent(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_myStudent";
	}

	// 前往老师个人中心的基本资料
	@RequestMapping(value = "toTeacher_info")
	public String toTeacher_info(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_info";
	}

	// 修改个人信息
	@RequestMapping(value = "teacher_info")
	public String teacher_info(Teacher teacher, @RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap modelMap) {
		return "teacher_info";
	}
	
	// 前往教师个人中心我的预约页面
	@RequestMapping(value = "toTeacher_myOrder")
	public String toTeacher_myOrder(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_myOrder";
	}
	
	// 前往教师列表页面
	@RequestMapping(value = "toTeacher_list")
	public String toTeacher_list(HttpServletRequest request, ModelMap modelMap) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		}
		Teacher teacher = new Teacher();
		if(request.getParameter("sex")!=null){
			teacher.setSex(request.getParameter("sex"));
		}
		if(request.getParameter("course")!=null){
			teacher.setCourses(request.getParameter("course"));
		}
		if(request.getParameter("area")!=null){
			teacher.setArea(request.getParameter("area"));
		}
		String province = (String) request.getSession().getAttribute("USER_PROVINCE");
		String city = (String) request.getSession().getAttribute("USER_CITY");
		teacher.setAddress(province+","+city);
		List<Teacher> list = teacherService.getTeachersByCondition(teacher);
		modelMap.addAttribute("teacherList", list);
		return "teacher_list";
	}

}
