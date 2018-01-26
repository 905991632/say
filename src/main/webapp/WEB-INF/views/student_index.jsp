<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link href="css/student.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.8.3.min.js"></script>
  </head>
	<body style="overflow-y: scroll;">
	<script>
	if('${message}'!=""){
	alert('${message}');
	}
  	</script>
		
	<div class="theTop">
		<div class="theTop_div1">
			<a href="">亲,请登录</a> <a href="">免费注册</a>
		</div>
		<div class="theTop_div2">
			全国投诉专线：12345678901</div>
	</div>
		<!-- 家教平台和导航 -->
		
		<div class="Top">
			<!-- 显示 “家教平台” -->
			<div class="top1">
				<img src="img/logo.png"/>
				<div>
					<span>中山</span>
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
				<a href="">首页</a>
				<span> > 学生中心</span>
			</div>
		</div>
		<!-- 主内容 -->
		<div class="main_div">
			<!-- 左板块 -->
			<div class="left_div">
				<div class="left_div_div">
					<div class="left_div_img1"></div>
					<ul>
						<li>
							<a href="toStudent_requirement">发布家教信息</a>
						</li>
						<li>
							<a href="toStudent_myRequirement">我的订单</a>
						</li>
						<li>
							<a href="">我的预约</a>
						</li>
						<li>
							<a href="">我的教师</a>
						</li>
						<li>
							<a href="">我的评价</a>
						</li>
					</ul>
					<div class="left_div_img2"></div>
					<ul>
						<li>
							<a href="toStudent_info">基本资料</a>
						</li>
						<li>
							<a href="toStudent_alterPassword">修改密码</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 右板块 -->
			<div class="right_div">
				<div class="right_div_div1">个人中心</div>
					<img src="img/personal_index.png" />
			</div>
		</div>
	</body>

 
</html>
