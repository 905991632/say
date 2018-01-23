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
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery-1.8.3.min.js"></script>
  </head>

	<body style="overflow-y: scroll;">

		<div class="theTop">
			<div class="theTop_div1">
				<a href="">亲,请登录</a>
				<a href="">免费注册</a>
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
				<span> > </span>
				<a href="">学生库</a>
				<span> > 订单详情</span>
			</div>
		</div>
		<!-- 主内容 -->
		<div class="main_div">
			<!-- 左板块 -->
			<div class="requirement_info_div">
				<div>
				<form action="" method="post">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th>订单编号：</th>
							<td style="width: 400px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">
								${requirement.id}
							</td>
						</tr>
						<tr>
							<th>辅导课程：</th>
							<td>
								${requirement.course}
							</td>
						</tr>
						<tr>
							<th>性别要求：</th>
							<td>
							<c:choose>
								<c:when test="${requirement.sex=='男女'}">
									不限
								</c:when>
								<c:otherwise>
									${requirement.sex}
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th>辅导地区：</th>
							<td>
								${requirement.area}
							</td>
						</tr>
						<tr>
							<th>薪资报酬：</th>
							<td>
								${requirement.price}
							</td>
						</tr>
						<tr>
							<th>其他要求：</th>
							<td>
								${requirement.detail}
							</td>
						</tr>
						<tr>
							<th>学生编号：</th>
							<td>
								<a href="">${requirement.studentid}</a>
							</td>
						</tr>
						<tr>
							<th>创建时间：</th>
							<td>
								${requirement.createtime.toLocaleString()}
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<input type="submit" value="订单申请" />
							</td>
						</tr>
					</tbody>
				</table>
				</form>
				</div>
			</div>
		</div>
	</body>

 
</html>
