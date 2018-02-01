var url="";
//1、通过url设置html样式
function setCss(url1){
	
	$(".sx_child").each(function(i,item){
		var i = $(item).attr("name") + "=" + $(item).attr("rel"),
			n = new RegExp(i,"g");
		if(n.test(url1)) {
			$(item).addClass("on");
			
		} else {
			$(item).removeClass("on");
		}
	})
}


$(".sx_child").click(function(){
	var i = url,
		n = $(this).attr("rel"),
		r = $(this).attr("name");
	  url = changeURLPar(i, r, n);
	  setCss(url);
	  alert(url);
});

$(".all").click(function(){
	var i = url,
		n = $(this).attr("name");
	  $("[name=" + n + "]").removeClass("on");
	  $(this).addClass("on");
	  url = delUrlPar(i, n);
	  setCss(url);
	  alert(url);
});


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
	var r = "",
	a = "";
	if(n.indexOf("&") != -1) {
		r = n.split("&");
		for(i in r) r[i].split("=")[0] != _name && (a = a + r[i].split("=")[0] + "=" + r[i].split("=")[1] + "&");
		return a.substr(0, a.length - 1);
	}
	return r = n.split("="), r[0] == _name ? "" : _url;
}
