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
				<li><a href="">首&nbsp;&nbsp;页</a></li>
				<li><a href="">教师库</a></li>
				<li><a href="">学生库</a></li>
				<!--<li><a href="">在线课堂</a></li>-->
				<li><a href="">家教论坛</a></li>
				<li><a href="">个人中心</a></li>
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
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
								<li><a href="javascript:void(0);">地理</a></li>
								<li><a href="javascript:void(0);">政治</a></li>
								<li><a href="javascript:void(0);">历史</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
								<li><a href="javascript:void(0);">地理</a></li>
								<li><a href="javascript:void(0);">政治</a></li>
								<li><a href="javascript:void(0);">历史</a></li>
								<li><a href="javascript:void(0);">物理</a></li>
								<li><a href="javascript:void(0);">化学</a></li>
								<li><a href="javascript:void(0);">生物</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
								<li><a href="javascript:void(0);">地理</a></li>
								<li><a href="javascript:void(0);">政治</a></li>
								<li><a href="javascript:void(0);">历史</a></li>
								<li><a href="javascript:void(0);">物理</a></li>
								<li><a href="javascript:void(0);">化学</a></li>
								<li><a href="javascript:void(0);">生物</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
								<li><a href="javascript:void(0);">生物</a></li>
								<li><a href="javascript:void(0);">物理</a></li>
								<li><a href="javascript:void(0);">化学</a></li>
								<li><a href="javascript:void(0);">历史</a></li>
								<li><a href="javascript:void(0);">地理</a></li>
								<li><a href="javascript:void(0);">政治</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
								<li><a href="javascript:void(0);">生物</a></li>
								<li><a href="javascript:void(0);">物理</a></li>
								<li><a href="javascript:void(0);">化学</a></li>
								<li><a href="javascript:void(0);">历史</a></li>
								<li><a href="javascript:void(0);">地理</a></li>
								<li><a href="javascript:void(0);">政治</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="cat_sublist">
					<!-- 浮层左边列表 -->
					<div class="fore1">
						<div class="fore_list">
							<ul class="clearfix">
								<li><a href="javascript:void(0);">语文</a></li>
								<li><a href="javascript:void(0);">数学</a></li>
								<li><a href="javascript:void(0);">英语</a></li>
								<li><a href="javascript:void(0);">生物</a></li>
								<li><a href="javascript:void(0);">物理</a></li>
								<li><a href="javascript:void(0);">化学</a></li>
								<li><a href="javascript:void(0);">历史</a></li>
								<li><a href="javascript:void(0);">地理</a></li>
								<li><a href="javascript:void(0);">政治</a></li>
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
				<a><img src="img/1.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a> <a><img
					src="img/2.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a> <a><img
					src="img/3.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a> <a><img
					src="img/4.jpg" alt="欢迎来到家教平台" title="欢迎来到家教平台" /></a>
			</div>
		</div>
	</div>

	<div class="content_div_div1">
		<span>教师信息</span> <a href="" target="_blank">+更多</a>
	</div>

	<!-- 显示教师信息 (height要去除)-->
	<div class="content_div_div2">
		<c:forEach items="${teacherList}" var="item">
		<section>
		<div>
			<a href=""><img class="opcityaa" src="img/touming.png" /></a>
		</div>
		<div>
			<img class="content_div_div2_img" src='<c:out value="${item.photo}"></c:out>' />
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
		<span>家教信息</span> <a href="" target="_blank">+更多</a>
	</div>

	<!-- 显示家教信息 (height要去除)-->
	<div class="content_div_div2">
	<c:forEach items="${requirementsList}" var="item">
		<section>
		<div>
			<a href=""><img class="opcityaa" src="img/touming.png" /></a>
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

<script type="text/javascript">
	var t = n = 0,
		count;

	$(document).ready(function() {

		count = $("#banner_list a").length;

		$("#banner_list a:not(:first-child)").hide();

		$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));

		$("#banner_info").click(function() {
			window.open($("#banner_list a:first-child").attr('href'), "_blank")
		});

		$("#banner li").click(function() {

			var i = $(this).text() - 1; //获取Li元素内的值，即1，2，3，4

			n = i;

			if (i >= count) return;

			$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));

			$("#banner_info").unbind().click(function() {
				window.open($("#banner_list a").eq(i).attr('href'), "_blank")
			})

			$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);

			document.getElementById("banner").style.background = "";

			$(this).toggleClass("on");

			$(this).siblings().removeAttr("class");

		});

		t = setInterval("showAuto()", 4000);

		$("#banner").hover(function() {
			clearInterval(t)
		}, function() {
			t = setInterval("showAuto()", 4000);
		});

	})


	function showAuto() {
		n = n >= (count - 1) ? 0 : ++n;

		$("#banner li").eq(n).trigger('click');

	}
</script>

<script type="text/javascript">
    	//banner左侧内容栏
		$(function(){
		    var thisTime;
		    //鼠标离开左侧内容栏
		    $('.cat_wrap .cat_list .float').mouseleave(function(even){
		        thisTime = setTimeout(thisMouseOut,1);
		    });
		    //鼠标点击左侧内容栏   滑动出弹层
		    $('.cat_wrap .cat_list .float').mouseenter(function(){
		        $(this).addClass("active").siblings().removeClass("active");
		        clearTimeout(thisTime);
		        var thisUB = $('.cat_wrap .cat_list .float').index($(this));
		        if($.trim($('.cat_subcont .cat_sublist').eq(thisUB).html()) != ""){
		            $('.cat_subcont').addClass('active');
		            $('.cat_sublist').hide();
		            $('.cat_sublist').eq(thisUB).show();
		        }else{
		            $('.cat_subcont').removeClass('active');
		        }
		    });
		    //函数——执行鼠标离开左侧内容栏的动作
		    function thisMouseOut(){
		        $('.cat_subcont').removeClass('active');
		        $('.cat_wrap .cat_list .float').removeClass('active');
		    }
		    $('.cat_subcont').mouseenter(function(){
		        clearTimeout(thisTime);
		        $('.cat_subcont').addClass('active');
		    });
		    $('.cat_subcont').mouseleave(function(){
		        $('.cat_subcont').removeClass('active');
		        $('.cat_wrap .cat_list .float').removeClass('active');
		    });
		});     
    </script>
</html>