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
</head>
<body>
<div>
	



    
    <div id="container" style="border:1px solid black;width:400px;height:540px;float:left">
	<div id="content" style="height:440px;">
	
	</div>
	<div style="border-top:1px solid black;width:400px;height:100px">
		<input style="height:90px;width:300px;text-vlign:top;" id="msg"/><button id="send" onclick="subSend()">发送</button>
	</div>
	</div>
	
    
</div>
	
	
</body>
</html>