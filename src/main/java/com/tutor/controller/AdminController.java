package com.tutor.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.alibaba.fastjson.JSON;
import com.tutor.dto.MyObject;
import com.tutor.dto.Pager;
import com.tutor.dto.ResponseUtils;
import com.tutor.entity.Teacher;
import com.tutor.entity.TutorLive;
import com.tutor.service.TeacherService;
import com.tutor.service.TutorLiveService;

@Controller
public class AdminController {

	@Autowired
	TeacherService teacherService;
	@Autowired
	TutorLiveService tutorLiveService;
	
	//admin_index页面ajax请求教师审核信息
	@RequestMapping(value = "/admin_ajax_getTeacher")
	public void admin_ajax_getTeacher(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Teacher teacher = new Teacher();
		teacher.setPermission(2);
		List<Teacher> list = teacherService.getTeachersByCondition(teacher);
		Pager<Teacher> pager = new Pager<Teacher>(pageNum, 8, list);
		MyObject<Teacher> myObject = new MyObject<Teacher>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//admin_index页面ajax请求教师审核信息
	@RequestMapping(value = "/admin_ajax_getIdCard")
	public void admin_ajax_getIdCard(HttpServletRequest request, HttpServletResponse response) {
		int teacherid = Integer.parseInt(request.getParameter("teacherid"));
		Teacher teacher = teacherService.selectByPrimaryKey(teacherid);
		String result = JSON.toJSONString(teacher);
		ResponseUtils.renderJson(response,result);
	}
	
	//admin_index页面ajax通过教师审核
	@RequestMapping(value = "/admin_ajax_teacherAccept")
	public void admin_ajax_teacherAccept(HttpServletRequest request, HttpServletResponse response) {
		int teacherid = Integer.parseInt(request.getParameter("teacherid"));
		Teacher teacher = teacherService.selectByPrimaryKey(teacherid);
		teacher.setPermission(1);
		int result = teacherService.updateByPrimaryKeySelective(teacher);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}	
	
	//admin_index页面ajax拒绝教师审核
	@RequestMapping(value = "/admin_ajax_teacherReject")
	public void admin_ajax_teacherReject(HttpServletRequest request, HttpServletResponse response) {
		int teacherid = Integer.parseInt(request.getParameter("teacherid"));
		Teacher teacher = teacherService.selectByPrimaryKey(teacherid);
		teacher.setPermission(0);
		int result = teacherService.updateByPrimaryKeySelective(teacher);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}	
	
	//admin_index页面ajax请求直播间申请情况
	@RequestMapping(value = "/admin_ajax_getTutorLive")
	public void admin_ajax_getTutorLive(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		TutorLive tutorLive = new TutorLive();
		tutorLive.setPermission(0);
		List<TutorLive> list = tutorLiveService.getTutorLivesByCondition(tutorLive);
		Pager<TutorLive> pager = new Pager<TutorLive>(pageNum, 8, list);
		MyObject<TutorLive> myObject = new MyObject<TutorLive>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}	
	
	//admin_index页面ajax接受直播申请
	@RequestMapping(value = "/admin_ajax_tutorLiveAccept")
	public void admin_ajax_tutorLiveAccept(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		TutorLive tutorLive = tutorLiveService.selectByPrimaryKey(id);
		tutorLive.setPermission(1);
		tutorLive.setRtmpkey(UUID.randomUUID().toString());
		int result = tutorLiveService.updateByPrimaryKeySelective(tutorLive);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}	

	//admin_index页面ajax拒绝直播申请
	@RequestMapping(value = "/admin_ajax_tutorLiveReject")
	public void admin_ajax_tutorLiveReject(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		TutorLive tutorLive = tutorLiveService.selectByPrimaryKey(id);
		tutorLive.setPermission(2);
		int result = tutorLiveService.updateByPrimaryKeySelective(tutorLive);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}	
	
	
}
