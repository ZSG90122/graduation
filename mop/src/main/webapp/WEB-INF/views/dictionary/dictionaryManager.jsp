<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>字典管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
</head>
<!-- <body style="overflow: hidden" class="sidebar-mini"> -->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div style="margin:30px 0px 20px 50px;">
	<div class="row">
            <form id="queryForm" action="" method="post">
                    <div class="col-sm-3">
			        	<select class="form-control" id="sle">
			        	   <option value="0"  hidden>请选择字典名称...</option>
				           <option value="1">设备系统类型</option>
				           <option value="2">设备类型</option>
				           <option value="3">运维类型</option>
				           <option value="4">工程单位</option>
				           <option value="5">项目来源</option>
				           <option value="6">质检与复核单位</option>
				           <option value="7">消息类型</option>
				           <option value="8">地点列表</option>
				           <!-- <option value="9">工程状态</option> -->
				           <option value="10">工程存在问题</option>
				           <option value="11">标段内容</option>
				           <option value="12">飞机类别</option>
				           <option value="13">机场部队类别</option>
			         	</select>
			         	
			        </div>
                <button type="button" class="btn btn-primary btn-sm" id="btn-query">确定</button>
            </form>
        </div>
    </div>
	</div>
	
<div class="box" style="margin-top: 0px;">

</div>
</body>
</html>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/fastclick/fastclick.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/app.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/demo.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script 
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
		
<script type="text/javascript">
	/* https://www.cnblogs.com/softwarefang/p/6094174.html */
	//toastr.options.positionClass = 'toast-bottom-right';
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
		};  
</script>
<script>
/* 添加下拉框对象 */
<%-- 	$("#sle").change(function(){ //下拉框改变时取得值
		/* 添加text */
		$("#result").html($("select option:selected").text()); //显示值
	});--%>
	
/* 确定按钮点击事件 */
       $("#btn-query").on("click", function () {

		  //首先获得下拉框的节点对象；
		    var select = document.getElementById("sle");
		 /*  //1. 获取option的text值  
		  	var ops = select.options;
		    for(var i=0; i<ops.length; i++){
				if(ops[i].selected == true){
					alert(ops[i].text);//获取文本
					alert(ops[i].value);//获取value
				}
			}
			 */
		     //2.如何获得当前选中的value值：
		     var value = select.value;
		     if(value == 1){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/devsystemType';
		     }else if(value == 2){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/devtype';
		     }else if(value == 3){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/maintaintype';
		     }else if(value == 4){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/departmentType';
		     }else if(value == 5){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/source';
		     }else if(value == 6){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/checkType';
		     }else if(value == 7){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/message';
		     }else if(value == 8){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/addressList';
		     }<%-- else if(value == 9){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/projectStatus';
		     } --%>else if(value == 10){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/projectProblem';
		     }else if(value == 11){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/bidContent';
		     }else if(value == 12){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/planeType';
		     }else if(value == 13){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/planeMilType';
		     }
		                 
        }); 

        
    
    
</script>

