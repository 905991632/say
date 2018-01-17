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
		<link href="css/student_requirement.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="js/student_requirement.js"></script>
		<script type="text/javascript" src="js/area.js"></script>
  </head>
	<body style="overflow-y: scroll;" onload="myfunction();">
	<script>
	if('${requirement_msg}'!=""){
	alert('${requirement_msg}');
	}
 	var USER_PROVINCE = "${USER_PROVINCE}";
	var USER_CITY = "${USER_CITY}" 
  	</script>
		
	<div class="theTop">
		<div class="theTop_div1">
			<a href="">亲,请登录</a> <a href="">免费注册</a>
		</div>
		<div class="theTop_div2">
			全国投诉专线：12345678901</div>
	</div>
		<!-- 家教平台和导航 -->
		
		<div class="Top">
			<!-- 显示 “家教平台” -->
			<div class="top1">
				<img src="img/logo.png"/>
				<div>
					<span>中山</span>
				</div>
			</div>
			<!-- 导航 -->
			<div class="nav">
				<ul>
					<li>
						<a href="">首&nbsp;&nbsp;页</a>
					</li>
					<li>
						<a href="">老师库</a>
					</li>
					<li>
						<a href="">学员库</a>
					</li>
					<!--<li><a href=""><span style="font-size:23px;font-family: '微软雅黑';">在线课堂</span></a></li>-->
					<li>
						<a href="">家教论坛</a>
					</li>
					<li>
						<a href="">个人中心</a>
					</li>
				</ul>
			</div>
		</div>
		<!--学生的个人中心界面-->
		<!-- 当前位置 -->
		<div class="nowplace">
			<div>&nbsp;当前位置:&nbsp;
				<a href="">首页</a>
				<span> > 学员中心</span>
			</div>
		</div>
		<!-- 主内容 -->
		<div class="main_div">
			<!-- 左板块 -->
			<div class="left_div">
				<div class="left_div_div">
					<div class="left_div_img1"></div>
					<ul>
						<li>
							<a href="">发布家教信息</a>
						</li>
						<li>
							<a href="">我的订单</a>
						</li>
						<li>
							<a href="">我的预约</a>
						</li>
						<li>
							<a href="">我的老师</a>
						</li>
					</ul>
					<div class="left_div_img2"></div>
					<ul>
						<li>
							<a href="">基本资料</a>
						</li>
						<li>
							<a href="">修改密码</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 右板块 -->
			<div class="right_div">
				<div class="right_div_div1">发布家教信息</div>
				<div class="right_div_div2"> 
					<div class="right_div_div2_left">
						<div>辅导科目：</div>
						<div>辅导地区：</div>
						<div>性别要求：</div>
						<div>薪酬待遇：</div>
						<div>详细情况：</div>

					</div>
				<form action="student_requirement" method="post" onsubmit="return check();">
					<div class="right_div_div2_right">
						<div>
							<select id="course" name="course">
								<option value="请选择">请选择</option>
							</select>
						</div>
						<input name="address" va style="display: none;"/>
						<div>
							<select id="area" name="area">
								<option value="请选择">请选择</option>
							</select>
						</div>
						<div>
							<select id="sex" name="sex">
								<option value="请选择">请选择</option>
								<option value="男女">不限</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
						<div>
							<input type="text" name="price" required="required" maxlength="100"/>
						</div>
						<div>
							<input type="text" name="detail" required="required" maxlength="100"/>
						</div>
						<div>
							<input type="submit" width="30px" value="发布"/>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</body>

 
</html>
