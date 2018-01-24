package com.tutor.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tutor.dto.MyselfUtils;
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
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		modelMap.addAttribute("teacher", teacherService.selectByPrimaryKey((int)request.getSession().getAttribute("USER_ID")));
		return "teacher_info";
	}

	// 修改个人信息
	@RequestMapping(value = "teacher_info")
	public String teacher_info(Teacher teacher, @RequestParam(value = "file", required = false) MultipartFile[] file,
			HttpServletRequest request, ModelMap modelMap) {
		for(int i = 0;i < file.length;i++){
			if(!file[i].getOriginalFilename().equals("")){
				String fileName=UUID.randomUUID() + file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf("."));
				String filePath=request.getSession().getServletContext().getRealPath("/")+"images/";
				File targetFile = new File(filePath, fileName);
				try {
                    file[i].transferTo(targetFile); // 传送 失败就抛异常
                } catch (Exception e) {
                    e.printStackTrace();
                }
				if(i==0){
					teacher.setPhoto("images/"+fileName);
				}else {
					teacher.setIdcard("images/"+fileName);
				}
			}
		}
		teacher.setPermission(0);
		if(teacherService.updateByPrimaryKeySelective(teacher)!=1){
			modelMap.addAttribute("message", "修改信息失败");
			return "teacher_index";
		}
		modelMap.addAttribute("message", "修改信息成功");
		return "teacher_index";
	}
	
	// 前往教师个人中心我的预约页面
	@RequestMapping(value = "toTeacher_myOrder")
	public String toTeacher_myOrder(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_myOrder";
	}
	
	// 前往教师列表页面
	@RequestMapping(value = "toTeacher_list")
	public String toTeacher_list(HttpServletRequest request, ModelMap modelMap) {
		if (MyselfUtils.isChooseCity(request)!=null) {
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
	
	// 前往老师订单页面
	@RequestMapping(value = "toTeacher_detail")
	public String toTeacher_detail(int id,HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("teacher", teacherService.selectByPrimaryKey(id));
		return "teacher_detail";
	}
	
	// 前往老师修改密码页面
	@RequestMapping(value = "toTeacher_alterPassword")
	public String toTeacher_alterPassword(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_alterPassword";
	}	

	//修改密码
	@RequestMapping(value = "teacher_alterPassword")
	public String teacher_alterPassword(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
		String msg = "密码修改成功";
		int userId = (int)request.getSession().getAttribute("USER_ID");
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		if(teacherService.alterPasswordById(userId,oldPassword, newPassword)!=1){
			msg = "密码修改失败";
		}
		modelMap.addAttribute("message", msg);
		return "teacher_index";
	}	
}
