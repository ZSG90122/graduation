<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/head.jsp"%>
<title></title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/AllPagesStyle/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/timepicker/bootstrap-timepicker.min.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/baidu/baidumapv2/baidumap_offline_v2_load.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/baidu/baidumapv2/tools/headmap_baidu.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/baidu/map_demo/layer/layer.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/baidu/my_Js/randpoints.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/baidu/baidumapv2/css/baidu_map_v2.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/jquery.flipcountdown.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/echart/echarts.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/adminlte/adminlte.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/jquery.tempgauge.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/jquery.flipcountdown.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>

<%-- <script src="<%=request.getContextPath()%>/AdminLTE/other/AnalyticWebsocketDatas.js"></script> --%>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<%-- <script
	src="<%=request.getContextPath()%>/AdminLTE/other/reconnecting-websocket.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/baidu/my_Js/addOverlay.js"></script>
<script 
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>	
		
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}

#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}

#result {
	border-left: 1px dotted #999;
	height: 100%;
	width: 600px;
	position: absolute;
	top: 54px;
	right: -450px;
	font-size: 12px;
	background-color: #ccc;
}

dl, dt, dd, ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

p {
	font-size: 12px;
}

dt {
	font-size: 14px;
	font-family: "微软雅黑";
	font-weight: bold;
	border-bottom: 1px dotted #000;
	padding: 5px 0 5px 5px;
	margin: 5px 0;
}

dd {
	padding: 5px 0 0 5px;
}

li {
	line-height: 28px;
}
</style>

</head>
<body class="hold-transition">
	<div class="box-header">
		<section class="content-header ">
			<div class="container">
				<div class="row">
					<!-- <div class="col-md-2">
						<form class="form-inline">
							<div id="checkShowStatInfor" class="checkbox">
								<label> <input id="checkShowStatInforValue"  type="checkbox">显示状态信息
								</label>
							</div>
						</form>
					</div>
					<div class="col-md-5">
						<form class="form-inline">
							<div class="form-group">
								<label for="exampleInputEmail3">站名&nbsp;&nbsp;</label> <input
									type="text" class="form-control" id="searchboxname">
							</div>
							<button type="button" class="btn btn-default" id="boxsearchbt">查询</button>
						</form>
					</div>
					<div class="col-md-5">
						<form class="form-inline">
							<div class="">
								<a class="btn btn-default" href="#" role="button">统计分析</a> <a
									class="btn btn-default" href="#" role="button">报警信息</a> <a
									class="btn btn-default" id="help-meA" href="#" role="button">帮助
									<span class="glyphicon glyphicon glyphicon-question-sign"
									aria-hidden="true"></span>
								</a>
							</div>
						</form>
					</div> -->
				</div>
			</div>
		</section>
	</div>


	<div id="allmap"
		style="overflow:hidden;zoom:1;position:relative;height:100%">
		<div id="map"
			style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
	</div>

	<div id="panelWrap"
		style="width:0px;position:absolute;top:0px;right:0px;height:100%;overflow:auto;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;">
		<div
			style="width:20px;height:200px;margin:-100px 0 0 -10px;color:#999;position:absolute;opacity:0.5;top:50%;left:50%;"
			id="showOverlayInfo">此处用于展示覆盖物信息</div>
		<div id="panel" style="position:absolute;"></div>
	</div>
	
	<!-- 加载右边的操作栏 
	<div id="result" class="control-sidebar-off">
		<%@include file="rightOptation.jsp"%>
	</div>-->

	<!-- 基础操作弹出层-->
	<!-- Modal -->
	<div class="modal fade my_modal" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div id="modalDialog" class="modal-dialog" role="document"
			style="margin: 10px auto;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<%@include file="Optation.jsp"%>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">

		//toastr.success("保存成功！");
		//window.parent.messagebox('success', '提示', res['desc'], 'mid-center');
		/* var socket;
 		toastr.options = {  
			closeButton: false,  
			debug: false,  
			progressBar: true,  
			positionClass: "toast-top-center",  
			onclick: null,  
			showDuration: "300",  
			hideDuration: "1000",  
			timeOut: "1000",  
			extendedTimeOut: "500",  
			showEasing: "swing",  
			hideEasing: "linear",  
			showMethod: "fadeIn",  
			hideMethod: "fadeOut"  
		}; */
		 var baidumapaddoverlay = baidumapds;//baidumapds在addoverlay.js文件中定义
		//地图加载完成后就请求后台添加客户端信息到地图上 http://lbsyun.baidu.com/index.php?title=jspopular
		
		//查询站自动居中地图
		$("#boxsearchbt").click(function(e){
         	var ptname = $("#searchboxname").val();
         	//alert(ptname);
         	searchBox(ptname);
         });
	
		//来了新的websocket消息
		function webSocketMessage(msg)
        {
        	//alert(msg.code);
        	//showWorkInfo(msg); //刷新工况信息
        }
		
		
	    function click_Icon()
		{
			$("#myModal").modal({
				backdrop : 'static',
				keyboard : false
			})
			$("#modalDialog").draggable(); //为模态对话框添加拖拽
			$("#myModal").css("overflow", "auto"); //禁止模态对话框的半透明背景滚动
		}
		
		
        
        function get_base_info(data)
        {
        	var result_data=null;
        	//ajax同步加载
		    $.ajaxSetup({ 
		         async : false 
		    }); 
      		$.post("<%=request.getContextPath()%>/rest/MainPage/get_spacial_info",data, function (result) {
		     	if(null!=result)
		     	{   
		     		result_data=result;
		     		console.log(result_data);
		     	}else{
		     		console.log("get_base_info"+result);
		     	}
			})
			return result_data;
        }
        //$.post提交的，通过这个全局的来处理错误。
		$(document).ajaxError(function (event, xhr, settings, infoError) {  
     		 alert(xhr.status + ':' +xhr.statusText);  
      		 alert(settings+ ':' + settings.info);  
      		 alert(event.type);  
      		 alert(settings.url);  
        		
      		//for(var i in event){    //查找event、settings有哪些属性方法  
           	// document.wirte(i+<br>);  
      		// } 
      		var sessionstatus = xhr.getResponseHeader("session-status");
            if (sessionstatus == "timeout") {
                alert("timeout");
                    //如果超时就处理 ，指定要跳转的页面
                window.location.href = basePath + "/";    
            } 
		});  



		


		/* window.onload=function()
		{ 
		    var host = "127.0.0.1:8081"; //浏览器其中必须输入相同的ip地址和端口号，不能是域名如localhost
	    	socket = initwebsocket.initSocket(host,toastr); 
		}  */
			    	
	    var map = new BMap.Map("map"); // 创建Map实例
	    map.centerAndZoom(new BMap.Point(104.071756, 30.671479), 10); // 初始化地图,设置中心点坐标和地图级别 //地图初始化位置在成都中心
		map.enableScrollWheelZoom();                            //启用滚轮放大缩小
		//map.addEventListener("tilesloaded",AddBase_State());//地图加载完成后就调用AddBase_State函数，请求服务器返回所有的客户端信息
	    //104.072, 30.673894,"测试BOX"
	    map.addControl(new BMap.NavigationControl()); //缩放按钮
	
	    var cr = new BMap.CopyrightControl({
	        anchor: BMAP_ANCHOR_TOP_RIGHT
	    }); //设置版权控件位置
	    map.addControl(cr); //添加版权控件
	    var bs = map.getBounds(); //返回地图可视区域
	    
	    cr.addCopyright({
	        id: 1,
	        content: "<p><b>无线电管理-MOP</b></p>",
	        bounds: bs
	    });
	    //定位地图中心
	    function mapcenterpanto(lng,lat){
	    	map.panTo(new BMap.Point(lng, lat),false);
	    }
    
			
    	
</script>
</body>
</html>
