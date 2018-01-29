<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>家教管理系统</title>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  	<link rel="stylesheet" href="css/Login.css" type="text/css"/>
  </head>
  <%
  	if(request.getAttribute("login_message")!=null){
  %>
	<script>
		alert("用户名或密码错误！！");
	</script>
  <% 
  	}
  %>
  
  <body>
    <div id="top">
		<h1>用户登录</h1>
	</div>
		<div class="form-bak">
			<form method="post" action="Login">
			 <div class="left">
				<div style="width:300px;margin-top:30px;margin-left:200px">
					<input type="radio" name="usertype" value="学生" checked="checked" /><strong><span style="font-size:20px">学生</span></strong>
					<input type="radio" name="usertype" value="教师" /><strong><span style="font-size:20px">教师</span></strong>
					<input type="radio" name="usertype" value="管理员" /><strong><span style="font-size:20px">管理员</span></strong>
				</div>
					<div class="line" id="line_account">
						<div class="info">
							<strong>账号</strong>
						</div>
						<div class="input">
							<input type="text" name="username" id="username" required />
						</div>
					 </div>
					<div class="line" id="line_password">
						<div class="info">
							<strong>密码</strong>
						</div>
						<div class="input">
							<input type="password" name="password" id="inputPassword" required/>
						</div>
					</div>
				</div>
				<div class="right">
					<input type="submit" id="submit" value="登录"/>
					<div>没有账号？
						<a href="toRegister">快速注册</a>
					</div>
				</div>
			</form>
		</div>
  </body>
</html>
