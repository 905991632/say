$(document).ready(function(){
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
});

function addEle(ele,value){
    var optionStr="";
    optionStr="<option value="+value+">"+value+"</option>";
    ele.append(optionStr);
}

