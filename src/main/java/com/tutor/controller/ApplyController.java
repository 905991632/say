package com.tutor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tutor.service.ApplyService;

@Controller
public class ApplyController {

	@Autowired
	ApplyService applyService;
	
	@RequestMapping(value="apply_list")
	public String apply_list(HttpServletRequest request,ModelMap modelMap){
		return "";
	}
}
