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
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/teacher_detail.js"></script>
</head>


<body style="overflow-y: scroll;">
<script>
	var teacherid = '${teacher.id}';
	if('${message}'!=""){
	alert('${message}');
	}
</script>
	<div class="theTop">
		<div class="theTop_div1">
			<a href="">亲,请登录</a> <a href="">免费注册</a>
		</div>
		<div class="theTop_div2">全国投诉专线：12345678901</div>
	</div>
	<!-- 家教平台和导航 -->

	<div class="Top">
		<!-- 显示 “家教平台” -->
		<div class="top1">
			<img src="img/logo.png" />
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
		<div>
			&nbsp;当前位置:&nbsp; <a href="index">首页</a> <span> > </span> <a href="toTeacher_list">教师库</a>
			<span> > 教师信息</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="teacher_info">
			<div class="teacher_info_div">
				<div class="teacher_info_div_left">
					<img src="${teacher.photo}" />
					<c:choose>
						<c:when test="${USER_TYPE=='教师' }">
						
						</c:when>
						<c:otherwise>
							<div>
								<a href="toMakeOrder?teacherid=${teacher.id}">预约教师</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="teacher_info_div_right">
					<div class="teacher_info_div_right_top">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>教师编号：</th>
									<td>${teacher.id}</td>
								</tr>
								<tr>
									<th>教师姓名：</th>
									<td>${teacher.name}</td>
								</tr>
								<tr>
									<th>教师性别：</th>
									<td>${teacher.sex}</td>
								</tr>
								<tr>
									<th>教师年龄：</th>
									<td>${teacher.age}</td>
								</tr>
								<tr>
									<th>辅导课程：</th>
									<td>${teacher.courses}</td>
								</tr>
								<tr>
									<th>辅导地区：</th>
									<td>${teacher.area}</td>
								</tr>
								<tr>
									<th>期望工资：</th>
									<td>${teacher.price}</td>
								</tr>
								<tr>
									<th>登录时间：</th>
									<td>${teacher.logintime.toLocaleString()}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="teacher_info_div_right_bottom">
						<div class="teacher_info_div_right_bottom_div1">
							<a href="javascript:void(0);" id="bottom_record" name="bottom_record">家教记录</a> 
							<a href="javascript:void(0);" id="bottom_appraisal" name="bottom_appraisal">学生评价</a>
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
							<div id="finish_nav">
							
							</div>
							
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
							<div id="appraisalMe_nav">
							
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>
