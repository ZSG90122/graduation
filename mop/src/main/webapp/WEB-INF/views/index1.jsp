<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
	var ws = null;  
	function Connect()
    {
    	 if(null!=ws)
    	 {
    		 alert("!Connect");
    	 	return;
    	 }
         var userid = ${userid};
         alert("userid : "+userid);
         var host = "127.0.0.1:8083";
         if ('WebSocket' in window)
            {
            	ws = new WebSocket("ws://"+ host + "/lmpds/rest/webSocketServer?userid="+userid);
            }
            else if ('MozWebSocket' in window) {
            	ws = new MozWebSocket("ws://" + host + "/lmpds/rest/webSocketServer?userid="+userid);
				
			} else {
				ws = new SockJS("http://" + host + "/lmpds/rest/sockjs/webSocketServer?userid="+userid);
				
			}
			ws.onopen = function(event){
			    console.log("connect  success");
			};
			ws.onerror = function(event){
			    console.log("connect false");
			};
			ws.onclose = function(event){
			    console.log("Socket connect breakdown");
			};
			ws.onmessage = function(evnt){

			    alert("websocket  : "+evnt.data);
			} 
    }
	$(function () {
		Connect();
	});
</script>
</head>
<body>
	<p>TEST</p>
</body>
</html>