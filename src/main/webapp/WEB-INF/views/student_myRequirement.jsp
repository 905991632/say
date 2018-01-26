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
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/student_myRequirement.js"></script>
</head>
<body style="overflow-y: scroll;">
<script>
var totalPage = "${unfinish_totalPage}";
</script>
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
		<div>
			&nbsp;当前位置:&nbsp; <a href="">首页</a> <span> > </span> <a href="">学生中心</a>
			<span> > 我的订单</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="left_div">
			<div class="left_div_div">
				<div class="left_div_img1"></div>
				<ul>
					<li><a href="">发布家教信息</a></li>
					<li><a href="">我的订单</a></li>
					<li><a href="">我的预约</a></li>
					<li><a href="">我的教师</a></li>
					<li><a href="">我的评价</a></li>
				</ul>
				<div class="left_div_img2"></div>
				<ul>
					<li><a href="">基本资料</a></li>
					<li><a href="">修改密码</a></li>
				</ul>
			</div>
		</div>
		<!-- 右板块 -->
		<div class="right_div">
			<div class="right_div_div1">我的订单</div>
			<div class="right_div_div2">
				<div class="right_div_div2_div1">
					<a href="javascript:void(0);" id="bottom_unfinished"
						name="bottom_record">未完成订单</a> <a href="javascript:void(0);"
						id="bottom_finished" name="bottom_appraisal">已完成订单</a>
				</div>
				<div class="right_div_div2_div2" id="div_unfinished">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">订单号</th>
								<th style="text-align: center;">辅导科目</th>
								<th style="text-align: center;">时间</th>
								<th style="text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center;" id="unfinish_tbody">
						<c:forEach items="${unfinish}" var="item">
							<tr>
								<td>
									<a href="">${item.id}</a>
								</td>
								<td>
									${item.course}
								</td>
								<td>
									${item.createtime.toLocaleString()}
								</td>
								<td><a onclick="lookup_apply(${item.id});"
									class="label label-success">查看</a> <a
									onclick="delete_requirement(${item.id});" class="label label-danger">取消</a>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div id="nav_insert">
						<nav class="cbp-spmenu-right bbbb">
						<ul class="pagination">
							<c:choose>
								<c:when test="${unfinish_pageNum==1||unfinish_totalPage==0}">
									<li class="disabled"><a>首页</a></li>
									<li class="disabled"><a aria-label="Previous"> <span
											aria-hidden="true">«</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="javascript:void(0);" onclick="click_pageNum(1);" >首页</a></li>
									<li><a
										href="javascript:void(0);" onclick="click_pageNum(${unfinish_pageNum-1});" aria-label="Previous"> <span aria-hidden="true">«</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="k" begin="1" end="${unfinish_totalPage}">
								<c:choose>
									<c:when test="${k==(unfinish_pageNum-4) || k == (unfinish_pageNum + 4)}">
										<li><a>…</a></li>
									</c:when>
									<c:when test="${k==unfinish_pageNum}">
										<li class="active"><a>${k}<span class="sr-only"></span></a></li>
									</c:when>
									<c:when test="${k < unfinish_pageNum - 4 || k > unfinish_pageNum + 4}">

									</c:when>
									<c:otherwise>
										<li><a
											href="javascript:void(0);" onclick="click_pageNum(${k});">${k}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${unfinish_pageNum == unfinish_totalPage || unfinish_totalPage == 0}">
									<li class="disabled"><a aria-label="Next"> <span
											aria-hidden="true">»</span>
									</a></li>
									<li class="disabled"><a>尾页</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="javascript:void(0);" onclick="click_pageNum(${unfinish_pageNum+1});"
										aria-label="Next"> <span aria-hidden="true">»</span>
									</a></li>
									<li><a
										href="javascript:void(0);" onclick="click_pageNum(${unfinish_totalPage});">尾页</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
						</nav>
					</div>
				</div>



				<div class="right_div_div2_div2" id="div_finished">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">订单号</th>
								<th style="text-align: center;">辅导科目</th>
								<th style="text-align: center;">时间</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
						<c:forEach items="${finish}" var="item">
							<tr>
								<td>${item.id}</td>
								<td>${item.course}</td>
								<td>${item.createtime.toLocaleString()}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div>
						<nav class="cbp-spmenu-right bbbb">
						<ul class="pagination">
							<c:choose>
								<c:when test="${finish_pageNum==1||finish_totalPage==0}">
									<li class="disabled"><a>首页</a></li>
									<li class="disabled"><a aria-label="Previous"> <span
											aria-hidden="true">«</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a onclick="">首页</a></li>
									<li><a
										href=""
										aria-label="Previous"> <span aria-hidden="true">«</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="k" begin="1" end="${finish_totalPage}">
								<c:choose>
									<c:when test="${k==(finish_pageNum-4) || k == (finish_pageNum + 4)}">
										<li><a>…</a></li>
									</c:when>
									<c:when test="${k==finish_pageNum}">
										<li class="active"><a>${k}<span class="sr-only"></span></a></li>
									</c:when>
									<c:when test="${k < finish_pageNum - 4 || k > finish_pageNum + 4}">

									</c:when>
									<c:otherwise>
										<li><a
											href="">${k}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${finish_pageNum == finish_totalPage || finish_totalPage == 0}">
									<li class="disabled"><a aria-label="Next"> <span
											aria-hidden="true">»</span>
									</a></li>
									<li class="disabled"><a>尾页</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href=""
										aria-label="Next"> <span aria-hidden="true">»</span>
									</a></li>
									<li><a
										href="">尾页</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
						</nav>
					</div>
					
				</div>

				<div class="right_div_div2_div2">
					<div class="right_div_div2_div1">
						<a href="javascript:void(0);" id="display_apply"
							name="display_apply">申请情况</a>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">教师编号</th>
								<th style="text-align: center;">时间</th>
								<th style="text-align: center;">操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<tr>
								<td><a href="">123</a></td>
								<td>2018-01-19 10：34：30</td>
								<td><a href="" class="label label-success">接受</a> <a
									href="" class="label label-danger">拒绝</a></td>
							</tr>
							<tr>
								<td><a href="">456</a></td>
								<td>411027</td>
								<td><a href="" class="label label-success">接受</a> <a
									href="" class="label label-danger">拒绝</a></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>


</html>
