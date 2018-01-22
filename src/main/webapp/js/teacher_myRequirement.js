$(document).ready(function(){
	$("#bottom_1").css("border-bottom","2px solid #ff8000");
	$("#bottom_2_div").css("display","none");
	$("#bottom_3_div").css("display","none");
	
	$("#bottom_1").click(function(){
		$("#bottom_1").css("border-bottom","2px solid #ff8000");
		$("#bottom_2").css("border-bottom","");
		$("#bottom_3").css("border-bottom","");
		$("#bottom_1_div").css("display","");
		$("#bottom_2_div").css("display","none");
		$("#bottom_3_div").css("display","none");
	});
	$("#bottom_2").click(function(){
		$("#bottom_1").css("border-bottom","");
		$("#bottom_2").css("border-bottom","2px solid #ff8000");
		$("#bottom_3").css("border-bottom","");
		$("#bottom_1_div").css("display","none");
		$("#bottom_2_div").css("display","");
		$("#bottom_3_div").css("display","none");
	});
	$("#bottom_3").click(function(){
		$("#bottom_1").css("border-bottom","");
		$("#bottom_2").css("border-bottom","");
		$("#bottom_3").css("border-bottom","2px solid #ff8000");
		$("#bottom_1_div").css("display","none");
		$("#bottom_2_div").css("display","none");
		$("#bottom_3_div").css("display","");
	});
	
	
});