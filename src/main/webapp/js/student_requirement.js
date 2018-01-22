function myfunction(){
	var course = $("#course");
    var CourseList=['一年级语文','一年级数学','一年级英语',
    			'二年级语文','二年级数学','二年级英语',
    			'三年级语文','三年级数学','三年级英语',
    			'四年级语文','四年级数学','四年级英语',
    			'五年级语文','五年级数学','五年级英语',
    			'六年级语文','六年级数学','六年级英语',
    			'初一语文','初一数学','初一英语','初一政治','初一历史','初一地理',
    			'初二语文','初二数学','初二英语','初二生物','初二化学','初二物理','初二历史','初二地理','初二政治',
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
    
}
function check(){
	var course=$("#course").val();
	var area=$("#area").val();
	var sex=$("#sex").val();
	if(course=="请选择"||area=="请选择"||sex=="请选择"){
		alert("请完善所有信息");
		return false;
	}else{
		 if(confirm("确定发布家教信息？一旦发布不能修改")){
			   return true;
			  }
			  else{
				  return false;
			  }
	}

}

function addEle(ele,value){
    var optionStr="";
    optionStr="<option value="+value+">"+value+"</option>";
    ele.append(optionStr);
}