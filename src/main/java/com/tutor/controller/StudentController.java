package com.tutor.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tutor.entity.Requirement;
import com.tutor.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	

}
