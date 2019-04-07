<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MOP</title>
<%@include file="common/head.jsp"%>

<style type="text/css">
html {
	overflow: hidden;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/toast/jquery.toast.css" />
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/AdminLTE/dist/css/bootsnav.css"/> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/AdminLTE/dist/css/dstree.css"/> --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/rightclickstyle.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeviewbox.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">

<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>

<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>

<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>

<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/fastclick/fastclick.js"></script>

<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/app.js"></script>

<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/demo.js"></script>

<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/app_iframe.js"></script>

<script src="http://cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/toast/jquery.toast.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/other/AnalyticWebsocketDatas.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/other/reconnecting-websocket.js"></script>

<%-- <script src="<%=request.getContextPath()%>/AdminLTE/dist/js/bootsnav.js"></script> 不能使用，动态生成的菜单不能弹出--%>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/rightclick.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeviewbox.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<style>
.slimScrollDiv {
	width: auto;
	height: 821px;
	float: left;
}

.slimScrollDiv {
	margin-left: 0px;
	overflow-y: scroll;
}
/* css注释说明：设置第二个盒子与第一个盒子间距为10px，并设置了横纵滚动条样式 */
</style>


</head>
<body class="hold-transition skin-blue sidebar-mini fixed">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->

			<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>L</b>MP</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>无线电</b>MOP</span> <!-- Sidebar toggle button-->
			</a> <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>



			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top bootsnav">
				<!-- top menu -->
				<!-- <div class="" style="margin-left:30px;">
					<ul class="nav navbar-nav topbarMenu" data-in="fadeInDown"
						data-out="fadeOutUp">
					
					</ul>
				</div>
				 -->
				<div class="navbar-custom-menu">

					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="<%=request.getContextPath()%>/AdminLTE/dist/img/ld.jpg"
								class="user-image" alt="User Image"> <span
								class="hidden-xs"> <!-- 显示登录用户名 --> <shiro:principal
										property="name" />
							</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="<%=request.getContextPath()%>/AdminLTE/dist/img/user2-160x160.jpg"
									class="img-circle" alt="User Image">

									<p>
										个人介绍 <small>创建时间 <shiro:principal property="name" />
										</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div class="row">
										<div class="col-xs-4 text-center">
											<a href="#">关注</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">粉丝</a>
										</div>
										<div class="col-xs-4 text-center">
											<a href="#">好友</a>
										</div>
									</div> <!-- /.row -->
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">修改</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat"
											data-toggle="modal" data-target="#myModal">注销</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>

		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- 左侧边栏 -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="<%=request.getContextPath()%>/AdminLTE/dist/img/ld.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>
							<shiro:principal property="name" />
						</p>
						<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
					</div>
				</div>
				<!-- 搜索框 -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="搜索..."> <span class="input-group-btn">
							<button type="button" name="search" id="search-btn"
								class="btn btn-flat" onclick="search_menu()">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form
            sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">

				</ul>
				<!-- 左边的树 -->
				<!-- <div class="box box-primary">
							<div class="box-body box-profile">
								<div class="rightMenuTree" id="tree"></div>
							</div>
							/.box-body
		 </div>
         <ul class="contextmenuCity">
  			<li><a href="#" class="openAllLamp">全开</a></li>
  			<li><a href="#" class="closeAllLamp">全关</a></li>
  			<li><a href="#" class="configAllLamp">配置</a></li>
		</ul> 
		<ul class="contextmenuBox">
  			<li><a href="#" class="openLamp">开灯</a></li>
  			<li><a href="#" class="closeLamp">关灯</a></li>
  			<li><a href="#" class="configLamp">配置</a></li>
		</ul>   -->

			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" id="content-wrapper"
			style="min-height: 821px;">
			<!--bootstrap tab风格多标签页-->
			<div class="content-tabs">
				<button class="roll-nav roll-left tabLeft" onclick="scrollTabLeft()">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs menuTabs tab-ui-menu" id="tab-menu">
					<div class="page-tabs-content" style="margin-left: 0px;"></div>
				</nav>
				<button class="roll-nav roll-right tabRight"
					onclick="scrollTabRight()">
					<i class="fa fa-forward" style="margin-left: 3px;"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown tabClose" data-toggle="dropdown">
						页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-right"
						style="min-width: 128px;">
						<li><a class="tabReload" href="javascript:refreshTab();">刷新当前</a></li>
						<li><a class="tabCloseCurrent"
							href="javascript:closeCurrentTab();">关闭当前</a></li>
						<li><a class="tabCloseAll"
							href="javascript:closeOtherTabs(true);">全部关闭</a></li>
						<li><a class="tabCloseOther"
							href="javascript:closeOtherTabs();">除此之外全部关闭</a></li>
					</ul>
				</div>
				<button class="roll-nav roll-right fullscreen"
					onclick="App.handleFullScreen()">
					<i class="fa fa-arrows-alt"></i>
				</button>
			</div>
			<!-- 从这个地方开始应该是要展示的面板 -->
			<div class="content-iframe " style="background-color: #ffffff; ">
				<div class="tab-content " id="tab-content"></div>
			</div>
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs"></div>
			<strong></strong>
		</footer>
		<!--隐藏的退出弹窗点击退出显示-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">确定要退出吗？</h4>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">我在想想
						</button>
						<button type="button" class="btn btn-primary" id="loginOut">
							确定</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	//用于显示toast类型的消息提示框
    function messagebox(type,head, content, pos) {
        if (pos == 'bottom-right') {
            pos = {bottom:60 ,right: 60};
        }
    	$.toast({
            heading: head,
            text: content,
            position: pos,
            icon: type,
            showHideTransition: 'slide',
            hideAfter: 2000,
        })
    }
    var rcelement;
    var socket;
    //jquery的一个消息提示插件
 	toastr.options = {
 			//target:'.content-iframe',  
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
	};
    window.onload=function()
	{
		    //var host = "127.0.0.1:8081"; //浏览器其中必须输入相同的ip地址和端口号，不能是域名如localhost
	    var host = window.location.host;
	    socket = initwebsocket.initSocket(host,toastr); //这个函数在common.js 中
	} 
    
    /**
     * 本地搜索菜单
     */
    function search_menu() {
        //要搜索的值
        var text = $('input[name=q]').val(); //http://blog.csdn.net/mixika99/article/details/53357190
		$('.rightMenuTree').treeview('search', [ text,{ ignoreCase: false, exactMatch: false },""]);
    }
    
    //现实树形菜单
    function AJAX_Fun()
    {
    	var flag = false;
    	/* $.ajax({
             type : "POST",  //提交方式
             url : "resource/tree",
             async: false, //同步，为了函数外边不能执行则不执行下一步
             success :  */
             
             
             ajaxPost("<%=request.getContextPath()%>/rest/resource/tree", null,function(myjson) {//返回数据根据结果进行相应的处理
            	 var menus = []
                 for(i=0;i<myjson.length;i++){
                     if(myjson[i].pid==null){
                         var menu = {
                             id:myjson[i].id,
                             text: myjson[i].text,
                             icon: myjson[i].iconCls,
                             children: []
                         }
                         menus.push(menu)
                     }
                 }
                 //menus中的全部都是没有pid的
                 for(i=0;i<myjson.length;i++){
                     if(myjson[i].pid!=null){
                         var menu = {
                             id: myjson[i].id,
                             text: myjson[i].text,
                             icon: myjson[i].iconCls,
                             url: myjson[i].attributes,
                             targetType: myjson[i].targetType
                         }
                         //把子树添加进入对应的父树内
                         for(j=0;j<menus.length;j++){
                             if(menus[j].id==myjson[i].pid){
                                 menus[j].children.push(menu)
                             }
                         }
                     }
                 }
                 //在此处将树状列表添加
                 //至于是如何将页面添加到ul列表中应该也是再此处进行实现的
                 $('.sidebar-menu').sidebarMenu({data: menus, param: {strUser: 'admin'}});
                 //$('.topbarMenu').topbarMenu({data: menus, param: {strUser: 'admin'}}); //  
               	flag =  true; 
         });
       return flag;  
    } 
    <%-- //初始化站点树 左边
    function initTree(selectNodeId){
			 	var treeData = null;
				ajaxPost("<%=request.getContextPath()%>/rest/AreaGroupManager/boxTreeData", null, function(data) {
					treeData = data;
					//console.log(JSON.stringify(treeData));
					//alert(JSON.stringify(treeData));
				});
				$("#tree").treeview({
					data : treeData,
					showBorder : true,
					expandIcon : "glyphicon glyphicon-stop",
					collapseIcon : "glyphicon glyphicon-unchecked",
					levels : 1,
					onNodeSelected : function(event, data) { 
						//fillDictForm(data);
						//formReadonly();
						//console.log(JSON.stringify(data));
					}
				}); 
				if(treeData.length==0)
					return;
				//默认选中第一个节点
				selectNodeId=selectNodeId||0;
				$("#tree").data('treeview').selectNode(selectNodeId);
				$("#tree").data('treeview').expandNode(selectNodeId);
				$("#tree").data('treeview').revealNode(selectNodeId);
	} 
	function timeinitTree()
	{
		initTree(0); //右边的菜单
	}--%>
    $(function () {
		//var t1 = window.setInterval(timeinitTree,1000*60); //定时刷新菜单
        App.setbasePath("../");
        App.setGlobalImgPath("AdminLTE/dist/img/");

        addTabs({
            id: '10008',
            title: '首页',
            close: false,
            url: 'welcome_iframe',
            urlType: "relative"
        });
        
        //这一段与添加树状列表相关
   		 var res = AJAX_Fun();
   		 if (false == res){
   		 	return;
   		 }
   		
       	 //initTree(0); //右边的菜单
         $("#loginOut").click(function(){
             $.ajax({
                 type :"post",
                 url : "<%=request.getContextPath()%>/rest/logout",
                 success : function(data){
                	 if (data) {
                		  window.location.href = '<%=request.getContextPath()%>/rest/login';
					}
                 }
             });
         });
    });
    
    function addtab(){
    	alert("dd");
    	addTabs({id:'4311',title: ' 项目信息更新',close: true,url: '/depproject/depprojectedit'});
    }
</script>

</body>
</html>