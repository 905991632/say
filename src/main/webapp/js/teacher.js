var record_button = $("#bottom_record");
var appraisal_button = $("#bottom_appraisal");
var record = $("#right_bottom_record");
var appraisal = $("#right_bottom_appraisal");
$(document).ready(function(){
	$("#bottom_record").css("border-bottom","2px solid #ff8000");
	$("#right_bottom_appraisal").css("display","none");
$("#bottom_record").click(
	function(){
		$("#bottom_record").css("border-bottom","2px solid #ff8000");
		$("#bottom_appraisal").css("border-bottom","");
		
		$("#right_bottom_record").css("display","block");
		$("#right_bottom_appraisal").css("display","none");
	}
);

$("#bottom_appraisal").click(
	function(){
		$("#bottom_record").css("border-bottom","");
		$("#bottom_appraisal").css("border-bottom","2px solid #ff8000");
		
		$("#right_bottom_record").css("display","none");
		$("#right_bottom_appraisal").css("display","block");
	}
);
});