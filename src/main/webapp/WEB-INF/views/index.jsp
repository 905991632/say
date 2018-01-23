<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>家教平台系统</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/index.js"></script>
</head>

<body style="overflow-y: scroll;">
	<!-- 顶部 -->
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
				<a href="toChooseCity">${USER_CITY }</a>
			</div>
		</div>
		<!-- 导航 -->
		<div class="nav">
			<ul>
				<div></div>
				<li><a href="index">首&nbsp;&nbsp;页</a></li>
				<li><a href="toTeacher_list">教师库</a></li>
				<li><a href="toRequirement_list">学生库</a></li>
				<li><a href="">家教论坛</a></li>
				<li><a href="toPersonal">个人中心</a></li>
			</ul>
		</div>
	</div>

	<!-- 左框 -->
	<div class="w">
		<!-- banner上面浮层 -->
		<div class="cat_wrap">

			<div class="cat_header">
				<div class="cat_img">
					<img src="img/nav2.png" />
				</div>
				<div class="cat_list">
					<div class="float">
						<ul class="clearfix">
							<li>小学一年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>小学二年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>小学三年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>小学四年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>小学五年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>小学六年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>初中一年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>初中二年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>初中三年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>高中一年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>高中二年级</li>
						</ul>
					</div>
					<div class="float">
						<ul class="clearfix">
							<li>高中三年级</li>
						</ul>
					</div>

				</div>
			</div>
			<!-- banner浮层滑动显示弹框 -->
			<div class="cat_subcont">
				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=一年级语文">语文</a></li>
								<li><a href="toTeacher_list?course=一年级数学">数学</a></li>
								<li><a href="toTeacher_list?course=一年级英语">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=二年级语文">语文</a></li>
								<li><a href="toTeacher_list?course=二年级数学">数学</a></li>
								<li><a href="toTeacher_list?course=二年级英语">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=三年级语文">语文</a></li>
								<li><a href="toTeacher_list?course=三年级数学">数学</a></li>
								<li><a href="toTeacher_list?course=三年级英语">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=四年级语文">语文</a></li>
								<li><a href="toTeacher_list?course=四年级数学">数学</a></li>
								<li><a href="toTeacher_list?course=四年级英语">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=五年级语文">语文</a></li>
								<li><a href="toTeacher_list?course=五年级数学">数学</a></li>
								<li><a href="toTeacher_list?course=五年级英语">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=六年级语文">语文</a></li>
								<li><a href="toTeacher_list?course=六年级数学">数学</a></li>
								<li><a href="toTeacher_list?course=六年级英语">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=初一语文">语文</a></li>
								<li><a href="toTeacher_list?course=初一数学">数学</a></li>
								<li><a href="toTeacher_list?course=初一英语">英语</a></li>
								<li><a href="toTeacher_list?course=初一地理">地理</a></li>
								<li><a href="toTeacher_list?course=初一政治">政治</a></li>
								<li><a href="toTeacher_list?course=初一历史">历史</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=初二语文">语文</a></li>
								<li><a href="toTeacher_list?course=初二数学">数学</a></li>
								<li><a href="toTeacher_list?course=初二英语">英语</a></li>
								<li><a href="toTeacher_list?course=初二地理">地理</a></li>
								<li><a href="toTeacher_list?course=初二政治">政治</a></li>
								<li><a href="toTeacher_list?course=初二历史">历史</a></li>
								<li><a href="toTeacher_list?course=初二物理">物理</a></li>
								<li><a href="toTeacher_list?course=初二化学">化学</a></li>
								<li><a href="toTeacher_list?course=初二生物">生物</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=初三语文">语文</a></li>
								<li><a href="toTeacher_list?course=初三数学">数学</a></li>
								<li><a href="toTeacher_list?course=初三英语">英语</a></li>
								<li><a href="toTeacher_list?course=初三地理">地理</a></li>
								<li><a href="toTeacher_list?course=初三政治">政治</a></li>
								<li><a href="toTeacher_list?course=初三历史">历史</a></li>
								<li><a href="toTeacher_list?course=初三物理">物理</a></li>
								<li><a href="toTeacher_list?course=初三化学">化学</a></li>
								<li><a href="toTeacher_list?course=初三生物">生物</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=高一语文">语文</a></li>
								<li><a href="toTeacher_list?course=高一数学">数学</a></li>
								<li><a href="toTeacher_list?course=高一英语">英语</a></li>
								<li><a href="toTeacher_list?course=高一生物">生物</a></li>
								<li><a href="toTeacher_list?course=高一物理">物理</a></li>
								<li><a href="toTeacher_list?course=高一化学">化学</a></li>
								<li><a href="toTeacher_list?course=高一历史">历史</a></li>
								<li><a href="toTeacher_list?course=高一地理">地理</a></li>
								<li><a href="toTeacher_list?course=高一政治">政治</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=高二语文">语文</a></li>
								<li><a href="toTeacher_list?course=高二数学">数学</a></li>
								<li><a href="toTeacher_list?course=高二英语">英语</a></li>
								<li><a href="toTeacher_list?course=高二生物">生物</a></li>
								<li><a href="toTeacher_list?course=高二物理">物理</a></li>
								<li><a href="toTeacher_list?course=高二化学">化学</a></li>
								<li><a href="toTeacher_list?course=高二历史">历史</a></li>
								<li><a href="toTeacher_list?course=高二地理">地理</a></li>
								<li><a href="toTeacher_list?course=高二政治">政治</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="toTeacher_list?course=高三语文">语文</a></li>
								<li><a href="toTeacher_list?course=高三数学">数学</a></li>
								<li><a href="toTeacher_list?course=高三英语">英语</a></li>
								<li><a href="toTeacher_list?course=高三生物">生物</a></li>
								<li><a href="toTeacher_list?course=高三物理">物理</a></li>
								<li><a href="toTeacher_list?course=高三化学">化学</a></li>
								<li><a href="toTeacher_list?course=高三历史">历史</a></li>
								<li><a href="toTeacher_list?course=高三地理">地理</a></li>
								<li><a href="toTeacher_list?course=高三政治">政治</a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 轮播 -->
	<div class="banner_div">
		<div id="banner">
			<ul>
				<li class="on">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
			</ul>
			<div id="banner_list">
				<a><img src="img/1.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a> 
				<a><img src="img/2.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a> 
				<a><img src="img/3.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a> 
				<a><img src="img/4.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a>
			</div>
		</div>
	</div>

	<div class="content_div_div1">
		<span>教师信息</span> <a href="toTeacher_list" target="_blank">+更多</a>
	</div>

	<div class="content_div_div2">
		<c:forEach items="${teacherList}" var="item">
			<section>
			<div>
				<a href="toTeacher_detail?id=${item.id}" target="_blank"><img class="opcityaa" src="img/touming.png" /></a>
			</div>
			<div>
				<img class="content_div_div2_img"
					src='<c:out value="${item.photo}"></c:out>' />
				<div class="content_div_div2_div">
					<div>
						教师编号：<span><c:out value="${item.id }"></c:out></span>
					</div>
					<div>
						教师姓名：<span><c:out value="${item.name }"></c:out></span>
					</div>
					<div>
						教师性别：<span><c:out value="${item.sex }"></c:out></span>
					</div>
					<div>
						教师年龄：<span><c:out value="${item.age }"></c:out></span>
					</div>
				</div>
			</div>
			</section>
		</c:forEach>
	</div>

	<div class="content_div_div1">
		<span>家教信息</span> <a href="toRequirement_list" target="_blank">+更多</a>
	</div>

	<!-- 显示家教信息 (height要去除)-->
	<div class="content_div_div2">
		<c:forEach items="${requirementsList}" var="item">
			<section>
			<div>
				<a href="toRequirement_info?id=${item.id}" target="_blank"><img class="opcityaa" src="img/touming.png" /></a>
			</div>
			<div>
				<img class="content_div_div2_img" src="images/photo/student.jpg" />
				<div class="content_div_div2_div">
					<div>
						编号：<span><c:out value="${item.id }"></c:out></span>
					</div>
					<div>
						课程：<span><c:out value="${item.course }"></c:out></span>
					</div>

					<c:choose>
						<c:when test="${item.sex=='男女'}">
							<div>
								性别要求：<span><c:out value="不限"></c:out></span>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								性别要求：<span><c:out value="${item.sex }"></c:out></span>
							</div>
						</c:otherwise>
					</c:choose>
					<div>
						地址：<span><c:out value="${item.area }"></c:out></span>
					</div>
				</div>
			</div>
			</section>
		</c:forEach>
	</div>
</body>
</html>