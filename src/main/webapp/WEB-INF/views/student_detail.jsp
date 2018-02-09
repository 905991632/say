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

<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/student.css" rel="stylesheet" type="text/css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/student_detail.js"></script>
</head>


<body style="overflow-y: scroll;">
	<script>
		var studentid = '${student.id}';
	</script>
	<div class="theTop">
		<div class="theTop_div1">
			<c:choose>
				<c:when test="${USER_ID!=null}">
					欢迎进入家教系统，<a href="toLogin">退出</a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${USER_ID!=null}">欢迎进入家教系统，<a
								href="toLogin">退出</a>
						</c:when>
						<c:otherwise>
							<a href="toLogin">亲,请登录</a>
							<a href="toRegister">免费注册</a>
						</c:otherwise>
					</c:choose>
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
				<li><a href="">家教论坛</a></li>
				<li><a href="toPersonal">个人中心</a></li>
			</ul>
		</div>
	</div>
	<!--学生的个人中心界面-->
	<!-- 当前位置 -->
	<div class="nowplace">
		<div>
			&nbsp;当前位置:&nbsp; <a href="index">首页</a> <span> > </span> <a
				href="toRequirement_list">学生库</a> <span> > 学生信息</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="teacher_info">
			<div class="teacher_info_div">
				<div class="teacher_info_div_left">
					<img src="${student.photo}" />
				</div>
				<div class="teacher_info_div_right">
					<div class="teacher_info_div_right_top">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>学生编号：</th>
									<td>${student.id}</td>
								</tr>
								<tr>
									<th>学生姓名：</th>
									<td>${student.name}</td>
								</tr>
								<tr>
									<th>学生性别：</th>
									<td>${student.sex}</td>
								</tr>
								<tr>
									<th>学生年龄：</th>
									<td>${student.age}</td>
								</tr>
								<tr>
									<th>登录时间：</th>
									<td>${student.logintime.toLocaleString()}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="teacher_info_div_right_bottom">
						<div class="teacher_info_div_right_bottom_div1">
							<a href="javascript:void(0);" id="bottom_record"
								name="bottom_record">家教记录</a> <a href="javascript:void(0);"
								id="bottom_appraisal" name="bottom_appraisal">教师评价</a>
						</div>

						<div class="teacher_info_div_right_bottom_record"
							id="right_bottom_record" name="right_bottom_record">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align: center;">订单号</th>
										<th style="text-align: center;">辅导科目</th>
										<th style="text-align: center;">时间</th>
									</tr>
								</thead>
								<tbody style="text-align: center;" id="finish_tbody">

								</tbody>
							</table>
							<div id="finish_nav_insert"></div>
						</div>

						<div class="teacher_info_div_right_bottom_appraisal"
							id="right_bottom_appraisal" name="right_bottom_appraisal">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align: center;">学生编号</th>
										<th style="text-align: center;">评价内容</th>
										<th
											style="text-align: center;width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">星级</th>
										<th
											style="text-align: center;width: 180px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">时间</th>
									</tr>
								</thead>
								<tbody style="text-align: center;" id="appraisalMe">

								</tbody>
							</table>
							<div id="appraisalMe_nav"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>
