function myfunction(){
	var  courses_value = $("#courses_value").val();
	var  area_value = $("#area_value").val();
	var course = $("#courses");
    var CourseList=['一年级语文','一年级数学','一年级英语',
    			'二年级语文','二年级数学','二年级英语',
    			'三年级语文','三年级数学','三年级英语',
    			'四年级语文','四年级数学','四年级英语',
    			'五年级语文','五年级数学','五年级英语',
    			'六年级语文','六年级数学','六年级英语',
    			'初一语文','初一数学','初一英语','初一政治','初一历史','初一地理',
    			'初二语文','初二数学','初二英语','初二政治','初二历史','初二地理','初二历史','初二地理','初二政治',
    			'初三语文','初三数学','初三英语','初三生物','初三化学','初三物理','初三历史','初三地理','初三政治',
    			'高一语文','高一数学','高一英语','高一生物','高一化学','高一物理','高一历史','高一地理','高一政治',
    			'高二语文','高二数学','高二英语','高二生物','高二化学','高二物理','高二历史','高二地理','高二政治',
    			'高三语文','高三数学','高三英语','高三生物','高三化学','高三物理','高三历史','高三地理','高三政治'];
    course.add(new Option('请选择','请选择'));
    for(var i=0; i<CourseList.length;i++){
		addEle(course,CourseList[i]);
	   }
	
	
	var area = $("#area");
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
    $('#courses').multiSelect(
    {
    	keepOrder: true ,
    	selectableList:3,
    	selectableHeader: "<div class='custom-header'>可选课程</div>",
    	selectionHeader: "<div class='custom-header'>已选课程</div>",
    	afterSelect: function(values){
    		courses_value="";
    		 $("#courses :checked").each(function(i,item){
    			 courses_value = courses_value +  $(item).attr("value") + ","; 
    	        });
    		 
    		 $("#courses_value").val(courses_value.substring(0,courses_value.length-1));
    		 
    		 if(courses_value.split(",").length>4){
    			 $("#courses :not(:checked)").attr("disabled","disabled");        			
    			 $('#courses').multiSelect('refresh');
    		 }
    	},
    	  afterDeselect: function(values){
    		  courses_value="";
    		  $("#courses :checked").each(function(i,item){
     			 courses_value = courses_value +  $(item).attr("value") + ","; 
     	        });
    		  $("#courses_value").val(courses_value.substring(0,courses_value.length-1));
    		  if(courses_value.split(",").length<5){
     			 $("#courses :not(:checked)").attr("disabled",false);        			
     			 $('#courses').multiSelect('refresh');
     		 }
    	}
    });
	$('#area').multiSelect(
	{
		keepOrder: true ,
    	selectableList:3,
    	selectableHeader: "<div class='custom-header'>可选地区</div>",
    	selectionHeader: "<div class='custom-header'>已选地区</div>",
    	afterSelect: function(values){
    		area_value="";
    		 $("#area :checked").each(function(i,item){
    			 area_value = area_value +  $(item).attr("value") + ","; 
    	        });
    		 $("#area_value").val(area_value.substring(0,area_value.length-1));
    		 if(area_value.split(",").length>4){
    			 $("#area :not(:checked)").attr("disabled","disabled");        			
    			 $('#area').multiSelect('refresh');
    		 }
    		 
    	},
    	  afterDeselect: function(values){
    		  area_value="";
    		  $("#area :checked").each(function(i,item){
    			  area_value = area_value +  $(item).attr("value") + ","; 
     	        });
    		  $("#area_value").val(area_value.substring(0,area_value.length-1));
    		  if(area_value.split(",").length<5){
      			 $("#area :not(:checked)").attr("disabled",false);        			
      			 $('#area').multiSelect('refresh');
      		 }
    	}
	});

}





function addEle(ele,value){
    var optionStr="";
    optionStr="<option value="+value+">"+value+"</option>";
    ele.append(optionStr);
}