$(document).ready(function(){
	$("#bottom_unfinished").css("border-bottom","2px solid #ff8000");
	$("#div_finished").css("display","none");
	click_pageNum(1);                                          
	$("#bottom_unfinished").click(function(){
		click_pageNum(1);
		$("#bottom_unfinished").css("border-bottom","2px solid #ff8000");
		$("#bottom_finished").css("border-bottom","");
		$("#div_unfinished").css("display","");
		$("#div_finished").css("display","none");
	});
	$("#bottom_finished").click(function(){
		click_pageNum1(1);
		$("#bottom_finished").css("border-bottom","2px solid #ff8000");
		$("#bottom_unfinished").css("border-bottom","");
		$("#div_finished").css("display","");
		$("#div_unfinished").css("display","none");
	});
});


//预约中ajax请求
function click_pageNum(pageNum){
	$.ajax({
		type : "POST",
		url: "student_myOrder_ajax_order?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#order_tbody").text("");
				$("#order_nav").text("");
			}else{
				$("#order_tbody").text("");
			$.each(list,function(i,item){
				var tr_str = '<tr><td><a href="toRequirement_info?id='+item.requireid+'" target="_blank">'+item.requireid+'</a>'
							+'</td><td><a href="toTeacher_detail?id='+item.teacherid+'" target="_blank">'+item.teacherid+'</a></td><td>'+ new Date(item.createtime).toLocaleString()
							+'</td><td><a href="javascript:void(0);" onclick="lookup_apply('+pageNum+','+item.id+')" class="label label-danger">取消</a>'
							+'</td></tr>';
				$("#order_tbody").append(tr_str);
			});
			var nav_str = add_nav(pageNum,totalPage);
			$("#order_nav").text("");
			$("#order_nav").append(nav_str);
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

//未通过订单ajax请求
function click_pageNum1(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "student_myOrder_ajax_reject?pageNum=" + pageNum,
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
				var tr_str = '<tr><td><a href="toRequirement_info?id='+item.requireid+'" target="_blank">'+item.requireid+'</a>'
				+'</td><td>'+ new Date(item.createtime).toLocaleString()+'</td></tr>';
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

	//家教信息取消的ajax请求
	function lookup_apply(pageNum,applyid){
		$.ajax({
			type : "POST",
			url: "student_myOrder_ajax_cancel?id="+applyid,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				if(data==1){
					click_pageNum(pageNum);
				}else{
					alert("请求失败，请重试！");
				}
			}
		});}


