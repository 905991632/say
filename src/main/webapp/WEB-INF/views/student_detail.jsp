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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/teacher.js"></script>
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
				<li><a href="">首&nbsp;&nbsp;页</a></li>
				<li><a href="">教师库</a></li>
				<li><a href="">学生库</a></li>
				<!--<li><a href=""><span style="font-size:23px;font-family: '微软雅黑';">在线课堂</span></a></li>-->
				<li><a href="">家教论坛</a></li>
				<li><a href="">个人中心</a></li>
			</ul>
		</div>
	</div>
	<!--学生的个人中心界面-->
	<!-- 当前位置 -->
	<div class="nowplace">
		<div>
			&nbsp;当前位置:&nbsp; <a href="">首页</a> <span> > </span> <a href="">学生库</a>
			<span> > 学生信息</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="teacher_info">
			<div class="teacher_info_div">
				<div class="teacher_info_div_left">
					<img src="img/student.jpg" />
				</div>
				<div class="teacher_info_div_right">
					<div class="teacher_info_div_right_top">
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>学生编号：</th>
									<td>
										11111
									</td>
								</tr>
								<tr>
									<th>学生姓名：</th>
									<td>陈晓佳</td>
								</tr>
								<tr>
									<th>学生性别：</th>
									<td>男</td>
								</tr>
								<tr>
									<th>学生年龄：</th>
									<td>22</td>
								</tr>
								<tr>
									<th>登录时间：</th>
									<td>2018-01-18 12:00:00</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="teacher_info_div_right_bottom">
						<div class="teacher_info_div_right_bottom_div1">
							<a href="javascript:void(0);" id="bottom_record" name="bottom_record">家教记录</a> 
							<a href="javascript:void(0);" id="bottom_appraisal" name="bottom_appraisal">教师评价</a>
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
								<tbody style="text-align: center;">
									<tr>
										<td>Tanmay</td>
										<td>Bangalore</td>
										<td>560001</td>
									</tr>
									<tr>
										<td>Uma</td>
										<td>Pune</td>
										<td>411027</td>
									</tr>
								</tbody>
							</table>
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
								<tbody style="text-align: center;">
									<tr>
										<td
											style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">
											Tanmay</td>
										<td
											style="width: 180px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">
										</td>
										<td
											style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">
											560001</td>
										<td
											style="width: 180px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">
											560001</td>
									</tr>
									<tr>
										<td>Uma</td>
										<td>Pune</td>
										<td>411027</td>
										<td>560001</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>
