$(document).ready(function(){
	var URL="";
	$(".sx_child").click(function(){
	var i = URL,
		n = $(this).attr("rel"),
		r = $(this).attr("name");
	  URL = "";
	  URL = changeURLPar(i, r, n);
	  setCss(URL);
	  click_pageNum(1,URL);
});

$(".all").click(function(){
	var i = URL,
		n = $(this).attr("name");
	  $("[name=" + n + "]").removeClass("on");
	  $(this).addClass("on");
	  URL = "";
	  URL = delUrlPar(i, n);
	  click_pageNum(1,URL);
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
	})
}





function changeURLPar(_url,_name,_rel){
	var a = _name +'='+_rel;
	var s = getQueryString(_url,_name);
	return _url.match(_name) ? _url = _url.replace(s,_rel) : _url+"&"+a;
}

function getQueryString(_url,_name){
	var e = new RegExp("(^|&)" +_name+"=([^&]*)(&|$)", "i"),
		result = _url.match(e);
	return null != result ? result[2]: null;
}

function delUrlPar(_url,_name){
	var n = _url;
	var r = "";
	var a = "";
	var b = "";
	alert(_url);
	if(n.indexOf("&") != -1) {
		r = n.split("&");
		for(i in r) r[i].split("=")[0] != _name && (a = a + r[i].split("=")[0] + "=" + r[i].split("=")[1] + "&");
		return a.substr(0, a.length - 1);
	}else{
		r = n.split("=");
		if(r[0] == _name){
			return b;
		}else{
			return _url;
		}
		
	}
}



	function click_pageNum(pageNum,url){
		$.ajax({
			type : "POST",
			url: "tagSelect_test?"+url+"&pageNum" + pageNum,
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			error : function() {
				alert("请求失败，请重试！");
			},
			success:function (data) {
				alert("请求成功");
			}
			
			});
				}


