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
<link href="css/student_myTeacher.css" rel="stylesheet" type="text/css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

</head>
<body style="overflow-y: scroll;">
	<script>
		if ('${requirement_msg}' != "") {
			alert('${requirement_msg}');
		}
	</script>

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
				<li><a href="">家教论坛</a></li>
				<li><a href="toPersonal">个人中心</a></li>
			</ul>
		</div>
	</div>
	<!--学生的个人中心界面-->
	<!-- 当前位置 -->
	<div class="nowplace">
		<div>
			&nbsp;当前位置:&nbsp; <a href="index">首页</a> <span> > </span> <a
				href="toPersonal">学生中心</a> <span> > 我的老师</span>
		</div>
	</div>
	<!-- 主内容 -->
	<div class="main_div">
		<!-- 左板块 -->
		<div class="left_div">
			<div class="left_div_div">
				<div class="left_div_img1"></div>
				<ul>
					<li><a href="toStudent_requirement">发布家教信息</a></li>
					<li><a href="toStudent_myRequirement">我的订单</a></li>
					<li><a href="toStudent_myOrder">我的预约</a></li>
					<li><a href="toStudent_myTeacher?pageNum=1">我的教师</a></li>
					<li><a href="toStudent_appraisal">我的评价</a></li>
				</ul>
				<div class="left_div_img2"></div>
				<ul>
					<li><a href="toStudent_info">基本资料</a></li>
					<li><a href="toStudent_alterPassword">修改密码</a></li>
				</ul>
			</div>
		</div>
		<!-- 右板块 -->
		<div class="right_div">
			<div class="right_div_div1">我的老师</div>


			<div class="right_div_div2">

				<div class="right_div_div2_div2">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">教师编号</th>
								<th style="text-align: center;">教师姓名</th>
								<th style="text-align: center;">联系方式</th>
								<th style="text-align: center;">订单编号</th>
								<th style="text-align: center;">辅导科目</th>
								<th style="text-align: center;">评价</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<c:choose>
								<c:when test="${myTeachers.size()==0}">
								</c:when>
								<c:otherwise>
									<c:forEach items="${myTeachers}" var="item">
										<tr>
											<td><a href="toTeacher_detail?id=${item.id}"
												target="_blank">${item.id}</a></td>
											<td>${item.name}</td>
											<td>${item.mobile}</td>
											<td><a href="toRequirement_info?id=${item.requireid}"
												target="_blank">${item.requireid}</a></td>
											<td>${item.course}</td>
											<td><c:choose>
													<c:when test="${item.appraisalstatus==0}">
														<a href="javascript:void(0);"
															onclick="toAppraisal(${item.applyid});" id="toAppraisal"
															class="label label-danger">未评价</a>
													</c:when>
													<c:otherwise>
														<a class="label label-success">等待对方评价</a>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div>
						<c:if test="${myTeachers.size()>0}">
							<nav class="cbp-spmenu-right bbbb">
							<ul class="pagination">
								<c:choose>
									<c:when test="${pageNum==1||totalPage==0}">
										<li class="disabled"><a>首页</a></li>
										<li class="disabled"><a aria-label="Previous"> <span
												aria-hidden="true">«</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:void(0);"
											onclick="click_pageNum(1);">首页</a></li>
										<li><a href="javascript:void(0);"
											onclick="click_pageNum(${unfinish_pageNum-1});"
											aria-label="Previous"> <span aria-hidden="true">«</span>
										</a></li>
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
											<li><a href="javascript:void(0);"
												onclick="click_pageNum(${k});">${k}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageNum == totalPage || totalPage == 0}">
										<li class="disabled"><a aria-label="Next"> <span
												aria-hidden="true">»</span>
										</a></li>
										<li class="disabled"><a>尾页</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:void(0);"
											onclick="click_pageNum(${pageNum+1});" aria-label="Next">
												<span aria-hidden="true">»</span>
										</a></li>
										<li><a href="javascript:void(0);"
											onclick="click_pageNum(${totalPage});">尾页</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
							</nav>
						</c:if>
					</div>

					<div id="dialogBg"></div>
					<div id="dialog" class="animated">
						<div class="dialogTop">
							<a href="javascript:;" class="claseDialogBtn">关闭</a>
						</div>
						<form action="appraisalTeacher" method="post" id="editForm">
							<ul class="editInfos">
								<input type="text" name="applyid" id="applyid" class="hidden"
									value="" />
								<li><label><font color="#ff0000">* </font> 评价内容：<input
										type="text" style="width:230px;" name="content" required
										class="ipt" maxlength="12" /> </label></li>
								<li><label><font color="#ff0000">* </font> 评价星级： <input
										type="radio" name="score" value="5" class="ipt" checked />五星
										<input type="radio" name="score" value="4" class="ipt" />四星 <input
										type="radio" name="score" value="3" class="ipt" />三星 <input
										type="radio" name="score" value="2" class="ipt" />二星 <input
										type="radio" name="score" value="1" class="ipt" />一星 </label></li>

								<li><input type="submit" value="确认提交" class="submitBtn" /></li>
							</ul>
						</form>
					</div>




				</div>
			</div>


		</div>
	</div>
</body>
<script type="text/javascript">
	var w,
		h,
		className;
	function getSrceenWH() {
		w = $(window).width();
		h = $(window).height();
		$('#dialogBg').width(w).height(h);
	}

	window.onresize = function() {
		getSrceenWH();
	}
	$(window).resize();

	$(function() {
		getSrceenWH();

		//关闭弹窗
		$('.claseDialogBtn').click(function() {
			$('#dialogBg').fadeOut(300, function() {
				$('#dialog').addClass('bounceOutUp').fadeOut();
			});
		});
	});
	//显示弹框
	function toAppraisal(applyid) {
		$('#applyid').val(applyid)
		$('#dialogBg').fadeIn(300);
		$('#dialog').removeAttr('class').addClass('animated bounceInDown').fadeIn();
	}
</script>

</html>
