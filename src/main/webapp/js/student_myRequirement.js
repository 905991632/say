$(document).ready(function(){
	$("#bottom_unfinished").css("border-bottom","2px solid #ff8000");
	$("#div_finished").css("display","none");
	
	$("#bottom_unfinished").click(function(){
		$("#bottom_unfinished").css("border-bottom","2px solid #ff8000");
		$("#bottom_finished").css("border-bottom","");
		$("#div_unfinished").css("display","");
		$("#div_finished").css("display","none");
		
	});
	$("#bottom_finished").click(function(){
		$("#bottom_finished").css("border-bottom","2px solid #ff8000");
		$("#bottom_unfinished").css("border-bottom","");
		$("#div_finished").css("display","");
		$("#div_unfinished").css("display","none");
	});
});

function a(){
	alert(1);
}



function add_nav(pageNum){
	var nav_str='<nav class="cbp-spmenu-right bbbb">'
				+'<ul class="pagination">';
	if(pageNum==1 || totalPage==0){
		nav_str+='<li class="disabled"><a>首页</a></li>'
				+'<li class="disabled"><a aria-label="Previous"><span aria-hidden="true">«</span></a></li>';
	}else{
		nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum(1)">首页</a></li>'
				+'<li><a href="javascript:void(0);" onclick="click_pageNum('+pageNum-1+')" aria-label="Previous">'
				+'<span aria-hidden="true">«</span></a></li>';															 									
	}
	for(var k=1;k<=totalPage;k++){
		if(k==pageNum-4 || k==pageNum+4){
			nav_str+='<li><a>…</a></li>';	
		}else if(k==pageNum){
			nav_str+='<li class="active"><a>'+k+'<span class="sr-only"></span></a></li>';
		}else if(k<pageNum-4 || k>pageNum+4){
			
		}else{
			nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum('+pageNum
			+')">'+pageNum+'</a></li>';	
		}
	}
	if(pageNum==totalPage || totalPage==0){
		nav_str+='<li class="disabled"><a aria-label="Next"> <spanaria-hidden="true">»</span>'
				+'</a></li><li class="disabled"><a>尾页</a></li>';
	}else{
		nav_str+='<li><a href="javascript:void(0);" onclick="click_pageNum('+pageNum+') '
				+'aria-label="Next"> <span aria-hidden="true">»</span>'
				+'</a></li><li><a href="javascript:void(0);" onclick="click_pageNum('+totalPage
				+');">尾页</a>';
	}
	return nav_str;
}

function click_pageNum(pageNum){
	$.ajax({
		type : "POST",
		url: "student_myRequirement_ajax_getUnfinish?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			$.each(data,function(i,item){
				var tr_str = '<tr><td><a href="">'+item.id+'</a>'
				+'</td><td>'+item.course+'</td><td>'+item.createtime.toLocaleString()
				+'</td><td><a href="" class="label label-success">查看</a>'
				+'<a href="" class="label label-danger">取消</a></td></tr>';
				
				$("#unfinish_tbody").text("");
				$("#unfinish_tbody").append(tr_str);
			});
			var nav_str = add_nav(pageNum);
			$("#nav_insert").text("");
			$("#nav_insert").append(nav_str);
		}
	});
}

