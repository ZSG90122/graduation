<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<!DOCTYPE html>
<html>
<head>
<title>WEbsocket</title>
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script type="text/javascript">  
        function RegularButton()
        {
	
            $.ajax({
               type :"post",
               url : "<%=request.getContextPath()%>/rest/sendtoclient/sendregularcmd",
               success : function(data)
               {
	              	if (data)
	              	{
	              	alert("websocket  success!");
					}
               }
           });
            
        }
</script>
</head>
<body>
<div>
	<div>
		<button id="RegularButton" onclick="RegularButton();" >RegularButton</button>
	</div>
	<div>
		<button id="RegularButton" onclick="ControllButton();" >RegularButton</button>
	</div>
</div>
</body>
</html>