<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  	<link rel="stylesheet" href="css/Register.css" type="text/css"/>
  	<script type="text/javascript" src="js/Register.js"></script>
  	<script type="text/javascript" src="js/area.js"></script>
  	<script type="text/javascript" src="js/select.js"></script>  	
  	
  </head>
<body>
	
    <div id="top">
		<h1>用户注册</h1>
	</div>
	
<!--外面一层背景-->	
<div class="form-bak" id="form-bak">
<!--显示学生、教员-->	
	<div class="student_or_teacher">
		<a class="choose_student" id="choose_student" href="javascript:void(0);"><strong>学生注册</strong></a>
		<a class="choose_teacher" id="choose_teacher" href="javascript:void(0);"><strong>教师注册</strong></a>
		
	</div>
	<div class="bottom_line" id="bottom_line"></div>
	<!--学生模块-->
	<div class="studentPart" id="studentPart">
		<form action="Registers" method="post" >
		<div class="left">
			<div class="line" id="line_student_account">
				<div class="info">
					<strong>账号</strong>
					<span class="tips">6至16个字符</span>
					<span class="tips">只能由数字、文字或下划线组成</span>
				</div>
				<div class="input">
					<input type="text" name="username" id="student_username" onblur="student_v_account();" required />
					<div class="none">
						<span></span>
					</div>
					<div id="student_ajax"></div>
				</div>
			</div>
			
			<div class="line" id="line_student_password">
				<div class="info">
					<strong>密码</strong>
					<span class="tips">6至16个字符</span>
				</div>
				<div class="input">
					<input type="password" name="password" id="student_inputPassword" onblur="student_v_password();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>

			<div class="line" id="line_student_repeat">
				<div class="info">
					<strong>确认密码</strong>
					<span class="tips">再次输入密码</span>
				</div>
				<div class="input">
					<input type="password" name="student_repeat" id="student_inputPasswordConfirm" onblur="student_v_repeat();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>
			
			<div class="line">
				<div class="info">
					<div style="padding-top:13px;">
						<strong>学生姓名</strong>
					</div>
				</div>
				<div class="input">
					<input type="text" name="name" id="student_name" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>

			<div class="line" id="line_student_age">
				<div class="info">
					<div style="padding-top:13px;">
						<strong>学生年龄</strong>
					</div>
				</div>
				<div class="input">
					<input type=text name="age" id="student_age" onblur="student_v_age()" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>
			
			<div class="line">
				<div class="info">
					<div style="padding-top:13px;">
						<strong>学生性别</strong>
					</div>
				</div>
				<div style="line-height: 80px; float:right;">
					<table style="width: 230px;">
						<tr>
							<td>
								<input type="radio" name="sex" value="男" checked="checked" /><strong><span style="font-size:30px">男</span></strong>
							</td>
							<td>
								<input type="radio" name="sex" value="女" /> <strong><span style="font-size:30px">女</span></strong>
							</td>
						</tr>
					</table>
				</div>
			</div>			
			
			<div class="line" id="line_student_mobile">
				<div class="info">
					<div style="padding-top:15px;">
						<strong>手机号码</strong>
					</div>
				</div>
				<div class="input">
					<input type="text" name="mobile" id="student_mobile" onblur="student_v_mobile();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>			
		</div>
		<div class="right">
			<input type="submit" id="student_submit" value="完成注册" disabled="disabled" />
			<div class="readagreement-wrap"> <!-- onclick="onReadAgreementClick();" -->
				<input type="checkbox" name="student_agree" id="student_agree" onchange="student_submitbutton();" /> 同意《
				<a id="readagreement" style="cursor:pointer" onclick="showAgreement();" title="查看用户使用协议">用户使用协议</a>》
			</div>
			<div>已经拥有账号，
				<a href="toLogin">直接登录</a>
			</div>
		</div>
		</form>
	</div>
	
	<!--教师模块-->
	<div class="teacherPart" id="teacherPart">
		<form action="Registert" method="post" >
			<div class="left">
			<div class="line" id="line_teacher_account">
				<div class="info">
					<strong>账号</strong>
					<span class="tips">6至16个字符</span>
					<span class="tips">只能由数字、文字或下划线组成</span>
				</div>
				<div class="input">
					<input type="text" name="username" id="teacher_username" onblur="teacher_v_account();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>
			
			<div class="line" id="line_teacher_password">
				<div class="info">
					<strong>密码</strong>
					<span class="tips">6至16个字符</span>
				</div>
				<div class="input">
					<input type="password" name="password" id="teacher_inputPassword" onblur="teacher_v_password();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>

			<div class="line" id="line_teacher_repeat">
				<div class="info">
					<strong>确认密码</strong>
					<span class="tips">再次输入密码</span>
				</div>
				<div class="input">
					<input type="password" name="teacher_repeat" id="teacher_inputPasswordConfirm" onblur="teacher_v_repeat();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>
			
			<div class="line">
				<div class="info">
					<div style="padding-top:13px;">
						<strong>姓名</strong>
					</div>
				</div>
				<div class="input">
					<input type="text" name="name" id="teacher_name" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>

			<div class="line" id="line_teacher_age">
				<div class="info">
					<div style="padding-top:13px;">
						<strong>年龄</strong>
					</div>
				</div>
				<div class="input">
					<input type="text" name="age" id="teacher_age" onblur="teacher_v_age()" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>
			
			<div class="line">
				<div class="info">
					<div style="padding-top:13px;">
						<strong>性别</strong>
					</div>
				</div>
				<div style="line-height: 80px; float:right;">
					<table style="width: 230px;">
						<tr>
							<td>
								<input type="radio" name="sex" value="男" checked="checked" /><strong><span style="font-size:30px">男</span></strong>
							</td>
							<td>
								<input type="radio" name="sex" value="女" /> <strong><span style="font-size:30px">女</span></strong>
							</td>
						</tr>
					</table>
				</div>
			</div>			
			
			<div class="line" id="line_teacher_mobile">
				<div class="info">
					<div style="padding-top:15px;">
						<strong>手机号码</strong>
					</div>
				</div>
				<div class="input">
					<input type="text" name="mobile" id="teacher_mobile" onblur="teacher_v_mobile();" required />
					<div class="none">
						<span></span>
					</div>
				</div>
			</div>	
			</div>
			<div class="right">
				<input type="submit" id="teacher_submit" value="完成注册" disabled="disabled" />
				<div class="readagreement-wrap"> <!-- onclick="onReadAgreementClick();" -->
					<input type="checkbox" name="teacher_agree" id="teacher_agree" onchange="teacher_submitbutton();" /> 同意《
					<a id="readagreement" style="cursor:pointer" onclick="showAgreement();" title="查看用户使用协议">用户使用协议</a>》
				</div>
				<div>已经拥有账号，
					<a href="toLogin">直接登录</a>
				</div>				
			</div>
		</form>
		
	</div>
	
	
	
</div>
		
		<!--用户协议-->
<div id="agreement" class="agreement" style="display:none;">
	<h1>用户使用协议</h1>
	<iframe src=""></iframe>
	<input type="button" value="同意" onclick="agree();" />
	<div style="height:10px"></div>
</div>
		
		
  

</body>
</html>
