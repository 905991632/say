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

//查看的点击按钮事件
function lookup_apply(requireid){
	$("#div_apply").css("display","");
	click_pageNum2(1,requireid);
}

//拒绝的点击按钮事件
function reject_apply(applyid,pageNum,requireid){
	 var r=confirm("一但拒绝无法恢复，确定拒绝该教师？")
	  if (r==true){
		 click_pageNum3(applyid,pageNum,requireid);
	  }
}

//接受的点击按钮事件
function accept_apply(applyid){
	 var r=confirm("一但接受其余申请会被拒绝，确定接受该教师？")
	 if (r==true){
		click_pageNum4(applyid);
	}
}

//取消的点击按钮事件
function cancel_requirement(requireid){
	var r=confirm("一但取消家教信息将无法恢复，确定取消？")
	if (r==true){
		click_pageNum5(1,requireid);
	}
}



//未完成订单ajax请求
function click_pageNum(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "student_myRequirement_ajax_getUnfinish?pageNum=" + pageNum,
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
				var tr_str = '<tr><td><a href="toRequirement_info?id='+item.id+'" target="_blank">'+item.id+'</a>'
				+'</td><td>'+item.course+'</td><td>'+ new Date(item.createtime).toLocaleString()
				+'</td><td><a href="javascript:void(0);" onclick="lookup_apply('+item.id+')" class="label label-success">查看</a>'
				+'<a href="javascript:void(0);" onclick="cancel_requirement('+item.id+')" class="label label-danger">取消</a></td></tr>';
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



//已完成订单ajax请求
function click_pageNum1(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "student_myRequirement_ajax_getFinish?pageNum=" + pageNum,
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
				var tr_str = '<tr><td><a href="toRequirement_info?id='+item.id+'" target="_blank">'+item.id+'</a>'
				+'</td><td>'+item.course+'</td><td>'+new Date(item.createtime).toLocaleString()
				+'</td></tr>';
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
	

	//订单申请情况ajax请求
	function click_pageNum2(pageNum,requireid){
		$.ajax({
			type : "POST",
			url: "student_myRequirement_ajax_getApply?pageNum=" + pageNum+"&requireid="+requireid,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				var list = data.list;
				var totalPage = data.totalPage;
				if(list.length==0){
					$("#display_tbody").text("");
					$("#display_nav_insert").text("");
				}else{
					$("#display_tbody").text("");
				$.each(list,function(i,item){
					var tr_str = '<tr><td><a href="toTeacher_detail?id='+item.teacherid+'" target="_blank">'+item.teacherid+'</a>'
					+'</td><td>'+new Date(item.createtime).toLocaleString()+'</td>'
					+'<td><a href="javascript:void(0);" onclick="accept_apply('+item.id+')" class="label label-success">接受</a> <a '
					+'href="javascript:void(0);" onclick="reject_apply('+item.id+','+pageNum+','+requireid+')" '
					+'class="label label-danger">拒绝</a></td></tr>';
					$("#display_tbody").append(tr_str);
				});
				var nav_str = add_nav2(pageNum,totalPage,requireid);
				$("#display_nav_insert").text("");
				$("#display_nav_insert").append(nav_str);
			}}
		});}	
	
	function add_nav2(pageNum,totalPage,requireid){
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
			nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum2(1,'+requireid+');">首页</a></li>'
					+'<li><a href="javascript:void(0);" onclick="click_pageNum2('+(pageNum-1)+','+requireid+');" aria-label="Previous">'
					+'<span aria-hidden="true">«</span></a></li>';															 									
		}
		for(var k=1;k<=totalPage;k++){
			if(k==pageNum-4 || k==pageNum+4){
				nav_str+='<li><a>…</a></li>';	
			}else if(k==pageNum){
				nav_str+='<li class="active"><a>'+k+'<span class="sr-only"></span></a></li>';
			}else if(k<pageNum-4 || k>pageNum+4){
				
			}else{
				nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum2('+k
				+','+requireid+')">'+k+'</a></li>';	
			}
		}
		if(pageNum==totalPage || totalPage==0){
			nav_str+='<li class="disabled"><a aria-label="Next"> <spanaria-hidden="true">»</span>'
					+'</a></li><li class="disabled"><a>尾页</a></li>';
		}else{
			nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum2('+(pageNum+1)+','+requireid+')" '
					+'aria-label="Next"> <span aria-hidden="true">»</span>'
					+'</a></li><li><a href="javascript:void(0);" onclick="click_pageNum2('+totalPage
					+','+requireid+');">尾页</a>';
		}
		return nav_str;
	}	

	//订单申请拒绝的ajax请求
	function click_pageNum3(applyid,pageNum,requireid){
		$.ajax({
			type : "POST",
			url: "student_myRequirement_ajax_reject?applyid="+applyid,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				if(data==1){
					click_pageNum2(pageNum,requireid);
				}else{
					alert("请求失败，请重试！");
				}
			}
		});}

	//订单申请接受的ajax请求
	function click_pageNum4(applyid){
		$.ajax({
			type : "POST",
			url: "student_myRequirement_ajax_accept?applyid="+applyid,
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
	
	//家教信息取消的ajax请求
	function click_pageNum5(pageNum,requireid){
		$.ajax({
			type : "POST",
			url: "student_myRequirement_ajax_cancel?requireid="+requireid,
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


