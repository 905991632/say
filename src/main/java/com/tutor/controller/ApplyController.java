package com.tutor.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tutor.entity.Apply;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;

@Controller
public class ApplyController {

	@Autowired
	ApplyService applyService;
	@Autowired
	RequirementService requirementService;
		
	
	@RequestMapping(value="apply_delete")
	public String apply_list(int id,HttpServletRequest request,ModelMap modelMap){
		return "";
	}
	
	//添加订单申请
	@RequestMapping(value="apply_add")
	public String apply_add(Apply apply,HttpServletRequest request,ModelMap modelMap){
		apply.setCreatetime(new Date());
		if(applyService.addApply(apply)!=1){
			modelMap.addAttribute("message", "申请失败");
			return "redirect:toRequirement_info?id="+apply.getRequireid();
		}
		modelMap.addAttribute("message", "申请成功");
		return "redirect:toRequirement_info?id="+apply.getRequireid();
	}
	
	
}
