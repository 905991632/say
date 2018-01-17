function enableSubmit(bool) {

		if(bool) $("#submit").removeAttr("disabled");
		
		else $("#submit").attr("disabled", "disabled");

	}

	function v_submitbutton() {

		if($("#agree").attr("checked") != "checked") {

			enableSubmit(false);

			$(".readagreement-wrap").css("outline", "1px solid #f99");

			return;

		} else { $(".readagreement-wrap").css("outline", "1px solid #9f9"); }

		for(f in flags)
			if(!flags[f]) { enableSubmit(false); return; }

		enableSubmit(true);

	}

	function showAgreement() {

		$("#readagreement").removeAttr("onclick");

		$("#agreement").show();

		$("#agreement iframe").attr("src", "http://www.runoob.com"); //此处为链接地址

	}

	function agree() {

		$("#agreement").hide();

		$("#readagreement").attr("onclick", "showAgreement();");

		if($("#agree").attr("checked") != "checked") $("#agree").trigger("click");

	}

	function onReadAgreementClick() {

		return;

		if($("#agree").attr("checked")) {

			$("#agree").removeAttr("checked");

		} else {

			$("#agree").attr("checked", "checked");

		}

		v_submitbutton();

	}

	var flags = [false, false, false];

	//只能输入6-16个字母、数字、下划线

	var RegUsername = /^(\w){6,16}$/;

	function lineState(name, state, msg) {

		if(state == "none") { $("#line_" + name + " .input div").attr("class", "none"); return; }

		if(state == "corect") { $("#line_" + name + " .input div").attr("class", "corect"); return; }

		$("#line_" + name + " .input span").text(msg);
		$("#line_" + name + " .input div").attr("class", "error");

	}

	function v_account() {

		var account = $("#username").val();

		if(!RegUsername.test(account)&&account!="") { lineState("account", "error", "用户格式不正确");
			flags[0] = false;
			enableSubmit(false); } else { lineState("account", "corect", "");
			flags[0] = true; }

/*		var code = $("#barcodeNumber").val();
	    $.ajax({
	        type:"GET",   //http请求方式
	        url:"isExist", //发送给服务器的url
	        data:"barcodeNumber="+code, //发送给服务器的参数
	        dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
	        complete:function(msg) {
				if (eval("(" + msg.responseText + ")")) {
					$("#msg").html("<font color='red'>条形码已存在</font>");
				} else {
					$("#msg").html("");
				}
	        }//定义交互完成,并且服务器正确返回数据时调用回调函数 
	    });*/
		
		
		
		
		
		
		
		
		
		
		v_submitbutton();

	}
	
	
	
	

	function v_password() {

		var password = $("#inputPassword").val();

		if((password.length>16||password.length<6)&&password!="") { lineState("password", "error", "密码格式不正确");
			flags[1] = false; } 
		else {
				lineState("password", "corect", "");
				flags[1] = true;
			}
		v_submitbutton();

	}

	function v_repeat() {

		if(!flags[1]) { lineState("repeat", "none", ""); return; }

		if(($("#inputPassword").val() != $("#inputPasswordConfirm").val()) && ($("#inputPasswordConfirm").val()!="")) { lineState("repeat", "error", "密码不一致");
			flags[2] = false; } else {

			lineState("repeat", "corect", "");

			flags[2] = true;

		}

		v_submitbutton();

	}

	function adaptValue(bool) {
		return bool;
	}
	
function switchItem(tag){
	var student = document.getElementById("studentPart");
	var teacher = document.getElementById("teacherPart");
	var leftpart = document.getElementById("left");
	var rightpart = document.getElementById("right");
	var formbak = document.getElementById("form-bak");
	if(tag=="student"){
		leftpart.className="left1";
		rightpart.className="right1";
		formbak.className="form-bak1";
		student.style.display = "";
		teacher.style.display = "none";
	}else{
		leftpart.className="left2";
		rightpart.className="right2";
		formbak.className="form-bak2"
		student.style.display = "none";
		teacher.style.display = "";		
	}
}
	

	
	