<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>家教平台系统</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<link href="css/student.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/student_requirement.js"></script>
		<script type="text/javascript" src="js/area.js"></script>
  </head>

	<body style="overflow-y: scroll;" onload="myfunction();">
	<script>
 	var USER_PROVINCE = "${USER_PROVINCE}";
	var USER_CITY = "${USER_CITY}" 
  	</script>
		<div class="theTop">
			<div class="theTop_div1">
				<c:choose>
				<c:when test="${USER_ID!=null}">
					欢迎进入家教系统，<a href="toLogin">退出</a>
				</c:when>
				<c:otherwise>
					<c:choose><c:when test="${USER_ID!=null}">欢迎进入家教系统，<a href="toLogin">退出</a></c:when><c:otherwise><a href="toLogin">亲,请登录</a> <a href="toRegister">免费注册</a></c:otherwise></c:choose>
				</c:otherwise>
			</c:choose>
			</div>
			<div class="theTop_div2">
				全国投诉专线：12345678901</div>
		</div>
		<!-- 家教平台和导航 -->

		<div class="Top">
			<!-- 显示 “家教平台” -->
			<div class="top1">
				<img src="img/logo.png" />
				<div>
					<a href="toChooseCity">${USER_CITY }</a>
				</div>
			</div>
			<!-- 导航 -->
			<div class="nav">
				<ul>
				<li><a href="index">首&nbsp;&nbsp;页</a></li>
				<li><a href="toTeacher_list">教师库</a></li>
				<li><a href="toRequirement_list">学生库</a></li>
				<li><a href="">家教论坛</a></li>
				<li><a href="toPersonal">个人中心</a></li>
				</ul>
			</div>
		</div>
		<!--学生的个人中心界面-->
		<!-- 当前位置 -->
		<div class="nowplace">
			<div>&nbsp;当前位置:&nbsp;
				<a href="index">首页</a>
				<span> > </span>
				<a href="toTeacher_list">教师库</a>
				<span> > 预约教师</span>
			</div>
		</div>
		<!-- 主内容 -->
		<div class="main_div">
			<!-- 左板块 -->
			<div style="width:700px;height: 500px;margin: 0 auto;margin-top: 50px;">
				<form action="makeOrder" class="form-horizontal" method="post" onsubmit="return check();">
						<input type="text" name="studentid" value="${USER_ID}" class="hidden"/>
						<input type="text" name="permission" value="1" class="hidden" />
						<input type="text" name="teacherid" value="${teacherid}" class="hidden"/>
						<div class="form-group">
							<label class="col-sm-2 control-label">教师编号：</label>
							<div class="col-sm-10">
								<h5>${teacherid}</h5>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">辅导科目：</label>
							<div class="col-sm-10">
								<select class="form-control" id="course" name="course">
									<option value="请选择">请选择</option>
								</select>
							</div>
						</div>
						
						<input class="hidden" name="address" value="${USER_PROVINCE},${USER_CITY}"/>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">辅导地区：</label>
							<div class="col-sm-10">
								<select class="form-control" id="area" name="area">
									<option value="请选择">请选择</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">性别要求：</label>
							<div class="col-sm-10">
								<select class="form-control" id="sex" name="sex">
									<option value="请选择">请选择</option>
									<option value="男女">不限</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">薪酬待遇：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="price"
								name="price" required maxlength="100"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">详细情况：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="detail"
								name="detail" required="required" maxlength="100"/>
							</div>
						</div>
						<div style="margin: 0 auto;width: 100px;height: 40px">
							<input type="submit" class="btn btn-default"/>
						</div>
					</form>
				</div>
				</div>
	</body>

 
</html>
