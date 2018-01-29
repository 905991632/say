$(document).ready(function(){
	click_pageNum(1);
});


//订单接受的ajax请求
function click_pageNum1(requireid){
	var r=confirm("确定接受？")
	if (r==true){
		$.ajax({
			type : "POST",
			url: "teacher_myOrder_ajax_accept?requireid="+requireid,
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
	});}}

//订单拒绝的ajax请求
function click_pageNum2(requireid){
	var r=confirm("一但拒绝将无法恢复，确定拒绝？")
	if (r==true){
		$.ajax({
			type : "POST",
			url: "teacher_myOrder_ajax_reject?requireid="+requireid,
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
		});}}

//获取我的预约ajax
function click_pageNum(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "teacher_myOrder_ajax_getMyOrder?pageNum=" + pageNum,
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
				var tr_str = '<tr><td><a href="toRequirement_info?id='+item.id+'" target="_blank">'+item.id+'</a>'
				+'</td><td>'+item.course+'</td><td>'+ new Date(item.createtime).toLocaleString()
				+'</td><td><a href="javascript:void(0);" onclick="click_pageNum1('+item.id+')" class="label label-success">接受</a>'
				+'<a href="javascript:void(0);" onclick="click_pageNum2('+item.id+')" class="label label-danger">拒绝</a></td></tr>';
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



