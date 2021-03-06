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
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/common.css">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/teacher_list.js"></script>
<script src="js/area.js"></script>
</head>
<script>
	var USER_PROVINCE = "${USER_PROVINCE}";
	var USER_CITY = "${USER_CITY}"
</script>

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
			&nbsp;当前位置:&nbsp; <a href="index">首页</a> <span> > 教师库 </span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="filter">
			<div class="container">
				<div class="box">
					<dl>
						<dt>辅导科目：</dt>

						<dd>
							<a href="javascript:void(0);" rel="" name="course" class="all on">全部</a>
							<div class="choose">
								<a href="javascript:void(0);" rel="一年级语文" name="course"
									class="sx_child">一年级语文</a> <a href="javascript:void(0);"
									rel="一年级数学" name="course" class="sx_child">一年级数学</a> <a
									href="javascript:void(0);" rel="一年级英语" name="course"
									class="sx_child">一年级英语</a> <a href="javascript:void(0);"
									rel="二年级语文" name="course" class="sx_child">二年级语文</a> <a
									href="javascript:void(0);" rel="二年级数学" name="course"
									class="sx_child">二年级数学</a> <a href="javascript:void(0);"
									rel="二年级英语" name="course" class="sx_child">二年级英语</a> <a
									href="javascript:void(0);" rel="三年级语文" name="course"
									class="sx_child">三年级语文</a> <a href="javascript:void(0);"
									rel="三年级数学" name="course" class="sx_child">三年级数学</a> <a
									href="javascript:void(0);" rel="三年级英语" name="course"
									class="sx_child">三年级英语</a> <a href="javascript:void(0);"
									rel="四年级语文" name="course" class="sx_child">四年级语文</a> <a
									href="javascript:void(0);" rel="四年级数学" name="course"
									class="sx_child">四年级数学</a> <a href="javascript:void(0);"
									rel="四年级英语" name="course" class="sx_child">四年级英语</a> <a
									href="javascript:void(0);" rel="五年级语文" name="course"
									class="sx_child">五年级语文</a> <a href="javascript:void(0);"
									rel="五年级数学" name="course" class="sx_child">五年级数学</a> <a
									href="javascript:void(0);" rel="五年级英语" name="course"
									class="sx_child">五年级英语</a> <a href="javascript:void(0);"
									rel="六年级语文" name="course" class="sx_child">六年级语文</a> <a
									href="javascript:void(0);" rel="六年级数学" name="course"
									class="sx_child">六年级数学</a> <a href="javascript:void(0);"
									rel="六年级英语" name="course" class="sx_child">六年级英语</a> <a
									href="javascript:void(0);" rel="初一语文" name="course"
									class="sx_child">初一语文</a> <a href="javascript:void(0);"
									rel="初一数学" name="course" class="sx_child">初一数学</a> <a
									href="javascript:void(0);" rel="初一英语" name="course"
									class="sx_child">初一英语</a> <a href="javascript:void(0);"
									rel="初一政治" name="course" class="sx_child">初一政治</a> <a
									href="javascript:void(0);" rel="初一历史" name="course"
									class="sx_child">初一历史</a> <a href="javascript:void(0);"
									rel="初一地理" name="course" class="sx_child">初一地理</a> <a
									href="javascript:void(0);" rel="初二语文" name="course"
									class="sx_child">初二语文</a> <a href="javascript:void(0);"
									rel="初二数学" name="course" class="sx_child">初二数学</a> <a
									href="javascript:void(0);" rel="初二英语" name="course"
									class="sx_child">初二英语</a> <a href="javascript:void(0);"
									rel="初二政治" name="course" class="sx_child">初二政治</a> <a
									href="javascript:void(0);" rel="初二历史" name="course"
									class="sx_child">初二历史</a> <a href="javascript:void(0);"
									rel="初二地理" name="course" class="sx_child">初二地理</a> <a
									href="javascript:void(0);" rel="初二生物" name="course"
									class="sx_child">初二生物</a> <a href="javascript:void(0);"
									rel="初二化学" name="course" class="sx_child">初二化学</a> <a
									href="javascript:void(0);" rel="初二物理" name="course"
									class="sx_child">初二物理</a> <a href="javascript:void(0);"
									rel="初三语文" name="course" class="sx_child">初三语文</a> <a
									href="javascript:void(0);" rel="初三数学" name="course"
									class="sx_child">初三数学</a> <a href="javascript:void(0);"
									rel="初三英语" name="course" class="sx_child">初三英语</a> <a
									href="javascript:void(0);" rel="初三政治" name="course"
									class="sx_child">初三政治</a> <a href="javascript:void(0);"
									rel="初三历史" name="course" class="sx_child">初三历史</a> <a
									href="javascript:void(0);" rel="初三地理" name="course"
									class="sx_child">初三地理</a> <a href="javascript:void(0);"
									rel="初三生物" name="course" class="sx_child">初三生物</a> <a
									href="javascript:void(0);" rel="初三化学" name="course"
									class="sx_child">初三化学</a> <a href="javascript:void(0);"
									rel="初三物理" name="course" class="sx_child">初三物理</a> <a
									href="javascript:void(0);" rel="高一语文" name="course"
									class="sx_child">高一语文</a> <a href="javascript:void(0);"
									rel="高一数学" name="course" class="sx_child">高一数学</a> <a
									href="javascript:void(0);" rel="高一英语" name="course"
									class="sx_child">高一英语</a> <a href="javascript:void(0);"
									rel="高一政治" name="course" class="sx_child">高一政治</a> <a
									href="javascript:void(0);" rel="高一历史" name="course"
									class="sx_child">高一历史</a> <a href="javascript:void(0);"
									rel="高一地理" name="course" class="sx_child">高一地理</a> <a
									href="javascript:void(0);" rel="高一生物" name="course"
									class="sx_child">高一生物</a> <a href="javascript:void(0);"
									rel="高一化学" name="course" class="sx_child">高一化学</a> <a
									href="javascript:void(0);" rel="高一物理" name="course"
									class="sx_child">高一物理</a> <a href="javascript:void(0);"
									rel="高二语文" name="course" class="sx_child">高二语文</a> <a
									href="javascript:void(0);" rel="高二数学" name="course"
									class="sx_child">高二数学</a> <a href="javascript:void(0);"
									rel="高二英语" name="course" class="sx_child">高二英语</a> <a
									href="javascript:void(0);" rel="高二政治" name="course"
									class="sx_child">高二政治</a> <a href="javascript:void(0);"
									rel="高二历史" name="course" class="sx_child">高二历史</a> <a
									href="javascript:void(0);" rel="高二地理" name="course"
									class="sx_child">高二地理</a> <a href="javascript:void(0);"
									rel="高二生物" name="course" class="sx_child">高二生物</a> <a
									href="javascript:void(0);" rel="高二化学" name="course"
									class="sx_child">高二化学</a> <a href="javascript:void(0);"
									rel="高二物理" name="course" class="sx_child">高二物理</a> <a
									href="javascript:void(0);" rel="高三语文" name="course"
									class="sx_child">高三语文</a> <a href="javascript:void(0);"
									rel="高三数学" name="course" class="sx_child">高三数学</a> <a
									href="javascript:void(0);" rel="高三英语" name="course"
									class="sx_child">高三英语</a> <a href="javascript:void(0);"
									rel="高三政治" name="course" class="sx_child">高三政治</a> <a
									href="javascript:void(0);" rel="高三历史" name="course"
									class="sx_child">高三历史</a> <a href="javascript:void(0);"
									rel="高三地理" name="course" class="sx_child">高三地理</a> <a
									href="javascript:void(0);" rel="高三生物" name="course"
									class="sx_child">高三生物</a> <a href="javascript:void(0);"
									rel="高三化学" name="course" class="sx_child">高三化学</a> <a
									href="javascript:void(0);" rel="高三物理" name="course"
									class="sx_child">高三物理</a>


							</div>
						</dd>

					</dl>
					<dl>
						<dt>辅导地区：</dt>
						<dd>
							<a href="javascript:void(0);" rel="" name="area" class="all on">全部</a>
							<div class="choose" id="choose"></div>
						</dd>
					</dl>
					<dl>
						<dt>教师性别：</dt>
						<dd>
							<a href="javascript:void(0);" rel="" name="sex" class="all on">全部</a>
							<div class="choose">
								<a href="javascript:void(0);" rel="男" name="sex"
									class="sx_child">男</a> <a href="javascript:void(0);" rel="女"
									name="sex" class="sx_child">女</a>
							</div>
						</dd>
					</dl>

				</div>
			</div>
		</div>

		<div class="content_div_div2" id="list_tbody"></div>
		<div id="list_nav"
			style="width: 900px;height: 100px;margin: 0 auto;text-align: center;">

		</div>

	</div>
</body>
</html>
