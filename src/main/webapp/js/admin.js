$(document).ready(function(){
	$("#bottom_unfinished").css("border-bottom","2px solid #ff8000");
	$("#div_finished").css("display","none");
	$("#div_apply").css("display","none");
	click_pageNum(1);
	$("#bottom_unfinished").click(function(){
		click_pageNum(1);
		$("#bottom_unfinished").css("border-bottom","2px solid #ff8000");
		$("#bottom_finished").css("border-bottom","");
		$("#div_unfinished").css("display","");
		$("#div_finished").css("display","none");
		$("#div_apply").css("display","none");
	});
	$("#bottom_finished").click(function(){
		click_pageNum1(1);
		$("#bottom_finished").css("border-bottom","2px solid #ff8000");
		$("#bottom_unfinished").css("border-bottom","");
		$("#div_finished").css("display","");
		$("#div_unfinished").css("display","none");
		$("#div_apply").css("display","none");
	});
});

function lookup(teacherid){
	$("#div_apply").css("display","");
	click_pageNum2(teacherid);
}

//教师审核拒绝的点击按钮事件
function reject_teacher(teacherid){
	 var r=confirm("确定拒绝该教师？")
	  if (r==true){
		 click_pageNum3(teacherid);
	  }
}

//教师审核接受的点击按钮事件
function accept_teacher(teacherid){
	 var r=confirm("确定接受该教师？")
	 if (r==true){
		click_pageNum4(teacherid);
	}
}

//直播申请拒绝的点击按钮事件
function reject_tutorlive(id){
	 var r=confirm("确定拒绝该直播申请？")
	  if (r==true){
		 click_pageNum5(id);
	  }
}

//直播申请接受的点击按钮事件
function accept_tutorlive(id){
	 var r=confirm("确定接受该直播申请？")
	 if (r==true){
		click_pageNum6(id);
	}
}


//教师审核信息ajax请求
function click_pageNum(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "admin_ajax_getTeacher?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#unfinish_tbody").text("");
				$("#unfinish_nav_insert").text("");
			}else{
				$("#unfinish_tbody").text("");
			$.each(list,function(i,item){
				var tr_str = '<tr><td>'+item.id+'</td><td>'+item.name+'</td><td>'+item.sex+'</td><td>'+item.age+'</td><td>'+item.price+'</td>'
				+'<td><a href="javascript:void(0);" onclick="lookup('+item.id+')" class="label label-success">查看</a></tr>';
				$("#unfinish_tbody").append(tr_str);
			});
			var nav_str = add_nav(pageNum,totalPage);
			$("#unfinish_nav_insert").text("");
			$("#unfinish_nav_insert").append(nav_str);
			}
		}
	});
}

function add_nav(pageNum,totalPage){
	if(pageNum>totalPage){
		pageNum=pageNum-1;
	}
	var nav_str;
		nav_str='<nav class="cbp-spmenu-right bbbb">'
				+'<ul class="pagination">';
	if(pageNum==1 || totalPage==0){
		nav_str+='<li class="disabled"><a>首页</a></li>'
				+'<li class="disabled"><a aria-label="Previous"><span aria-hidden="true">«</span></a></li>';
	}else{
		nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum(1);">首页</a></li>'
				+'<li><a href="javascript:void(0);" onclick="click_pageNum('+(pageNum-1)+');" aria-label="Previous">'
				+'<span aria-hidden="true">«</span></a></li>';															 									
	}
	for(var k=1;k<=totalPage;k++){
		if(k==pageNum-4 || k==pageNum+4){
			nav_str+='<li><a>…</a></li>';	
		}else if(k==pageNum){
			nav_str+='<li class="active"><a>'+k+'<span class="sr-only"></span></a></li>';
		}else if(k<pageNum-4 || k>pageNum+4){
			
		}else{
			nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum('+k
			+')">'+k+'</a></li>';	
		}
	}
	if(pageNum==totalPage || totalPage==0){
		nav_str+='<li class="disabled"><a aria-label="Next"> <spanaria-hidden="true">»</span>'
				+'</a></li><li class="disabled"><a>尾页</a></li>';
	}else{
		nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum('+(pageNum+1)+')" '
				+'aria-label="Next"> <span aria-hidden="true">»</span>'
				+'</a></li><li><a href="javascript:void(0);" onclick="click_pageNum('+totalPage
				+');">尾页</a>';
	}
	return nav_str;
}

//查看身份证
function click_pageNum2(teacherid){
	$.ajax({
		type : "POST",
		url: "admin_ajax_getIdCard?teacherid="+teacherid,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			$("#div_img").text("");
			$("#div_opera").text("");
			var img ='<img src="'+data.idcard+'" width="900" height="600">';
			var opera ='<a href="javascript:void(0);" onclick="accept_teacher('+data.id+')" class="label label-success" style="font-size: 20px;">接受</a>'
					  +'<a href="javascript:void(0);" onclick="reject_teacher('+data.id+')" class="label label-danger" style="font-size: 20px;">拒绝</a>';
			$("#div_img").append(img);
			$("#div_opera").append(opera);
			$("#div_apply").css("display","");
			}});
	}

//教师审核不通过的ajax请求
function click_pageNum3(teacherid){
	$.ajax({
		type : "POST",
		url: "admin_ajax_teacherReject?teacherid="+teacherid,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			if(data==1){
				click_pageNum(1);
			}else{
				alert("请求失败，请重试！");
			}
		}
	});}

//教师审核通过的ajax请求
function click_pageNum4(teacherid){
	$.ajax({
		type : "POST",
		url: "admin_ajax_teacherAccept?teacherid="+teacherid,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			if(data==1){
				click_pageNum(1);
			}else{
				alert("请求失败，请重试！");
			}
		}
	});}


//直播申请ajax请求
function click_pageNum1(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "admin_ajax_getTutorLive?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#finish_tbody").text("");
				$("#finish_nav_insert").text("");
			}else{
				$("#finish_tbody").text("");
			$.each(list,function(i,item){
			var tr_str = '<tr><td>'+item.teacherid+'</td><td>'+new Date(item.createtime).toLocaleString()
						+'</td><td><a href="javascript:void(0);" onclick="accept_tutorlive('+item.id+')" class="label label-success">接受</a>'
						+'<a href="javascript:void(0);" onclick="reject_tutorlive('+item.id+')" class="label label-danger">拒绝</a></td></tr>';
			$("#finish_tbody").append(tr_str);
			});
			var nav_str = add_nav1(pageNum,totalPage);
			$("#finish_nav_insert").text("");
			$("#finish_nav_insert").append(nav_str);
		}
		}
	});}
	
	function add_nav1(pageNum,totalPage){
		if(pageNum>totalPage){
			pageNum=pageNum-1;
		}
		var nav_str;
			nav_str='<nav class="cbp-spmenu-right bbbb">'
					+'<ul class="pagination">';
		if(pageNum==1 || totalPage==0){
			nav_str+='<li class="disabled"><a>首页</a></li>'
					+'<li class="disabled"><a aria-label="Previous"><span aria-hidden="true">«</span></a></li>';
		}else{
			nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum1(1);">首页</a></li>'
					+'<li><a href="javascript:void(0);" onclick="click_pageNum1('+(pageNum-1)+');" aria-label="Previous">'
					+'<span aria-hidden="true">«</span></a></li>';															 									
		}
		for(var k=1;k<=totalPage;k++){
			if(k==pageNum-4 || k==pageNum+4){
				nav_str+='<li><a>…</a></li>';	
			}else if(k==pageNum){
				nav_str+='<li class="active"><a>'+k+'<span class="sr-only"></span></a></li>';
			}else if(k<pageNum-4 || k>pageNum+4){
				
			}else{
				nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum1('+k
				+')">'+k+'</a></li>';	
			}
		}
		if(pageNum==totalPage || totalPage==0){
			nav_str+='<li class="disabled"><a aria-label="Next"> <spanaria-hidden="true">»</span>'
					+'</a></li><li class="disabled"><a>尾页</a></li>';
		}else{
			nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum1('+(pageNum+1)+')" '
					+'aria-label="Next"> <span aria-hidden="true">»</span>'
					+'</a></li><li><a href="javascript:void(0);" onclick="click_pageNum1('+totalPage
					+');">尾页</a>';
		}
		return nav_str;
	}	
	

	//直播申请拒绝的ajax请求
	function click_pageNum5(id){
		$.ajax({
			type : "POST",
			url: "admin_ajax_tutorLiveReject?id="+id,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				if(data==1){
					click_pageNum1(1);
				}else{
					alert("请求失败，请重试！");
				}
			}
		});}

	//直播申请接受的ajax请求
	function click_pageNum6(id){
		$.ajax({
			type : "POST",
			url: "admin_ajax_tutorLiveAccept?id="+id,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				if(data==1){
					click_pageNum1(1);
				}else{
					alert("请求失败，请重试！");
				}
			}
		});}
















