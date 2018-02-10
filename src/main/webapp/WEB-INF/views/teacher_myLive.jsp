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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/student.css" rel="stylesheet" type="text/css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body style="overflow-y: scroll;">
	<div class="theTop">
		<div class="theTop_div1">
			<c:choose>
				<c:when test="${USER_ID!=null}">欢迎进入家教系统，<a href="toLogin">退出</a>
				</c:when>
				<c:otherwise>
					<a href="toLogin">亲,请登录</a>
					<a href="toRegister">免费注册</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="theTop_div2">全国投诉专线：12345678901</div>
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
				<li><a href="toLiveRoomList?pageNum=1">老师直播间</a></li>
				<li><a href="toPersonal">个人中心</a></li>
			</ul>
		</div>
	</div>
	<!--学生的个人中心界面-->
	<!-- 当前位置 -->
	<div class="nowplace">
		<div>
			&nbsp;当前位置:&nbsp; <a href="index">首页</a> <span> > </span> <a
				href="toPersonal">教师中心</a> <span> > 我的直播</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="left_div">
			<div class="left_div_div">
				<div class="left_div_img1"></div>
				<ul>
					<li><a href="toTeacher_myRequirement">我的订单</a></li>
					<li><a href="toTeacher_myOrder">我的预约</a></li>
					<li><a href="toTeacher_myStudent?pageNum=1">我的学生</a></li>
					<li><a href="toTeacher_appraisal">我的评价</a></li>
					<li><a href="toTeacher_myLive">我的直播间</a></li>
				</ul>
				<div class="left_div_img2"></div>
				<ul>
					<li><a href="toTeacher_info">基本资料</a></li>
					<li><a href="toTeacher_alterPassword">修改密码</a></li>
				</ul>
			</div>
		</div>
		<!-- 右板块 -->
		<div class="right_div">
			<div class="right_div_div1">我的直播</div>
			<c:if test="${statues==0}">
				<div style="width: 500px;height: 300px;margin: 0 auto;text-align: center;font-family: '微软雅黑';font-size: 20px; ">
					<span style="line-height: 280px;">个人信息通过审核才能申请直播间</span>
				</div>
			</c:if>				
			<c:if test="${statues==1}">
				<div style="width: 500px;height: 200px;margin: 0 auto;text-align: center;font-family: '微软雅黑';font-size: 20px; ">
					<div style="margin-top: 120px;">
					<form action="teacher_myLive" method="post">
						<input type="submit" class="btn btn-default" value="一键申请">
					</form>
					</div>
				</div>
			</c:if>
			<c:if test="${statues==2}">
				<div style="width: 500px;height: 300px;margin: 0 auto;text-align: center;font-family: '微软雅黑';font-size: 20px; ">
					<span style="line-height: 280px;">直播间申请中，请耐性等候</span>
				</div>
			</c:if>
			<c:if test="${statues==3}">
			<div style="width: 600px;height: 250px;margin: 0 auto;text-align: center;font-family: '微软雅黑';font-size: 16px; ">
				<div style="margin-top: 120px;">
				<form action="teacherToLiveRoom/${tutorLive.teacherid}" method="post">
					<div class="form-group">
						<span class="col-sm-2 control-label">直播流：</span>
						<span class="col-sm-2 control-label" style="width: 450px;">${tutorLive.rtmpurl}</span>
					</div>

					<div class="form-group">
						<span class="col-sm-2 control-label">流秘钥：</span>
						<span class="col-sm-2 control-label" style="width: 450px;">${tutorLive.rtmpkey}</span>
					</div>
					<input type="submit" class="btn btn-default" style="margin-top: 20px;" value="进入我的直播">
				</form>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</body>


</html>
