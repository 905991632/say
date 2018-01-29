$(document).ready(function(){
	$("#bottom_1").css("border-bottom","2px solid #ff8000");
	$("#bottom_2_div").css("display","none");
	$("#bottom_3_div").css("display","none");
	click_pageNum(1);
	$("#bottom_1").click(function(){
		$("#bottom_1").css("border-bottom","2px solid #ff8000");
		$("#bottom_2").css("border-bottom","");
		$("#bottom_3").css("border-bottom","");
		$("#bottom_1_div").css("display","");
		$("#bottom_2_div").css("display","none");
		$("#bottom_3_div").css("display","none");
		click_pageNum(1);
	});
	$("#bottom_2").click(function(){
		click_pageNum1(1);
		$("#bottom_1").css("border-bottom","");
		$("#bottom_2").css("border-bottom","2px solid #ff8000");
		$("#bottom_3").css("border-bottom","");
		$("#bottom_1_div").css("display","none");
		$("#bottom_2_div").css("display","");
		$("#bottom_3_div").css("display","none");
	});
	$("#bottom_3").click(function(){
		click_pageNum2(1);
		$("#bottom_1").css("border-bottom","");
		$("#bottom_2").css("border-bottom","");
		$("#bottom_3").css("border-bottom","2px solid #ff8000");
		$("#bottom_1_div").css("display","none");
		$("#bottom_2_div").css("display","none");
		$("#bottom_3_div").css("display","");
	});
});


//取消的点击按钮事件
function cancel_requirement(requireid){
	var r=confirm("一但取消下单将无法恢复，确定取消？")
	if (r==true){
		click_pageNum3(requireid);
	}
}

//订单取消的ajax请求
function click_pageNum3(requireid){
	$.ajax({
		type : "POST",
		url: "teacher_myRequirement_ajax_reject?requireid="+requireid,
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





//审核中ajax请求
function click_pageNum(pageNum){
	$.ajax({
		type : "POST",
		url: "teacher_myRequirement_ajax_getCheck?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#check_tbody").text("");
				$("#check_nav").text("");
			}else{
				$("#check_tbody").text("");
			$.each(list,function(i,item){
				var tr_str = '<tr><td><a href="toRequirement_info?id='+item.id+'" target="_blank">'+item.id+'</a>'
							+'</td><td>'+item.course+'</td><td>'+ new Date(item.createtime).toLocaleString()
							+'</td><td><a href="javascript:void(0);" onclick="cancel_requirement('+item.id+')" class="label label-danger">取消</a></td></tr>';
				$("#check_tbody").append(tr_str);
			});
			var nav_str = add_nav(pageNum,totalPage);
			$("#check_nav").text("");
			$("#check_nav").append(nav_str);
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

//未通过ajax请求
function click_pageNum1(pageNum){
	$.ajax({
		type : "POST",
		url: "teacher_myRequirement_ajax_getReject?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#reject_tbody").text("");
				$("#reject_nav").text("");
			}else{
				$("#reject_tbody").text("");
			$.each(list,function(i,item){
				var tr_str = '<tr><td>'+item.id+'</td><td>'+item.course+'</td><td>'+ new Date(item.createtime).toLocaleString()+'</td></tr>';
				$("#reject_tbody").append(tr_str);
			});
			var nav_str = add_nav1(pageNum,totalPage);
			$("#reject_nav").text("");
			$("#reject_nav").append(nav_str);
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
	
	//已完成ajax请求
		function click_pageNum2(pageNum){
			$.ajax({
				type : "POST",
				url: "teacher_myRequirement_ajax_getFinish?pageNum=" + pageNum,
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
						$("#finish_nav").text("");
					}else{
						$("#finish_tbody").text("");
					$.each(list,function(i,item){
						var tr_str = '<tr><td>'+item.id+'</td><td>'+item.course+'</td><td>'+ new Date(item.createtime).toLocaleString()+'</td></tr>';
						$("#finish_tbody").append(tr_str);
					});
					var nav_str = add_nav2(pageNum,totalPage);
					$("#finish_nav").text("");
					$("#finish_nav").append(nav_str);
				}}
			});}	
		
		function add_nav2(pageNum,totalPage){
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
				nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum2(1);">首页</a></li>'
						+'<li><a href="javascript:void(0);" onclick="click_pageNum2('+(pageNum-1)+');" aria-label="Previous">'
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
				nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum2('+(pageNum+1)+')" '
						+'aria-label="Next"> <span aria-hidden="true">»</span>'
						+'</a></li><li><a href="javascript:void(0);" onclick="click_pageNum2('+totalPage+');">尾页</a>';
			}
			return nav_str;
		}	






