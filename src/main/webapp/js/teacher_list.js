function myfunction(){
	var area = $("#choose");
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

function addEle(ele,value){
    var optionStr="";
    optionStr="<a href='#' rel='"+value+"' name='area' class='sx_child'>"+value+"</a>";
   /* optionStr='<a href="#" rel="'+value+'" name="area" class="sx_child"/>'+value;*/
    ele.append(optionStr);
}