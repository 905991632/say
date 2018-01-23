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
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/alterInfo.js"></script>
<script src="js/area.js"></script>
<script src="js/select.js"></script>
</head>
<body style="overflow-y: scroll;" onload="myfunction()">
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
			&nbsp;当前位置:&nbsp; <a href="">首页</a> <span> > </span> <a href="">学生中心</a>
			<span> > 基本资料</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="left_div">
			<div class="left_div_div">
				<div class="left_div_img1"></div>
				<ul>
					<li><a href="toStudent_requirement">发布家教信息</a></li>
					<li><a href="">我的订单</a></li>
					<li><a href="">我的预约</a></li>
					<li><a href="">我的教师</a></li>
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
		<div class="right_div1">
			<div class="right_div_div1">基本资料</div>
			<div class="right_div_div2">
				<div class="right_div_div2_div2" id="right_bottom_record">
					<img src="img/student.jpg" />
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>学生编号：</th>
								<td>11111</td>
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
								<th>联系方式：</th>
								<td>22</td>
							</tr>
							<tr>
								<th>家庭住址：</th>
								<td>22</td>
							</tr>
							<tr>
								<th>登录时间：</th>
								<td>2018-01-18 12:00:00</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="right_div_div2_div2" id="right_bottom_appraisal">
					<img src="img/student.jpg" />
					<form action="" class="form-horizontal" method="post" enctype="multipart/form-data">
						<div class="form-group">
    						<label class="col-sm-2 control-label">修改头像：</label>
    					<input type="file" id="inputfile" name="photo">
  						</div>
  						
						<div class="form-group">
							<label class="col-sm-2 control-label">学生姓名：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name"
								name="name"	placeholder="请输入名字" required>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">学生性别：</label>
							<div class="radio-inline">
								<label> <input type="radio" name="sex"
									id="optionsRadios1" value="男" checked> 男
								</label>
							</div>
							<div class="radio-inline">
								<label> <input type="radio" name="sex"
									id="optionsRadios2" value="女"> 女
								</label>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">学生年龄：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="age"
								 name="age" placeholder="请输入年龄" required>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">联系方式：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="mobile"
								name="mobile" placeholder="请输入手机号码">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">家庭住址：</label>
							<div class="col-sm-10">
							<select class="form-control" name="province" id="province">
								<option value="请选择">请选择</option>
							</select>
							<select class="form-control" name="city" id="city">
								<option value="请选择">请选择</option>
							</select>
							<select class="form-control" name="area" id="area">
								<option value="请选择">请选择</option>
							</select>
							</div>
						</div>
						
						 <button type="submit" class="btn btn-default">提交</button>
					</form>
				</div>


				<div class="right_div_alterInfo">
					<a href="javascript:void(0);" id="bottom_record"
						name="bottom_record">修改基本资料</a>
				</div>


			</div>

		</div>
	</div>
</body>


</html>
