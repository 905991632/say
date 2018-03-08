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
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/student.css" rel="stylesheet" type="text/css" />
<link href="css/multi-select.css" rel="stylesheet">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/alterInfo.js"></script>
<script src="js/area.js"></script>
<script src="js/teacher_info.js"></script>
<script src="js/jquery.multi-select.js"></script>

<script>
	var USER_PROVINCE = "${USER_PROVINCE}";
	var USER_CITY = "${USER_CITY}"
</script>

</head>
<body style="overflow-y: scroll;" onload="myfunction()">
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
				href="toPersonal">教师中心</a> <span> > 基本资料</span>
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
		<div class="right_div1">
			<div class="right_div_div1">基本资料</div>
			<div class="right_div_div2">
				<div class="right_div_div2_div2" id="right_bottom_record">
					<img src="${teacher.photo}" />
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
								<th>联系方式：</th>
								<td>${teacher.mobile}</td>
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
								<th>期待薪酬：</th>
								<td>${teacher.price}</td>
							</tr>
							<tr>
								<th>登录时间：</th>
								<td>${teacher.logintime.toLocaleString()}</td>
							</tr>
							<tr>
								<th>认证状态：</th>
								<td>
									<c:if test="${teacher.permission==0}">
									未通过认证
									</c:if>
									<c:if test="${teacher.permission==1}">
									已通过认证
									</c:if>
									<c:if test="${teacher.permission==2}">
									正在审核
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="right_div_div2_div2" id="right_bottom_appraisal">
					<img src="${teacher.photo}" />
					<form action="teacher_info" class="form-horizontal"
						enctype="multipart/form-data" method="post" onsubmit="return formcheck();">
						<input class="hidden" name="id" value="${teacher.id}">
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证：</label> <input
								type="file" id="inputfile1" name="file" onblur="photocheck1();">
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">修改头像：</label> <input
								type="file" id="inputfile2" name="file" onblur="photocheck2();">
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">教师姓名：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name" name="name"
									value="${teacher.name}" required>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">教师性别：</label>
							<c:choose>
								<c:when test="${teacher.sex=='男'}">
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
								</c:when>
								<c:otherwise>
									<div class="radio-inline">
										<label> <input type="radio" name="sex"
											id="optionsRadios1" value="男"> 男
										</label>
									</div>
									<div class="radio-inline">
										<label> <input type="radio" name="sex"
											id="optionsRadios2" value="女" checked> 女
										</label>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">教师年龄：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="age" name="age"
									value="${teacher.age}" required>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">联系方式：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="mobile"
									name="mobile" value="${teacher.mobile}">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">辅导课程：</label>
							<div class="col-sm-10">
								<select id="courses" multiple='multiple' required>
								</select>
							</div>
							<input class="hidden" id="courses_value" name="courses" />
						</div>

						<input class="hidden" type="text" name="address"
							value="${USER_PROVINCE},${USER_CITY}" />

						<div class="form-group">
							<label class="col-sm-2 control-label">辅导地区：</label>
							<div class="col-sm-10">
								<select id="area" multiple='multiple' required>
								</select>
							</div>
							<input class="hidden" id="area_value" name="area" />
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">期待薪酬：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="price" name="price"
									value="${teacher.price}">
							</div>
						</div>

						<input type="submit" class="btn btn-default" value="提交">
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