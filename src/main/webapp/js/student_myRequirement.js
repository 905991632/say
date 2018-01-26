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






function lookup_apply(e){
	alert(1);
	alert(e);
}