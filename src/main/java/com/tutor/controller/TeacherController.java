package com.tutor.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSON;
import com.tutor.dto.MyObject;
import com.tutor.dto.MyStudent;
import com.tutor.dto.MyselfUtils;
import com.tutor.dto.Pager;
import com.tutor.dto.ResponseUtils;
import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Teaappraisal;
import com.tutor.entity.Teacher;
import com.tutor.entity.TutorLive;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.StuAppraisalService;
import com.tutor.service.StudentService;
import com.tutor.service.TeaAppraisalService;
import com.tutor.service.TeacherService;
import com.tutor.service.TutorLiveService;

@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;
	@Autowired
	RequirementService requirementService;
	@Autowired
	ApplyService applyService;
	@Autowired
	StudentService studentService;
	@Autowired
	StuAppraisalService stuAppraisalService;
	@Autowired
	TeaAppraisalService teaAppraisalService;
	@Autowired
	TutorLiveService tutorLiveService;
	
	// 前往老师订单页面
	@RequestMapping(value = "toTeacher_myRequirement")
	public String toTeacher_myRequirement(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_myRequirement";
	}

	// 前往老师个人中心我的学生页面
	@RequestMapping(value = "toTeacher_myStudent")
	public String toTeacher_myStudent(int pageNum,HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setTeacherid(teacherid);
		apply.setPermission(1);
		List<MyStudent> myStudents = studentService.getMyStudentsByApply(apply); 
		Pager<MyStudent> pager =new Pager<MyStudent>(pageNum,8,myStudents);
		modelMap.addAttribute("myStudents", pager.getDataList());
		modelMap.addAttribute("pageNum", pageNum);
		modelMap.addAttribute("totalPage", pager.getTotalPage());
		return "teacher_myStudent";
	}

	//评价学生
	@RequestMapping(value = "appraisalStudent")
	public String appraisalTeacher(Stuappraisal stuappraisal ,HttpServletRequest request, ModelMap modelMap) {
		int applyid = stuappraisal.getApplyid();
		Stuappraisal stuappraisal2 = stuAppraisalService.getStuappraisalByApplyid(applyid);
		int id = stuappraisal2.getId();
		stuappraisal.setId(id);
		stuappraisal.setPermission(1);
		stuappraisal.setCreatetime(new Date());
		stuAppraisalService.toAppraisal(stuappraisal);
		return "redirect:toTeacher_myStudent?pageNum=1";
	}
	
	// 前往教师中心我的评价页面
	@RequestMapping(value = "toTeacher_appraisal")
	public String toTeacher_appraisal(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		return "teacher_appraisal";
	}
	
	// 前往教师中心我的直播页面
	@RequestMapping(value = "toTeacher_myLive")
	public String toTeacher_myLive(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		int teacherId = (int)request.getSession().getAttribute("USER_ID");
		int statues = tutorLiveService.getTutorLiveStatusByTeacherId(teacherId);
		if(statues==3){
			TutorLive tutorLive = new TutorLive();
			tutorLive.setTeacherid(teacherId);
			List<TutorLive> list = tutorLiveService.getTutorLivesByCondition(tutorLive);
			TutorLive tutorLive2 = list.get(0);
			modelMap.addAttribute("tutorLive", tutorLive2);
		}
		modelMap.addAttribute("statues", statues);
		return "teacher_myLive";
	}
	
	// 申请直播
	@RequestMapping(value = "teacher_myLive")
	public String teacher_myLive(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		int teacherId = (int)request.getSession().getAttribute("USER_ID");
		TutorLive tutorLive = new TutorLive();
		tutorLive.setTeacherid(teacherId);
		tutorLive.setPermission(0);
		tutorLive.setRtmpurl("rtmp://139.199.75.20/Mylive");
		tutorLive.setCreatetime(new Date());
		tutorLiveService.add(tutorLive);
		return "redirect:toTeacher_myLive";
	}

	// 前往老师订单页面
	@RequestMapping(value = "teacherToLiveRoom")
	public String teacherToLiveRoom(HttpServletRequest request, ModelMap modelMap) {
		return "LiveRoom";
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
				String filePath;
				if(i==0){
					filePath=request.getSession().getServletContext().getRealPath("/")+"images/teacher/idcard/";
				}else {
					filePath=request.getSession().getServletContext().getRealPath("/")+"images/teacher/photo/";
				}
				File targetFile = new File(filePath, fileName);
				try {
                    file[i].transferTo(targetFile); // 传送 失败就抛异常
                } catch (Exception e) {
                    e.printStackTrace();
                }
				if(i==0){
					teacher.setPhoto("images/teacher/photo/"+fileName);
				}else {
					teacher.setIdcard("images/teacher/idcard/"+fileName);
				}
			}
		}
		teacher.setPermission(2);
		if(teacherService.updateByPrimaryKeySelective(teacher)!=1){
			modelMap.addAttribute("message", "修改信息失败");
			return "teacher_index";
		}
		modelMap.addAttribute("message", "修改信息成功");
		return "teacher_index";
	}
	
	// 前往教师个人中心我的预约页面
	@RequestMapping(value = "/toTeacher_myOrder")
	public String toTeacher_myOrder(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_myOrder";
	}
	
	// 前往教师列表页面
	@RequestMapping(value = "/toTeacher_list")
	public String toTeacher_list(HttpServletRequest request, ModelMap modelMap) {
		if (MyselfUtils.isChooseCity(request)!=null) {
			return "chooseCity";
		}
		/*int pageNum = Integer.parseInt(request.getParameter("pageNum"));
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
		Pager<Teacher> pager = new Pager<Teacher>(pageNum, 12, list);
		modelMap.addAttribute("teacherList", pager.getDataList());
		modelMap.addAttribute("pageNum", pageNum);
		modelMap.addAttribute("totalPage", pager.getTotalPage());*/
		return "teacher_list";
	}
	
	// 前往老师详情页面
	@RequestMapping(value = "/toTeacher_detail")
	public String toTeacher_detail(int id,HttpServletRequest request, ModelMap modelMap) {
		if(request.getParameter("message")!=null){
			modelMap.addAttribute("message","预约成功，请等待接受");
		}
		modelMap.addAttribute("teacher", teacherService.selectByPrimaryKey(id));
		return "teacher_detail";
	}
	
	// 前往老师修改密码页面
	@RequestMapping(value = "/toTeacher_alterPassword")
	public String toTeacher_alterPassword(HttpServletRequest request, ModelMap modelMap) {
		return "teacher_alterPassword";
	}	

	//修改密码
	@RequestMapping(value = "/teacher_alterPassword")
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
	
	//前往预约教师页面
	@RequestMapping(value = "/toMakeOrder")
	public String toMakeOrder(HttpServletRequest request, ModelMap model) {
		if(((String)request.getSession().getAttribute("USER_TYPE")).equals("教师")){
			return "Login";
		}
		int teacherid = Integer.parseInt(request.getParameter("teacherid")); 
		model.addAttribute("teacherid", teacherid);
		return "makeOrder";
	}
	
	//预约教师
	@RequestMapping(value = "/makeOrder")
	public String makeOrder(Requirement requirement , HttpServletRequest request, ModelMap model) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		int teacherid = Integer.parseInt(request.getParameter("teacherid")); 
		int studentid =(int)request.getSession().getAttribute("USER_ID"); 
		requirement.setCreatetime(new Date());
		requirementService.addRequire(requirement);
		int requireid = requirement.getId();
		Apply apply = new Apply();
		apply.setRequireid(requireid);
		apply.setPermission(0);
		apply.setStudentid(studentid);
		apply.setTeacherid(teacherid);
		apply.setType("预约");
		apply.setCreatetime(new Date());
		applyService.addApply(apply);
		model.addAttribute("message", "预约成功，请等待接受");
		return "redirect:toTeacher_detail?id="+teacherid;
	}
	
	//teacher_myRequirement页面ajax请求审核中
	@RequestMapping(value = "/teacher_myRequirement_ajax_getCheck")
	public void teacher_myRequirement_ajax_getCheck(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setTeacherid(teacherid);
		apply.setPermission(0);
		apply.setType("订单");
		List<Apply> applies = applyService.getAppliesByCondition(apply);
		List<Requirement> requirementList = requirementService.getRequirementByApply(applies);
		Pager<Requirement> pager = new Pager<Requirement>(pageNum, 8, requirementList);
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}

	//teacher_myRequirement页面ajax请求拒绝操作
	@RequestMapping(value = "/teacher_myRequirement_ajax_reject")
	public void teacher_myRequirement_ajax_reject(HttpServletRequest request, HttpServletResponse response) {
		int requireid = Integer.parseInt(request.getParameter("requireid"));
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setRequireid(requireid);
		apply.setTeacherid(teacherid);
		apply.setType("订单");
		apply.setPermission(0);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		apply.setId(list.get(0).getId());
		apply.setPermission(2);
		int result = applyService.updateByPrimaryKeySelective(apply);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}	
	
	//teacher_myRequirement页面ajax请求未通过
	@RequestMapping(value = "/teacher_myRequirement_ajax_getReject")
	public void teacher_myRequirement_ajax_getReject(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setTeacherid(teacherid);
		apply.setPermission(2);
		List<Apply> applies = applyService.getAppliesByCondition(apply);
		List<Requirement> requirementList = requirementService.getRequirementByApply(applies);
		Pager<Requirement> pager = new Pager<Requirement>(pageNum, 8, requirementList);
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//teacher_myRequirement页面ajax请求已完成
	@RequestMapping(value = "/teacher_myRequirement_ajax_getFinish")
	public void teacher_myRequirement_ajax_getFinish(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setTeacherid(teacherid);
		apply.setPermission(3);
		List<Apply> applies = applyService.getAppliesByCondition(apply);
		List<Requirement> requirementList = requirementService.getRequirementByApply(applies);
		Pager<Requirement> pager = new Pager<Requirement>(pageNum, 8, requirementList);
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//teacher_myOrder页面ajax请求我的预约
	@RequestMapping(value = "/teacher_myOrder_ajax_getMyOrder")
	public void teacher_myOrder_ajax_getMyOrder(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setTeacherid(teacherid);
		apply.setPermission(0);
		apply.setType("预约");
		List<Apply> applies = applyService.getAppliesByCondition(apply);
		List<Requirement> requirementList = requirementService.getRequirementByApply(applies);
		Pager<Requirement> pager = new Pager<Requirement>(pageNum, 8, requirementList);
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}	
	
	//teacher_myOrder页面ajax请求接受
	@RequestMapping(value = "/teacher_myOrder_ajax_accept")
	public void teacher_myOrder_ajax_accept(HttpServletRequest request, HttpServletResponse response) {
		int requireid = Integer.parseInt(request.getParameter("requireid"));
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		int result = requirementService.acceptRequirement(teacherid, requireid);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}	
	
	//teacher_myOrder页面ajax请求拒绝
	@RequestMapping(value = "/teacher_myOrder_ajax_reject")
	public void teacher_myOrder_ajax_reject(HttpServletRequest request, HttpServletResponse response) {
		int requireid = Integer.parseInt(request.getParameter("requireid"));
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		int result = requirementService.rejectRequirement(teacherid, requireid);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}
	
	//teacher_myOrder页面ajax请求拒绝
	@RequestMapping(value = "/teacher_myStudent_ajax_myStudent")
	public void teacher_myStudent_ajax_myStudent(HttpServletRequest request, HttpServletResponse response) {
		int requireid = Integer.parseInt(request.getParameter("requireid"));
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		int result = requirementService.rejectRequirement(teacherid, requireid);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}
	
	//teacher_appraisal页面ajax请求我的评价
	@RequestMapping(value = "/teacher_appraisal_ajax_myAppraisal")
	public void teacher_appraisal_ajax_myAppraisal(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Stuappraisal stuappraisal = new Stuappraisal();
		stuappraisal.setTeacherid(teacherid);;
		stuappraisal.setPermission(1);
		List<Stuappraisal> list = stuAppraisalService.getStuappraisalsByCondition(stuappraisal);
		Pager<Stuappraisal> pager = new Pager<Stuappraisal>(pageNum, 8, list);
		MyObject<Stuappraisal> myObject = new MyObject<Stuappraisal>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//teacher_appraisal页面ajax请求评价我的
	@RequestMapping(value = "/teacher_appraisal_ajax_appraisalMe")
	public void teacher_appraisal_ajax_appraisalMe(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int teacherid = (int)request.getSession().getAttribute("USER_ID");
		Teaappraisal teaappraisal = new Teaappraisal();
		teaappraisal.setTeacherid(teacherid);
		teaappraisal.setPermission(1);
		List<Teaappraisal> list = teaAppraisalService.getTeaappraisalsByCondition(teaappraisal);
		Pager<Teaappraisal> pager = new Pager<Teaappraisal>(pageNum, 8, list);
		MyObject<Teaappraisal> myObject = new MyObject<Teaappraisal>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//teacher_detail页面ajax请求已完成
	@RequestMapping(value = "/teacher_detail_ajax_getFinish")
	public void teacher_detail_ajax_getFinish(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int teacherid = Integer.parseInt(request.getParameter("teacherid"));
		Apply apply = new Apply();
		apply.setTeacherid(teacherid);
		apply.setPermission(3);
		List<Apply> applies = applyService.getAppliesByCondition(apply);
		List<Requirement> requirementList = requirementService.getRequirementByApply(applies);
		Pager<Requirement> pager = new Pager<Requirement>(pageNum, 8, requirementList);
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//teacher_detail页面ajax请求评价我的
	@RequestMapping(value = "/teacher_detail_ajax_appraisalMe")
	public void teacher_detail_ajax_appraisalMe(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int teacherid = Integer.parseInt(request.getParameter("teacherid"));
		Teaappraisal teaappraisal = new Teaappraisal();
		teaappraisal.setTeacherid(teacherid);
		teaappraisal.setPermission(1);
		List<Teaappraisal> list = teaAppraisalService.getTeaappraisalsByCondition(teaappraisal);
		Pager<Teaappraisal> pager = new Pager<Teaappraisal>(pageNum, 8, list);
		MyObject<Teaappraisal> myObject = new MyObject<Teaappraisal>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//teacher_list页面ajax请求教师列表
	@RequestMapping(value = "/teacher_list_ajax_teacherList")
	public void teacher_list_ajax_teacherList(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
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
		Pager<Teacher> pager = new Pager<Teacher>(pageNum, 12, list);
		MyObject<Teacher> myObject = new MyObject<Teacher>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
}
