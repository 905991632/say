package com.tutor.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tutor.dto.Live;
import com.tutor.dto.MyselfUtils;
import com.tutor.dto.NewRequirement;
import com.tutor.dto.Pager;
import com.tutor.entity.Requirement;
import com.tutor.entity.Student;
import com.tutor.entity.Teacher;
import com.tutor.entity.TutorLive;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.StudentService;
import com.tutor.service.TeacherService;
import com.tutor.service.TutorLiveService;

@Controller
public class PageController {

	@Autowired
	TeacherService teacherService;
	@Autowired
	RequirementService requirementService;
	@Autowired
	ApplyService applyService;
	@Autowired
	StudentService studentService;
	@Autowired
	TutorLiveService tutorLiveService;
	
	//前往个人中心
	@RequestMapping(value="toPersonal")
	public String toPersonal(HttpServletRequest request,ModelMap modelMap){
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		String USER_TYPE = (String) request.getSession().getAttribute("USER_TYPE");
		if(USER_TYPE.equals("学生")){
			return "student_index";
		}else {
			return "teacher_index";
		}
	}
	
	// 前往首页
	@RequestMapping(value = "/")
	public String index1(HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		} 
			String province = (String) request.getSession().getAttribute("USER_PROVINCE");
			String city = (String) request.getSession().getAttribute("USER_CITY");
			Teacher teacher = new Teacher();
			teacher.setPermission(0);
			teacher.setAddress(province + "," + city);
			List<Teacher> teacherList = teacherService.getTeachersByCondition(teacher);
			Requirement requirement = new Requirement();
			requirement.setPermission(0);
			requirement.setAddress(province + "," + city);
			List<Requirement> requirementsList = requirementService.getRequirementsByCondition(requirement);
			List<Student> list2 = studentService.getStudentsByRequirements(requirementsList);
			List<NewRequirement> list3 = new ArrayList<NewRequirement>();
			for(int i=0;i<requirementsList.size();i++){
				NewRequirement newRequirement = new NewRequirement(list2.get(i), requirementsList.get(i));
				list3.add(newRequirement);
			}
			Pager<Teacher> pager1 = new Pager<Teacher>(1, 9, teacherList);
			Pager<NewRequirement> pager2 = new Pager<NewRequirement>(1, 9, list3);
			model.addAttribute("teacherList", pager1.getDataList());
			model.addAttribute("requirementsList", pager2.getDataList());
			return "index";
	}

	// 前往首页
	@RequestMapping(value = "/index")
	public String index2(HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		} 
		String province = (String) request.getSession().getAttribute("USER_PROVINCE");
		String city = (String) request.getSession().getAttribute("USER_CITY");
		Teacher teacher = new Teacher();
		teacher.setPermission(1);
		teacher.setAddress(province + "," + city);
		List<Teacher> teacherList = teacherService.getTeachersByCondition(teacher);
		Requirement requirement = new Requirement();
		requirement.setPermission(0);
		requirement.setAddress(province + "," + city);
		List<Requirement> requirementsList = requirementService.getRequirementsByCondition(requirement);
		List<Student> list2 = studentService.getStudentsByRequirements(requirementsList);
		List<NewRequirement> list3 = new ArrayList<NewRequirement>();
		for(int i=0;i<requirementsList.size();i++){
			NewRequirement newRequirement = new NewRequirement(list2.get(i), requirementsList.get(i));
			list3.add(newRequirement);
		}
		Pager<Teacher> pager1 = new Pager<Teacher>(1, 9, teacherList);
		Pager<NewRequirement> pager2 = new Pager<NewRequirement>(1, 9, list3);
		model.addAttribute("teacherList", pager1.getDataList());
		model.addAttribute("requirementsList", pager2.getDataList());
		return "index";
	}
	
	@RequestMapping(value = "/toChat")
	public String toChat(HttpServletRequest request, ModelMap model) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		return "chat";
	}
	
	//前往直播列表
	@RequestMapping(value = "/toLiveRoomList")
	public String toLiveRoomList(HttpServletRequest request, ModelMap model) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String province = (String)request.getSession().getAttribute("USER_PROVINCE");
		String city = (String)request.getSession().getAttribute("USER_CITY");
		String address = province+","+city;
		TutorLive tutorLive = new TutorLive();
		tutorLive.setAddress(address);
		tutorLive.setPermission(1);
		List<TutorLive> list = tutorLiveService.getTutorLivesByCondition(tutorLive);
		List<Live> list2 = tutorLiveService.getLives(list);
		Pager<Live> pager = new Pager<Live>(pageNum,9,list2);
		model.addAttribute("liveList", pager.getDataList());
		model.addAttribute("totalPage", pager.getTotalPage());
		model.addAttribute("pageNum", pageNum);
		return "liveRoom_list";
	}
	
	//前往直播列表
	@RequestMapping(value = "/toLiveRoom")
	public String toLiveRoom(HttpServletRequest request, ModelMap model) {
		int teacherid = Integer.parseInt(request.getParameter("teacherid"));
		String type = (String)request.getSession().getAttribute("USER_TYPE");
		if(type.equals("学生")){
			type = "student";
		}else {
			type = "teacher";
		}
		TutorLive tutorLive = tutorLiveService.getTutorLiveByTeacherId(teacherid);
		model.addAttribute("type",type);
		model.addAttribute("tutorLive", tutorLive);
		return "LiveRoom";
	}
	
}
