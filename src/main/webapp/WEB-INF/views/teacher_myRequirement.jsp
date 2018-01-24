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
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/teacher_myRequirement.js"></script>
</head>
<body style="overflow-y: scroll;">

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
			&nbsp;当前位置:&nbsp; <a href="">首页</a> <span> > </span> <a href="">教师中心</a>
			<span> > 我的订单</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="left_div">
			<div class="left_div_div">
				<div class="left_div_img1"></div>
				<ul>
					<li><a href="">我的订单</a></li>
					<li><a href="">我的预约</a></li>
					<li><a href="">我的学生</a></li>
					<li><a href="">我的评价</a></li>
				</ul>
				<div class="left_div_img2"></div>
				<ul>
					<li><a href="">基本资料</a></li>
					<li><a href="">修改密码</a></li>
				</ul>
			</div>
		</div>
		<!-- 右板块 -->
		<div class="right_div">
			<div class="right_div_div1">我的订单</div>
			<div class="right_div_div2">
				<div class="right_div_div2_div1">
					<a href="javascript:void(0);" id="bottom_1"
						name="bottom_1">审核中</a> <a href="javascript:void(0);"
						id="bottom_2" name="bottom_2">未通过</a>
						<a href="javascript:void(0);"
						id="bottom_3" name="bottom_3">已完成</a>
				</div>
				<div class="right_div_div2_div2" id="bottom_1_div">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">订单号</th>
								<th style="text-align: center;">辅导科目</th>
								<th style="text-align: center;">时间</th>
								<th style="text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<tr>
								<td><a href="">123</a></td>
								<td>Bangalore</td>
								<td>2018-01-19 10：34：30</td>
								<td><a href="" class="label label-danger">取消</a></td>
							</tr>
							<tr>
								<td><a href="">456</a></td>
								<td>Pune</td>
								<td>411027</td>
								<td><a href="" class="label label-danger">取消</a></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="right_div_div2_div2" id="bottom_2_div">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">订单号</th>
								<th style="text-align: center;">辅导科目</th>
								<th style="text-align: center;">时间</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<tr>
								<td>123</td>
								<td>Bangalore</td>
								<td>2Bangalore</td>
							</tr>
							<tr>
								<td>456</td>
								<td>Pune</td>
								<td>411027</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="right_div_div2_div2" id="bottom_3_div">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">订单号</th>
								<th style="text-align: center;">辅导科目</th>
								<th style="text-align: center;">时间</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<tr>
								<td>123</td>
								<td>Bangalore</td>
								<td>2018-01-19</td>
							</tr>
							<tr>
								<td>456</td>
								<td>Pune</td>
								<td>411027</td>
							</tr>
						</tbody>
					</table>
				</div>


			</div>
		</div>
	</div>
</body>


</html>
