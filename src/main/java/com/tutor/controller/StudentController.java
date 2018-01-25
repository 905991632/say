package com.tutor.controller;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tutor.dto.MyselfUtils;
import com.tutor.entity.Requirement;
import com.tutor.entity.Student;
import com.tutor.service.RequirementService;
import com.tutor.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	@Autowired
	RequirementService requirementService;
	
	//前往发布订单需求页面
	@RequestMapping(value="/toStudent_requirement")
	public String toStudent_requirement(HttpServletRequest request,ModelMap modelMap){
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
		return "student_requirement";
	}
	
	//添加订单需求
	@RequestMapping(value="student_requirement")
	public String student_requirement(Requirement requirement,HttpServletRequest request,ModelMap modelMap){
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
		requirement.setCreatetime(new Date());
		int result = requirementService.addRequire(requirement);
		if(result!=1){
			modelMap.addAttribute("message", "发布失败！！");
			return "student_index";
		}
		modelMap.addAttribute("message", "发布成功！！");
		return "student_index";
		
	}
	
	// 前往学生中心基本资料页面
	@RequestMapping(value = "toStudent_info")
	public String toStudent_info(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		modelMap.addAttribute("student", studentService.selectByPrimaryKey((int)request.getSession().getAttribute("USER_ID")));
		return "student_info";
	}

	// 更新学生基本资料
	@RequestMapping(value = "student_info")
	public String student_info(Student student,@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		if(!file.getOriginalFilename().equals("")){
			String fileName=UUID.randomUUID() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String filePath=request.getSession().getServletContext().getRealPath("/")+"images/";
			File targetFile = new File(filePath, fileName);
			try {
                file.transferTo(targetFile); // 传送 失败就抛异常
            } catch (Exception e) {
                e.printStackTrace();
            }
			student.setPhoto("images/"+fileName);
		}
		if(studentService.updateByPrimaryKeySelective(student)!=1){
			modelMap.addAttribute("message", "修改信息失败");
			return "student_index";
		}
		modelMap.addAttribute("message", "修改信息成功");
		return "student_index";
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

	// 前往学生修改密码页面
	@RequestMapping(value = "toStudent_alterPassword")
	public String toTeacher_alterPassword(HttpServletRequest request, ModelMap modelMap) {
		return "student_alterPassword";
	}
	
	// 前往学生修改密码页面
	@RequestMapping(value = "student_alterPassword")
	public String student_alterPassword(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
		String msg = "密码修改成功";
		int userId = (int)request.getSession().getAttribute("USER_ID");
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		if(studentService.alterPasswordById(userId,oldPassword, newPassword)!=1){
			msg = "密码修改失败";
		}
		modelMap.addAttribute("message", msg);
		return "student_index";
	}
	
	// 前往学生个人中心我的订单
	@RequestMapping(value = "toStudent_myRequirement")
	public String toStudent_myRequirement(HttpServletRequest request, ModelMap modelMap) {
		return "student_alterPassword";
	}
	
	
	
	
}
