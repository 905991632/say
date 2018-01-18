package com.tutor.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.tutor.dto.LoadJson;
import com.tutor.entity.Login;
import com.tutor.entity.Requirement;
import com.tutor.entity.Student;
import com.tutor.entity.Teacher;
import com.tutor.service.LoginService;
import com.tutor.service.RequirementService;
import com.tutor.service.StudentService;
import com.tutor.service.TeacherService;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	@Autowired
	StudentService studentService;

	@Autowired
	TeacherService teacherService;

	@Autowired
	RequirementService requirementService;

	@RequestMapping(value = "/toChooseCity")
	public String toChooseCity(HttpServletRequest request, ModelMap model) {
		return "chooseCity";
	}
	
	
	
	
	// 选择城市
	@RequestMapping(value = "/chooseCity")
	public String chooseCity(@ModelAttribute("province") String province ,@ModelAttribute("city") String city ,HttpServletRequest request, ModelMap model) {
		request.getSession().setAttribute("USER_PROVINCE", province);
		request.getSession().setAttribute("USER_CITY", city);
		return "redirect:index";
	}

	// 前往首页
	@RequestMapping(value = "/")
	public String index1(HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		} else {
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
			model.addAttribute("teacherList", teacherList);
			model.addAttribute("requirementsList", requirementsList);
			return "index";
		}
	}

	// 前往首页
	@RequestMapping(value = "/index")
	public String index2(HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute("USER_PROVINCE") == null
				&& request.getSession().getAttribute("USER_CITY") == null) {
			return "chooseCity";
		} else {
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
			model.addAttribute("teacherList", teacherList);
			model.addAttribute("requirementsList", requirementsList);
			return "index";
		}
	}

	// 去分类导航
	@RequestMapping(value = "/toIndex3")
	public String toIndex3(HttpServletRequest request, ModelMap model) {
		Student student = new Student();
		if (request.getParameter("name") != null) {
			student.setName(request.getParameter("name"));
		}
		if (request.getParameter("sex") != null) {
			student.setSex(request.getParameter("sex"));
		}
		if (request.getParameter("age") != null) {
			student.setAge(Integer.parseInt(request.getParameter("age")));
		}
		List<Student> students = studentService.getStudentByCondition(student);
		model.addAttribute("students", students);
		return "index3";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 跳转注册页面
	@RequestMapping(value = "/toRegister")
	public String toRegister(HttpServletRequest request, ModelMap model) {
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		return "Register";
	}

	// 跳转登录页面
	@RequestMapping(value = "/toLogin")
	public String toLogin(HttpServletRequest request, ModelMap model) {
		return "Login";
	}

	// 判断用户是否存在
	@ResponseBody
	@RequestMapping(value = "/isUsernameExist")
	public String isUsernameExist(String username) {
		boolean flag = loginService.isUserNameExist(username);
		if (flag) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 前往注册协议
	@RequestMapping(value = "/toAgreement")
	public String toAgreement(HttpServletRequest request, ModelMap model) {
		return "Agreement";
	}

	// 添加Login信息并添加个人信息表
	@RequestMapping(value = "/Registert")
	public String Registert(Login login, Teacher teacher, HttpServletRequest request, ModelMap model) {
		// 获取本机省市地址
		LoadJson loadJson = new LoadJson();
		String json = loadJson.LoadJson("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=");
		if (json.equals("error")) {
			return "page_404";
		} else {
			JSONObject jsonObject = JSONObject.parseObject(json);
			String province = jsonObject.get("province").toString();
			String city = jsonObject.get("city").toString();
			// 获取用户类型
			login.setUsertype("教师");
			int loginId, id;
			id = loginService.addUser(login);
			loginId = login.getId();
			if (id != 1) {
				return "page_404";
			} else {
				teacher.setLoginid(Integer.valueOf(loginId));
				teacher.setLogintime(new Date());
				teacher.setAddress(province + "," + city);
				teacher.setPhoto("images/photo/teacher.jpg");
				teacher.setPermission(0);
				if (teacherService.addTeacher(teacher) != 1) {
					return "page_404";
				} else {
					model.addAttribute("Register_message", "注册成功");
					return "Register";
				}
			}
		}
	}

	// 添加Login信息并添加个人信息表
	@RequestMapping(value = "/Registers")
	public String Registers(Login login, Student student, HttpServletRequest request, ModelMap model) {
		// 获取本机省市地址
		LoadJson loadJson = new LoadJson();
		String json = loadJson.LoadJson("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=");
		if (json.equals("error")) {
			return "page_404";
		} else {
			JSONObject jsonObject = JSONObject.parseObject(json);
			String province = jsonObject.get("province").toString();
			String city = jsonObject.get("city").toString();
			// 获取用户类型
			login.setUsertype("学生");
			int loginId, id;
			id = loginService.addUser(login);
			loginId = login.getId();
			if (id != 1) {
				return "page_404";
			} else {
				student.setLoginid(Integer.valueOf(loginId));
				student.setAddress(province + "," + city);
				student.setPhoto("images/photo/student.jpg");
				student.setLogintime(new Date());
				if (studentService.addStudent(student) < 1) {
					return "page_404";
				} else {
					model.addAttribute("Register_message", "注册成功");
					return "Register";
				}
			}
		}
	}

	// 跳转登录页面
	@RequestMapping(value = "/Login")
	public String Login(Login login, HttpServletRequest request, ModelMap model) {
		int USER_ID;// 学生表或者老师表的id
		String USER_ADDRESS, USER_PROVINCE, USER_CITY;
		List<Login> loginList = loginService.toLogin(login);
		if (loginList.size() != 1) {
			model.addAttribute("login_message", "用户名或密码错误！！");
			return "Login";
		} else {
			int id = loginList.get(0).getId();
			if (login.getUsertype().equals("学生")) {
				List<Student> student = studentService.getStudentByForeignKey(id);
				student.get(0).setLogintime(new Date());
				USER_ID = student.get(0).getId();
				USER_ADDRESS = student.get(0).getAddress();
				student.get(0).setLogintime(new Date());
				studentService.updateByPrimaryKeySelective(student.get(0));
			} else {
				List<Teacher> teacher = teacherService.getTeacherByForeignKey(id);
				USER_ID = teacher.get(0).getId();
				USER_ADDRESS = teacher.get(0).getAddress();
				teacher.get(0).setLogintime(new Date());
				teacherService.updateByPrimaryKeySelective(teacher.get(0));
			}
			String[] address = USER_ADDRESS.split(",");
			USER_PROVINCE = address[0];
			USER_CITY = address[1];
			request.getSession().setAttribute("USER_ID", USER_ID);
			request.getSession().setAttribute("USER_TYPE", login.getUsertype());
			model.addAttribute("province", USER_PROVINCE);
			model.addAttribute("city", USER_CITY);
			return "chooseCity";
		}
	}

}
