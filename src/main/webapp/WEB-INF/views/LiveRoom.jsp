<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var ws;//一个ws就是一个通信管道
	var target="ws://localhost:8080/Tutor/chatSocket";
	window.onload=function(){
	//浏览器开启管道
	
		if ('WebSocket' in window) {
            ws = new WebSocket(target);
        } else if ('MozWebSocket' in window) {
            ws = new MozWebSocket(target);
        } else {
            alert('WebSocket is not supported by this browser.');
            return;
        }	

			ws.onmessage=function(event){
				console.log(event.data);
				var content=document.getElementById("content");
				content.innerHTML+=event.data;
			}
			
	
	}
	
	
 function subSend(){
	 var msg=document.getElementById("msg").value;
	 ws.send(msg);
	 document.getElementById("msg").value=("");
 }
 	
 window.onunload = function(){
	 ws.close();
}
 
 document.onkeydown=function(e){
	 if(e.keyCode==13){
		 var send=document.getElementById("send");
		 send.onclik=subSend();
	 }
 }
 
 
 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/video.js"></script>
<link href="css/video-js.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<div>
	

	<div style="overflow: hidden;width: 1100px;height: 800px;margin: 30px 0px 0px 30px;">
		<div style="float: left;width: 652px;height: 702px;">
			<video id="123" class="video-js" controls autoplay
						preload="auto" width="650" height="700" data-setup="{}" style="margin: 0 atuo">
							<source src="${monitoring.monitorIp}" type="rtmp/flv">
			</video>
		</div>
	
	
		<div id="container" style="border:1px solid black;width:420px;height:700px;float:left;">
			<div id="content" style="height:600px;font-family: '微软雅黑 ';font-size: 18px;overflow-y:auto;" >
			
			</div>
			<div style="border-top:1px solid black;width:420px;height:100px">
				<div contenteditable="true" style="height: 90px;width: 319px;float: left;font-family: '微软雅黑 ';font-size: 18px;padding: 5px 5px 5px 5px;overflow-y:auto;" id="msg">
				
				</div>
					<!-- <input style="height:90px;width:350px;text-vlign:top;" id="msg"/> -->
					<!-- <button id="send" onclick="subSend()">发送</button> -->
				<div style="height: 100%;width: 70px;border-left: 1px solid #000000;float: left;">
					<img alt="" src="img/send.jpg" onclick="javascript:alert('您点到我了')">
				</div>	
			</div>
		</div>
	
	</div>

    
    
	
    
</div>
	
	
</body>
</html>