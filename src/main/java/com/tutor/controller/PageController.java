package com.tutor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tutor.dto.MyselfUtils;

@Controller
public class PageController {

	//前往个人中心
	@RequestMapping(value="toPersonal")
	public String toPersonal(HttpServletRequest request,ModelMap modelMap){
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		String USER_TYPE = (String) request.getSession().getAttribute("USER_TYPE");
		if(USER_TYPE.equals("学生")){
			return "toStudent_index";
		}else {
			return "toTeacher_index";
		}
	}
	
}
