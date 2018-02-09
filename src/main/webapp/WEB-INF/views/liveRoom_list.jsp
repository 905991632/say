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
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/student.css" rel="stylesheet" type="text/css" />


</head>
<script>
	var USER_PROVINCE = "${USER_PROVINCE}";
	var USER_CITY = "${USER_CITY}"
</script>

<body style="overflow-y: scroll;">

	<div class="theTop">
		<div class="theTop_div1">
			<c:choose>
				<c:when test="${USER_ID!=null}">
					欢迎进入家教系统，<a href="toLogin">退出</a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${USER_ID!=null}">欢迎进入家教系统，<a
								href="toLogin">退出</a>
						</c:when>
						<c:otherwise>
							<a href="toLogin">亲,请登录</a>
							<a href="toRegister">免费注册</a>
						</c:otherwise>
					</c:choose>
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
				<li><a href="">家教论坛</a></li>
				<li><a href="toPersonal">个人中心</a></li>
			</ul>
		</div>
	</div>
	<!--学生的个人中心界面-->
	<!-- 当前位置 -->
	<div class="nowplace">
		<div>
			&nbsp;当前位置:&nbsp; <a href="index">首页</a> <span> > 学生库 </span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->

		<div class="content_div_div2">
			<c:forEach items="${liveList}" var="item">
				<section>
				<div>
					<a href="toLiveRoom?teacherid=${item.teacherid}"><img class="opcityaa" src="img/touming.png" /></a>
				</div>
				<div>
					<img class="content_div_div2_img" src="${item.photo}" />
					<div class="content_div_div2_div">
						<div>
							房间编号：<span>${item.roomid}</span>
						</div>
					</div>
				</div>
				</section>
			</c:forEach>
		
		</div>
		<div style="width: 900px;height: 100px;margin: 0 auto;text-align: center;">
			<c:if test="${liveList.size()>0}">
			<nav class="cbp-spmenu-right bbbb">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pageNum==1||totalPage==0}">
                                <li class="disabled"><a>首页</a></li>
                                <li class="disabled">
                                    <a aria-label="Previous">
                                        <span aria-hidden="true">«</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="toLiveRoomList?pageNum=1">首页</a></li>
                                <li>
                                    <a href="toLiveRoomList?pageNum=${pageNum-1}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">«</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="k" begin="1" end="${totalPage}">
                            <c:choose>
                                <c:when test="${k==(pageNum-4) || k == (pageNum + 4)}">
                                    <li><a>…</a></li>
                                </c:when>
                                <c:when test="${k==pageNum}">
                                    <li class="active"><a>${k}<span class="sr-only"></span></a></li>
                                </c:when>
                                <c:when test="${k < pageNum - 4 || k > pageNum + 4}">

                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="toLiveRoomList?pageNum=${k}">${k}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageNum == totalPage || totalPage == 0}">
                                <li class="disabled">
                                    <a aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                                <li class="disabled"><a>尾页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="toLiveRoomList?pageNum=${pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="toLiveRoomList?pageNum=${totalPage}">尾页</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
			
			</c:if>
		</div>

	</div>
</body>
</html>
