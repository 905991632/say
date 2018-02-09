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

var flag = true;

function photocheck(){
	var photo = $("#inputfile1");
	if(photo.val()!==""){
		if(!/\.(jpg)$/.test(photo.val())){
			alert("图片必须为jpg格式");
			flag = false;
			return;
		}else if(document.getElementById('inputfile1').files[0].size >102400){
			alert("图片必须小于100KB");
			flag = false;
		}else{
			flag = true;
		}
	}else{
		flag = true;
	}
}

function formcheck(){
	return flag;
}


function addEle(ele,value){
    var optionStr="";
    optionStr="<option value="+value+">"+value+"</option>";
    ele.append(optionStr);
}

