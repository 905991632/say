<%@ page language="java" import="java.util.*,com.tutor.entity.Student" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>家教平台系统</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/common.css">
<script src="js/tagSelect.js"></script>
</head>

<body>
    <div class="filter">
        <div class="container">
            <div class="box">
            <div class="title-h">按条件筛选</div>
            <dl>
                <dt>姓名</dt>
                <dd>
                    <a href="#" rel="" name="name" class="all on">全部</a>
                    <a href="#" rel="陈晓佳" name="name" class="sx_child">陈晓佳</a>
                    <a href="#" rel="骆婉婷" name="name" class="sx_child">骆婉婷</a>
                </dd>
            </dl>
            <dl>
                <dt>性别</dt>
                <dd>
                    <a href="#" rel="" name="sex" class="all on">全部</a>
                    <a href="#" rel="男" name="sex" class="sx_child">男</a>
                    <a href="#" rel="女" name="sex" class="sx_child">女</a>
                </dd>
            </dl>
            <dl>
                <dt>年龄</dt>
                <dd>
                    <a href="#" rel="" name="age" class="all on">全部</a>
                    <a href="#" rel="22" name="age" class="sx_child">22</a>
                    <a href="#" rel="21" name="age" class="sx_child">21</a>
                </dd>
            </dl>
          
            </div>
        </div>
    </div>

<div style="width: 900px;margin: 0 auto; border: 1px solid #444444;">
	<c:forEach items="${students}" var="item">
		<div style="width: 400px;margin: 10px 0px 0px 20px;float: left;border: 1px solid #444444;">
		<table>
			<tr>
				<td>姓名</td>
				<td><c:out value="${item.name}"/></td>
			</tr>
			<tr>
				<td>年龄</td>
				<td><c:out value="${item.age}"></c:out></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><c:out value="${item.sex}"/></td>
			</tr>
		</table>
	</div>
	</c:forEach>
</div>
</body>

<script>  
    $(function(){
        new SelectTag({
            child : ".sx_child", //所有筛选范围内的子类
            over : 'on', //选中状态样式名称
            all : ".all"
        });
    })
</script>
</html>