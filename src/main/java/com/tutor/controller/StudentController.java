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
import com.tutor.dto.MyTeacher;
import com.tutor.dto.MyselfUtils;
import com.tutor.dto.Pager;
import com.tutor.dto.ResponseUtils;
import com.tutor.entity.Apply;
import com.tutor.entity.Requirement;
import com.tutor.entity.Stuappraisal;
import com.tutor.entity.Student;
import com.tutor.entity.Teaappraisal;
import com.tutor.service.ApplyService;
import com.tutor.service.RequirementService;
import com.tutor.service.StuAppraisalService;
import com.tutor.service.StudentService;
import com.tutor.service.TeaAppraisalService;
import com.tutor.service.TeacherService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	@Autowired
	RequirementService requirementService;
	@Autowired
	ApplyService applyService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	TeaAppraisalService teaAppraisalService;
	@Autowired
	StuAppraisalService stuAppraisalService;
	
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
	
	// 前往学生详细资料页面
	@RequestMapping(value = "toStudent_detail")
	public String toStudent_detail(int id,HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!=null){
			return "Login";
		}
		modelMap.addAttribute("student", studentService.selectByPrimaryKey(id));
		return "student_detail";
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
			String filePath=request.getSession().getServletContext().getRealPath("/")+"images/student/photo/";
			File targetFile = new File(filePath, fileName);
			try {
                file.transferTo(targetFile); // 传送 失败就抛异常
            } catch (Exception e) {
                e.printStackTrace();
            }
			student.setPhoto("images/student/photo/"+fileName);
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
	public String toStudent_myTeacher(int pageNum, HttpServletRequest request, ModelMap modelMap) {
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setStudentid(studentid);
		apply.setPermission(1);
		List<MyTeacher> myTeachers = teacherService.getMyTeachersByApply(apply);
		Pager<MyTeacher> pager =new Pager<MyTeacher>(pageNum,8,myTeachers);
		modelMap.addAttribute("myTeachers", pager.getDataList());
		modelMap.addAttribute("pageNum", pageNum);
		modelMap.addAttribute("totalPage", pager.getTotalPage());
		return "student_myTeacher";
	}
	
	//评价老师
	@RequestMapping(value = "appraisalTeacher")
	public String appraisalTeacher(Teaappraisal teaappraisal ,HttpServletRequest request, ModelMap modelMap) {
		int applyid = teaappraisal.getApplyid();
		Teaappraisal teaappraisal2 = teaAppraisalService.getTeaappraisalByApplyid(applyid);
		int id = teaappraisal2.getId();
		teaappraisal.setId(id);
		teaappraisal.setPermission(1);
		teaappraisal.setCreatetime(new Date());
		teaAppraisalService.toAppraisal(teaappraisal);
		return "redirect:toStudent_myTeacher?pageNum=1";
	}
	
	// 前往学生中心我的评价页面
	@RequestMapping(value = "toStudent_appraisal")
	public String toStudent_appraisal(HttpServletRequest request, ModelMap modelMap) {
		return "student_appraisal";
	}

	// 前往学生中心我的预约页面
	@RequestMapping(value = "toStudent_myOrder")
	public String toStudent_myOrder(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
		return "student_myOrder";
	}

	// 前往学生修改密码页面
	@RequestMapping(value = "toStudent_alterPassword")
	public String toTeacher_alterPassword(HttpServletRequest request, ModelMap modelMap) {
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
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
		if(MyselfUtils.isLogin(request)!= null){
			return "Login";
		}
		return "student_myRequirement";
	}
	
	//student_myRequirement页面ajax请求未完成订单数据
	@RequestMapping(value = "/student_myRequirement_ajax_getUnfinish")
    public void student_myRequirement_ajax_getUnfinish(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Requirement requirement = new Requirement();
		requirement.setStudentid(studentid);
		requirement.setPermission(0);
		List<Requirement> list1 = requirementService.getRequirementsByCondition(requirement);
		Pager<Requirement> Requirementspager1 = new Pager<Requirement>(pageNum, 8, list1);
		List<Requirement> dataList = Requirementspager1.getDataList();
		int totalPage = Requirementspager1.getTotalPage();
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(dataList);
		myObject.setTotalPage(totalPage);
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
    }
	
	//student_myRequirement页面ajax请求完成订单数据
	@RequestMapping(value = "/student_myRequirement_ajax_getFinish")
    public void student_myRequirement_ajax_getFinish(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setStudentid(studentid);
		apply.setPermission(3);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		List<Requirement> list2 = requirementService.getRequirementByApply(list);
		Pager<Requirement> Requirementspager = new Pager<Requirement>(pageNum, 8, list2);
		List<Requirement> dataList = Requirementspager.getDataList();
		int totalPage = Requirementspager.getTotalPage();
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(dataList);
		myObject.setTotalPage(totalPage);
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
    }	
	
	//student_myRequirement页面ajax请求申请情况
	@RequestMapping(value = "/student_myRequirement_ajax_getApply")
	public void student_myRequirement_ajax_getApply(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		int requireid = Integer.parseInt(request.getParameter("requireid"));
		Apply apply = new Apply();
		apply.setStudentid(studentid);
		apply.setRequireid(requireid);
		apply.setPermission(0);
		apply.setType("订单");
		List<Apply> applies = applyService.getAppliesByCondition(apply);
		Pager<Apply> pager = new Pager<Apply>(pageNum, 8, applies);
		MyObject<Apply> myObject = new MyObject<Apply>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//student_myRequirement页面ajax拒绝申请操作
	@RequestMapping(value = "/student_myRequirement_ajax_reject")
	public void student_myRequirement_ajax_reject(HttpServletRequest request, HttpServletResponse response) {
		int applyid = Integer.parseInt(request.getParameter("applyid"));
		Apply apply = new Apply();
		apply.setId(applyid);
		apply.setPermission(2);
		int result = applyService.updateByPrimaryKeySelective(apply);
		String result1 = JSON.toJSONString(result);
		ResponseUtils.renderJson(response,result1);
	}
	
	//student_myRequirement页面ajax接受申请操作
	@RequestMapping(value = "/student_myRequirement_ajax_accept")
	public void student_myRequirement_ajax_accept(HttpServletRequest request, HttpServletResponse response) {
		int applyid = Integer.parseInt(request.getParameter("applyid"));
		int result = applyService.acceptApply(applyid);
		String result1 = JSON.toJSONString(result);
		ResponseUtils.renderJson(response,result1);
	}	
	
	//student_myRequirement页面ajax取消家教信息操作
	@RequestMapping(value = "/student_myRequirement_ajax_cancel")
	public void student_myRequirement_ajax_cancel(HttpServletRequest request, HttpServletResponse response) {
		int requireid = Integer.parseInt(request.getParameter("requireid"));
		int result = requirementService.cancelRequirement(requireid);
		String result1 = JSON.toJSONString(result);
		ResponseUtils.renderJson(response,result1);
	}		
	
	//student_appraisal页面ajax请求评价我的
	@RequestMapping(value = "/student_appraisal_ajax_appraisalMe")
	public void student_appraisal_ajax_appraisalMe(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Stuappraisal stuappraisal = new Stuappraisal();
		stuappraisal.setStudentid(studentid);
		stuappraisal.setPermission(1);
		List<Stuappraisal> list = stuAppraisalService.getStuappraisalsByCondition(stuappraisal);
		Pager<Stuappraisal> pager = new Pager<Stuappraisal>(pageNum, 8, list);
		MyObject<Stuappraisal> myObject = new MyObject<Stuappraisal>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//student_appraisal页面ajax请求我的评价
	@RequestMapping(value = "/student_appraisal_ajax_myAppraisal")
	public void student_appraisal_ajax_myAppraisal(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Teaappraisal teaappraisal = new Teaappraisal();
		teaappraisal.setStudentid(studentid);
		teaappraisal.setPermission(1);
		List<Teaappraisal> list = teaAppraisalService.getTeaappraisalsByCondition(teaappraisal);
		Pager<Teaappraisal> pager = new Pager<Teaappraisal>(pageNum, 8, list);
		MyObject<Teaappraisal> myObject = new MyObject<Teaappraisal>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//student_myOrder页面ajax请求预约中
	@RequestMapping(value = "/student_myOrder_ajax_order")
	public void student_myOrder_ajax_order(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setStudentid(studentid);
		apply.setType("预约");
		apply.setPermission(0);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		Pager<Apply> pager = new Pager<Apply>(pageNum, 8, list);
		MyObject<Apply> myObject = new MyObject<Apply>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}	
	
	//student_myOrder页面ajax请求未通过
	@RequestMapping(value = "/student_myOrder_ajax_reject")
	public void student_myOrder_ajax_reject(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int studentid = (int)request.getSession().getAttribute("USER_ID");
		Apply apply = new Apply();
		apply.setStudentid(studentid);
		apply.setType("预约");
		apply.setPermission(2);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		Pager<Apply> pager = new Pager<Apply>(pageNum, 8, list);
		MyObject<Apply> myObject = new MyObject<Apply>();
		myObject.setList(pager.getDataList());
		myObject.setTotalPage(pager.getTotalPage());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}
	
	//student_myOrder页面ajax取消预约
	@RequestMapping(value = "/student_myOrder_ajax_cancel")
	public void student_myOrder_ajax_cancel(int id,HttpServletRequest request, HttpServletResponse response) {
		Apply apply = new Apply();
		apply.setId(id);
		apply.setPermission(2);
		int result = applyService.updateByPrimaryKeySelective(apply);
		ResponseUtils.renderJson(response,JSON.toJSONString(result));
	}
	
	//student_detail页面ajax请求完成订单数据
	@RequestMapping(value = "/student_detail_ajax_getFinish")
    public void student_detail_ajax_getFinish(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		int studentid = Integer.parseInt(request.getParameter("studentid"));
		Apply apply = new Apply();
		apply.setStudentid(studentid);
		apply.setPermission(3);
		List<Apply> list = applyService.getAppliesByCondition(apply);
		List<Requirement> list2 = requirementService.getRequirementByApply(list);
		Pager<Requirement> Requirementspager = new Pager<Requirement>(pageNum, 8, list2);
		List<Requirement> dataList = Requirementspager.getDataList();
		int totalPage = Requirementspager.getTotalPage();
		MyObject<Requirement> myObject = new MyObject<Requirement>();
		myObject.setList(dataList);
		myObject.setTotalPage(totalPage);
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
    }	
	
	//student_appraisal页面ajax请求评价我的
	@RequestMapping(value = "/student_detail_ajax_appraisalMe")
	public void student_detail_ajax_appraisalMe(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int studentid = Integer.parseInt(request.getParameter("studentid"));
		Stuappraisal stuappraisal = new Stuappraisal();
		stuappraisal.setStudentid(studentid);
		stuappraisal.setPermission(1);
		List<Stuappraisal> list = stuAppraisalService.getStuappraisalsByCondition(stuappraisal);
		Pager<Stuappraisal> pager = new Pager<Stuappraisal>(pageNum, 8, list);
		MyObject<Stuappraisal> myObject = new MyObject<Stuappraisal>();
		myObject.setTotalPage(pager.getTotalPage());
		myObject.setList(pager.getDataList());
		String result = JSON.toJSONString(myObject);
		ResponseUtils.renderJson(response,result);
	}	
	
	
	
	
}
