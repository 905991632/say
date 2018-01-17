function enableSubmit(bool) {

		if(bool) {
			$("#student_submit").removeAttr("disabled");
			$("#teacher_submit").removeAttr("disabled");
		}
		else {
			$("#student_submit").attr("disabled", "disabled");
			$("#teacher_submit").attr("disabled", "disabled");
		}

	}

	//显示红绿条
	function student_submitbutton() {
		if($("#student_agree").attr("checked") != "checked") {
			if($("#teacher_agree").attr("checked") == "checked"){
				$("#teacher_agree").trigger("click");
			}
			$(".readagreement-wrap").css("outline", "1px solid #f99");
			enableSubmit(false);
			return;
		} else { 
			if($("#teacher_agree").attr("checked") != "checked"){
				$("#teacher_agree").trigger("click");
			}
			$(".readagreement-wrap").css("outline", "1px solid #9f9");
			for(f in student_flags) if(!student_flags[f]) {enableSubmit(false); return;}
			enableSubmit(true);
		}
		


	}
	
		//显示红绿条
	function teacher_submitbutton() {
		if($("#teacher_agree").attr("checked") != "checked") {
			if($("#student_agree").attr("checked") == "checked"){
				$("#student_agree").trigger("click");
			}
			$(".readagreement-wrap").css("outline", "1px solid #f99");
			enableSubmit(false);
			return;
		} else { 
			if($("#student_agree").attr("checked") != "checked"){
				$("#student_agree").trigger("click");
			}
			$(".readagreement-wrap").css("outline", "1px solid #9f9");
			for(f in teacher_flags) if(!teacher_flags[f]) {enableSubmit(false); return;}
			enableSubmit(true);
		}
	}

	//点击'用户使用协议',执行显示用户协议
	function showAgreement() {
		//移除点击事件
		$("#student_readagreement").removeAttr("onclick");
		
		$("#teacher_readagreement").removeAttr("onclick");
	
		$("#agreement").show();

		$("#agreement iframe").attr("src", "toAgreement"); //此处为链接地址

		$("html,body").animate({scrollTop: $("#agreement").offset().top}, 100);
	}


	//点击协议的同意按钮
	function agree() {
		//隐藏页面
		$("#agreement").hide();
		//添加用户协议点击事件
		$("#student_readagreement").attr("onclick", "showAgreement();");
		
		$("#teacher_readagreement").attr("onclick", "showAgreement();");

		if($("#student_agree").attr("checked") != "checked") {
			$("#student_agree").trigger("click");
		}
		if($("#teacher_agree").attr("checked") != "checked") {
			$("#teacher_agree").trigger("click");
		}
	}

	//只能输入6-16个字母、数字、下划线
	var RegUsername = /^(\w){6,16}$/;
	var Age=/^([0-9]){1,2}$/;
	var Mobile=/^1[3|4|5|7|8][0-9]{9}$/;
	
	var student_flags = [false,false,false,false,false];
	var teacher_flags = [false,false,false,false,false];



	
	
	function lineState(name, state, msg) {

		if(state == "none") { 
			$("#line_" + name + " .input div").attr("class", "none");
			return; 
			}
		if(state == "corect") { 
			$("#line_" + name + " .input div").attr("class", "corect"); 
			return; 
			}
		$("#line_" + name + " .input span").text(msg);
		$("#line_" + name + " .input div").attr("class", "error");

	}

	function student_v_account() {

		var account = $("#student_username").val();

		if(!RegUsername.test(account)&&account!="") { 
			lineState("student_account", "error", "用户格式不正确");
			student_flags[0]=false;
			student_submitbutton();
		} else { 
			 $.ajax({
			        type:"GET",   //http请求方式
			        url:"isUsernameExist", //发送给服务器的url
			        data:"username="+account, //发送给服务器的参数
			        dataType:"text",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			        success:function(msg) {
						if(msg=="success"){
							student_flags[0]=false;
							student_submitbutton();
							lineState("student_account", "error", "用户已存在");
							
						}else{
							student_flags[0]=true;
							student_submitbutton();
							lineState("student_account", "corect", "");
							
						}
						
			        }//定义交互完成,并且服务器正确返回数据时调用回调函数 
			    });
		}
		
	}
	
	function teacher_v_account() {

		var account = $("#teacher_username").val();

		if(!RegUsername.test(account)&&account!="") { 
			lineState("teacher_account", "error", "用户格式不正确");
			teacher_flags[0]=false;
			teacher_submitbutton();
		} else { 
			$.ajax({
		        type:"GET",   //http请求方式
		        url:"isUsernameExist", //发送给服务器的url
		        data:"username="+account, //发送给服务器的参数
		        dataType:"text",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		        success:function(msg) {
					if(msg=="success"){
						teacher_flags[0]=false;
						teacher_submitbutton();
						lineState("teacher_account", "error", "用户已存在");	
					}else{
						teacher_flags[0]=true;
						teacher_submitbutton();
						lineState("teacher_account", "corect", "");
					}
		        }//定义交互完成,并且服务器正确返回数据时调用回调函数 
		    });
		}
	}
	
	function student_v_password() {

		var password = $("#student_inputPassword").val();

		if((password.length>16||password.length<6)&&password!=""){ 
			lineState("student_password", "error", "密码格式不正确"); 
			student_flags[1]=false;
		} else {
				lineState("student_password", "corect", "");
				student_flags[1]=true;
		}
		student_submitbutton()
	}

	function teacher_v_password() {

		var password = $("#teacher_inputPassword").val();

		if((password.length>16||password.length<6)&&password!=""){ 
			lineState("teacher_password", "error", "密码格式不正确"); 
			teacher_flags[1]=false;
		} else {
				lineState("teacher_password", "corect", "");
				teacher_flags[1]=true;
		}
		teacher_submitbutton();
	}

	function student_v_repeat() {
		if(($("#student_inputPassword").val() != $("#student_inputPasswordConfirm").val()) && ($("#student_inputPasswordConfirm").val()!="")) { 
			lineState("student_repeat", "error", "密码不一致");
			student_flags[2]=false;
			} else {
				lineState("student_repeat", "corect", "");
				student_flags[2]=true;
		}
		student_submitbutton()
	}

	function teacher_v_repeat() {
		if(($("#teacher_inputPassword").val() != $("#teacher_inputPasswordConfirm").val()) && ($("#teacher_inputPasswordConfirm").val()!="")) { 
			lineState("teacher_repeat", "error", "密码不一致");
			teacher_flags[2]=false;
			} else {
				lineState("teacher_repeat", "corect", "");
				teacher_flags[2]=true;
		}
		teacher_submitbutton();
	}
	
	function student_v_mobile(){
	
			var mobile = $("#student_mobile").val();
			if(!Mobile.test(mobile) && mobile!=""){
				lineState("student_mobile", "error", "请输入正确的手机号码");
				student_flags[3]=false;
			}else{
				lineState("student_mobile", "corect", "");
				student_flags[3]=true;
			}
			student_submitbutton();
	}
	
	function teacher_v_mobile(){
			var mobile = $("#teacher_mobile").val();
			if(!Mobile.test(mobile) && mobile!=""){
				lineState("teacher_mobile", "error", "请输入正确的手机号码");
				teacher_flags[3]=false;
			}else{
				lineState("teacher_mobile", "corect", "");
				teacher_flags[3]=true;
			}
			teacher_submitbutton();
	}
	
	function student_v_age(){
		var age = $("#student_age").val();
		if(!Age.test(age) && age!=""){
			lineState("student_age", "error", "请输入正确的年龄");
			student_flags[4]=false;
		}else{
			lineState("student_age", "corect", "");
			student_flags[4]=true;
		}
		student_submitbutton();
	}
	
	function teacher_v_age(){
		var age = $("#teacher_age").val();
		if(!Age.test(age) && age!=""){
			lineState("teacher_age", "error", "请输入正确的年龄");
			teacher_flags[4]=false;
		}else{
			lineState("teacher_age", "corect", "");
			teacher_flags[4]=true;
		}
		teacher_submitbutton();
	}
	
	function adaptValue() {

		return true;

	}
	
$(function(){
	$("#choose_student").click(
		function(){
			if($("#student_agree").attr("checked") == "checked"){
				$("#student_agree").trigger("click");
			}
			$("#teacherPart").css("display","none");
			$("#studentPart").css("display","block");
			$("#bottom_line").css("margin","-10px 0px 0px 135px");
			$("#form-bak").css();
		}
	);
	
	$("#choose_teacher").click(
		function(){
			if($("#teacher_agree").attr("checked") == "checked"){
				$("#teacher_agree").trigger("click");
			}
			$("#studentPart").css("display","none");
			$("#teacherPart").css("display","block");
			$("#bottom_line").css("margin","-10px 0px 0px 275px");
		}
	);
	
	
})
	
	