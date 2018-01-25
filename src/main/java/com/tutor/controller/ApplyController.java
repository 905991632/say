package com.tutor.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tutor.entity.Apply;
import com.tutor.service.ApplyService;

@Controller
public class ApplyController {

	@Autowired
	ApplyService applyService;
	
	@RequestMapping(value="apply_list")
	public String apply_list(HttpServletRequest request,ModelMap modelMap){
		return "";
	}
	
	@RequestMapping(value="apply_add")
	public String apply_add(Apply apply,HttpServletRequest request,ModelMap modelMap){
		apply.setType("订单");
		apply.setCreatetime(new Date());
		if(applyService.addApply(apply)!=1){
			modelMap.addAttribute("message", "申请失败");
			return "redirect:toRequirement_info?id="+apply.getRequireid();
		}
		modelMap.addAttribute("message", "申请成功");
		return "redirect:toRequirement_info?id="+apply.getRequireid();
	}
	
	
}
