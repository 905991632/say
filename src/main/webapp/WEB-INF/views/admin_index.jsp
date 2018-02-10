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
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
</head>
<body style="overflow-y: scroll;">

	<!-- 主内容 -->
	<div style="width: 1200px;overflow: hidden;margin: 0 auto;margin-top: 30px;">
		<!-- 右板块 -->
		<div style="width: 1200px;border: 1px solid;border-color: #e4e4e4;text-align: center;overflow: hidden;">
			<div style="width: 1200px;margin: 0 auto;margin-top: 30px;overflow: hidden;margin-bottom: 30px;">
				<div class="right_div_div2_div1">
					<a href="javascript:void(0);" id="bottom_unfinished"
						name="bottom_record">教师审核</a> <a href="javascript:void(0);"
						id="bottom_finished" name="bottom_appraisal">直播申请</a>
				</div>
				
				<div style="margin: 0 auto;margin-top:10px;overflow: hidden;width: 1150px;" id="div_unfinished">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">编号</th>
								<th style="text-align: center;width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">姓名</th>
								<th style="text-align: center;width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">性别</th>
								<th style="text-align: center;width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">年龄</th>
								<th style="text-align: center;width: 500px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">薪资要求</th>
								<th style="text-align: center;width: 250px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center;" id="unfinish_tbody">
							
						</tbody>
					</table>
					<div id="unfinish_nav_insert">
					
					</div>
				</div>



				<div style="margin: 0 auto;margin-top:10px;overflow: hidden;width: 600px;" id="div_finished">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;width: 200px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">教师编号</th>
								<th style="text-align: center;width: 200px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">申请时间</th>
								<th style="text-align: center;width: 200px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center;" id="finish_tbody">
							<tr>
								<td>123456789</td>
								<td>2018-05-08 18:13:12</td>
								<td>
									<a href="javascript:void(0);" onclick="javascript:alert(1)" class="label label-success">接受</a>
									<a href="javascript:void(0);" onclick="javascript:alert(1)" class="label label-danger">拒绝</a>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="finish_nav_insert">
					
					</div>
				</div>

				<div style="margin: 0 auto;margin-top:10px;overflow: hidden;width: 1200px;" id="div_apply">
					<div class="right_div_div2_div1">
						<a href="javascript:void(0);" id="display_apply"
							name="display_apply">身份证(请勿泄露)</a>
					</div>
					<div style="width: 900px;height: 600px;margin: 0 auto;" id="div_img">
						<img src="img/timg.jpg" width="900" height="600">
					</div>
					<div style="width: 300px;height: 120px;margin: 0 auto;margin-top: 30px;" id="div_opera">
						<a href="javascript:void(0);" onclick="javascript:alert(1)" class="label label-success" style="font-size: 20px;">接受</a>
						<a href="javascript:void(0);" onclick="javascript:alert(1)" class="label label-danger" style="font-size: 20px;">拒绝</a>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>


</html>
