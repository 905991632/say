$(document).ready(function(){
	$("#bottom_record").css("border-bottom","2px solid #ff8000");
	$("#right_bottom_appraisal").css("display","none");
	click_pageNum(1);
$("#bottom_record").click(
	function(){
		click_pageNum(1);
		$("#bottom_record").css("border-bottom","2px solid #ff8000");
		$("#bottom_appraisal").css("border-bottom","");
		
		$("#right_bottom_record").css("display","block");
		$("#right_bottom_appraisal").css("display","none");
	}
);

$("#bottom_appraisal").click(
	function(){
		click_pageNum1(1);
		$("#bottom_record").css("border-bottom","");
		$("#bottom_appraisal").css("border-bottom","2px solid #ff8000");
		
		$("#right_bottom_record").css("display","none");
		$("#right_bottom_appraisal").css("display","block");
	}
);
});

//评价我的 ajax请求
function click_pageNum(pageNum){
	$.ajax({
		type : "POST",
		url: "student_appraisal_ajax_appraisalMe?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#appraisalMe").text("");
				$("#appraisalMe_nav").text("");
			}else{
				$("#appraisalMe").text("");
			$.each(list,function(i,item){
				var tr_str = '<tr><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+item.teacherid
				+'</td><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+item.content
				+'</td><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+item.score
				+'</td><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+ new Date(item.createtime).toLocaleString()+'</td></tr>';
				$("#appraisalMe").append(tr_str);
			});
			var nav_str = add_nav(pageNum,totalPage);
			$("#appraisalMe_nav").text("");
			$("#appraisalMe_nav").append(nav_str);
			}
		}
	});
}

function add_nav(pageNum,totalPage){
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


//我的评价ajax请求
function click_pageNum1(pageNum){
	$("#div_apply").css("display","none");
	$.ajax({
		type : "POST",
		url: "student_appraisal_ajax_myAppraisal?pageNum=" + pageNum,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		error : function() {
			alert("请求失败，请重试！");
		},
		success:function (data) {
			var list = data.list;
			var totalPage = data.totalPage;
			if(list.length==0){
				$("#myAppraisal").text("");
				$("#myAppraisal_nav").text("");
			}else{
				$("#myAppraisal").text("");
			$.each(list,function(i,item){
				var tr_str = '<tr><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+item.teacherid
				+'</td><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+item.content
				+'</td><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+item.score
				+'</td><td style="width: 100px;table-layout:fixed; word-break: break-all; word-wrap: break-word;">'+ new Date(item.createtime).toLocaleString()+'</td></tr>';
				$("#myAppraisal").append(tr_str);
			});
			var nav_str = add_nav1(pageNum,totalPage);
			$("#myAppraisal_nav").text("");
			$("#myAppraisal_nav").append(nav_str);
		}
		}
	});}
	
	function add_nav1(pageNum,totalPage){
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
	

