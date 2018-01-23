package com.tutor.dto;

import javax.servlet.http.HttpServletRequest;

public class MyselfUtils {

	public static String isLogin(HttpServletRequest request){
		if(request.getSession().getAttribute("USER_ID")==null || request.getSession().getAttribute("USER_TYPE")==null){
			return "toLogin";
		}
		return null;
	}
	
	public static String isChooseCity(HttpServletRequest request){
		if(request.getSession().getAttribute("USER_PROVINCE")==null || request.getSession().getAttribute("USER_CITY")==null){
			return "toChooseCity";
		}
		return null;
	}
	
	public static String canMakeOrder(HttpServletRequest request){
		if(request.getSession().getAttribute("USER_ID")==null || request.getSession().getAttribute("USER_TYPE")==null){
			
			
		}
		
		return "";
	}
}
