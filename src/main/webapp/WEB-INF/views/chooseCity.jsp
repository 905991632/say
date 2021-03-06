<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- <base href="http://139.199.75.20:8080/tutor/"> -->
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>家教平台系统</title>
<link href="css/chooseCity.css" rel="stylesheet" type="text/css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/area.js"></script>
<script src="js/select.js"></script>
</head>
<body style="overflow-y: scroll;" onload="myfunction()">
				<!-- 家教平台和导航 -->
	<div class="div1">
		<div class="div1_1">
			<span>选择城市</span>
		</div>
		<div class="div1_2">
			<form action="chooseCity" method="post" onsubmit="return isChooseCity();">
				<select name="province" id="province">
				<c:if test="${province != null}">
					<option value='<c:out value="${province}"/>'><c:out value="${province}"/></option>
				</c:if>
					<option value="请选择">请选择</option>
				</select>
				<select name="city" id="city">
				<c:if test="${city != null}">
					<option value='<c:out value="${city}"/>'><c:out value="${city}"/></option>
				</c:if>
					<option value="请选择">请选择</option>
				</select>
				<input type="submit" value="确定"/>
			</form>
		</div>
	</div>
	
</body>
</html>
