var flags=[false,false,false];
function f_old_password(){
	var old_password = $("#old_password").val();
	if((old_password.length<6 || old_password.length>16)&& old_password.length!=0){
		lineState("old_password", "error", "密码格式有误");
		flags[0] = false;
	}else{
		lineState("old_password", "none", "");
		flags[0] = true;
	}
}

function f_new_password(){
	var new_password = $("#new_password").val();
	if((new_password.length<6 || new_password.length>16)&& new_password.length!=0){
		lineState("new_password", "error", "密码格式有误");
		flags[1] = false;
	}else{
		lineState("new_password", "none", "");
		flags[1] = true;
	}
}

function f_confirm_password(){
	var confirm_password = $("#confirm_password").val();
	var new_password = $("#new_password").val();
	if(confirm_password!=new_password && confirm_password!=""){
		lineState("confirm_password", "error", "密码不一致");
		flags[2] = false;
	}else{
		lineState("confirm_password", "none", "");
		flags[2] = true;
	}
}

function f_submit(){
	for(f in flags) 
		if(!flags[f]){
			return false;
		}
	return true;
}





function lineState(name, state, msg) {

	if(state == "none") { 
		$("#div_" + name).attr("class", "none");
		return; 
		}
	$("#div_" + name).text(msg);
	$("#div_" + name).attr("class", "error");

}