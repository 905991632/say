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
   /* new SelectTag({
        child : ".sx_child", //所有筛选范围内的子类
        over : 'on', //选中状态样式名称
        all : ".all"
    });*/
}

function addEle(ele,value){
    var optionStr="";
    optionStr="<a href='#' rel='"+value+"' name='area' class='sx_child'>"+value+"</a>";
   /* optionStr='<a href="#" rel="'+value+'" name="area" class="sx_child"/>'+value;*/
    ele.append(optionStr);
}