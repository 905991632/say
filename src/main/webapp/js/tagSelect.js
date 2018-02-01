var URL="?";
$(document).ready(function(){
	
	var area = $("#choose");
    var cityText,cityItem,areaItem;
     $.each(provinceList,function(i,item){
        if(USER_PROVINCE == item.name){
            cityItem=i;
            return cityItem
        }
    });
     
    $.each(provinceList[cityItem].cityList,function(i,item){
        if(USER_CITY == item.name){
             for(var n=0;n<item.areaList.length;n++){
                addEle(area,item.areaList[n])
            }
        }
    });
	
	click_pageNum(1);
	$(".sx_child").click(function(){
		var i = URL,
			n = $(this).attr("rel"),
			r = $(this).attr("name");
		  URL = changeURLPar(i, r, n);
		  setCss(URL);
		  click_pageNum(1);
	});

	$(".all").click(function(){
		var i = URL,
			n = $(this).attr("name");
		  $("[name=" + n + "]").removeClass("on");
		  $(this).addClass("on");
		  URL = delUrlPar(i, n);
		  click_pageNum(1);
	});
	
});

//1、通过url设置html样式
function setCss(url1){
	$(".sx_child").each(function(i,item){
		var i = $(item).attr("name") + "=" + $(item).attr("rel"),
			n = new RegExp(i,"g");
		if(n.test(url1)) {
			var r = $(item).attr("name");
			$("[name=" + r + "]").eq(0).removeClass("on")
			$(item).addClass("on");
		} else {
			$(item).removeClass("on");
		}
	});
	
}

function changeURLPar(_url,_name,_rel){
	var a = _name +'='+_rel;
	var s = getQueryString(_url,_name);
	return _url.match(_name) ? _url = _url.replace(s,_rel) : _url.substr(1).length==0 ? _url+a : _url+"&"+a;
	
}

function getQueryString(_url,_name){
	
	_url = "&"+_url.substr(1, _url.length);
	var e = new RegExp("(^|&)" +_name+"=([^&]*)(&|$)", "i"),
		result = _url.match(e);
	return null != result ? result[2]: null;
}

function addEle(ele,value){
    var optionStr="";
    optionStr="<a href='javascript:void(0);' rel='"+value+"' name='area' class='sx_child'>"+value+"</a>";
    /*optionStr='<a href="javascript:void(0);" rel="'+value+'" name="area" class="sx_child"/>'+value;*/
    ele.append(optionStr);
}

function delUrlPar(_url,_name){
	var n = _url.substr(1);
	var r = "";
	var a = "";
	if(_url!="?"){
		if(n.indexOf("&")!=-1) {
		r = n.split("&");
		for(i in r){
			if(r[i].split("=")[0] != _name){
				a = a + r[i].split("=")[0] + "=" + r[i].split("=")[1] + "&";
			}
		}
		return a.substr(0, a.length - 1);
		}else{
			r = n.split("=");
			if(r[0] == _name){
				return "?";
			}else{
				return _url;
			}
		}
	}else{
		return _url;
	}
}

	//教师列表ajax请求
	function click_pageNum(pageNum){
		var url = "teacher_list_ajax_teacherList"+URL+"&pageNum="+pageNum;
		$.ajax({
			type : "POST",
			url: url,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				var list = data.list;
				var totalPage = data.totalPage;
				if(list.length==0){
					$("#list_tbody").text("");
					$("#list_nav").text("");
				}else{
					$("#list_tbody").text("");
				$.each(list,function(i,item){
					var tr_str = '<section><div><a href="toTeacher_detail?id='+item.id+'"  target="_blank"><img class="opcityaa" src="img/touming.png" /></a></div>'
								+'<div><img class="content_div_div2_img" src="'+item.photo+'"/><div class="content_div_div2_div"><div>教师编号：<span>'+item.id+'</span>'
								+'</div><div>教师姓名：<span>'+item.name+'</span></div><div>教师性别：<span>'+item.sex+'</span></div><div>教师年龄：<span>'+item.age+'</span>'
								+'</div></div></div></section>';
					$("#list_tbody").append(tr_str);
				});
				var nav_str = add_nav(pageNum,totalPage,URL);
				$("#list_nav").text("");
				$("#list_nav").append(nav_str);
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

