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
	
	@RequestMapping(value="toStudent_index")
	public String toStudent_index(HttpServletRequest request,ModelMap modelMap){
		if(request.getParameter("requirement_msg")!=null){
			modelMap.addAttribute("requirement_msg", request.getParameter("requirement_msg"));
		}
		return "student_index";
	}

	@RequestMapping(value="toStudent_info")
	public String toStudent_info(HttpServletRequest request,ModelMap modelMap){
		return "student_info";
	}
	
}
