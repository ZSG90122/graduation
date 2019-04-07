<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>发送消息预览界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
	<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css"> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/fileinput.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.min.css">



</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<!-- 查询、添加、批量删除、导出、刷新 -->
<input type="hidden" class="form-control" name="iframeid"
		id='preurl' value="${param.preurl }">
<input type="hidden" class="form-control" name="curenttalentid"
		id='curenttalentid' value="${messageid }">
<div class="content">
    <div class="row-fluid">
        <div class="pull-right">
            <div class="btn-group">
            	 <div id="show" style="margin:0px 10px 0px 0px;">
					<button type="button" class="btn btn-primary btn-sm" id="btn-re">
					<i class="fa fa-reply"></i> 返回
					</button>
				</div>
            </div>
        </div>
        <div class="row" style="margin:0px 0px 0px 5px;">
            <h4>消息信息详情：</h4>
        </div>
        <div class="box box-primary" style="margin:0px 0px 20px 0px;">
		</div>
    </div>			
	 
	<form class="form-horizontal"  id="form_add" action="" method="post">
    <input type="hidden" class="form-control" name="id" id='messageid'>
    <input type="hidden" class="form-control" name="userName" id='userId'>
    <div class="row">
    	<!-- 存放人才基本信息 -->
    	<div class="col-sm-10">
    		<div class="form-group">
               	 <label for="inputName" class="col-sm-3 control-label">发送人</label>
                 <div class="col-md-6">
                     <input  type="text" readonly="readonly" class="form-control" name="userName" id="userId">
	             </div>
	        </div>
	                   
            <div class="form-group">
               <label for="inputName" class="col-sm-3 control-label">消息类型</label>
               <div class="col-sm-6">
               	<input  readonly="readonly" type="text" class="form-control" name="messagetypeName" id="messagetypeName" />
               </div>
           </div>
           <div class="form-group">
               <label for="inputName" class="col-sm-3 control-label">消息标题</label>
               <div class="col-sm-6">
                   <input readonly="readonly"  type="text" class="form-control" name="title" id="title">
               </div>
           </div>
           <div class="form-group">
               <label for="inputName" class="col-sm-3 control-label">消息内容</label>
               <div class="col-sm-6">
                   <textarea readonly="readonly"  class="form-control" type="text" name="content" id="content" rows="5" cols="34.5"></textarea>
               </div>
           </div>
           <div class="form-group">
				<label for="inputName" class="col-sm-3 control-label">消息状态</label>
				<div class="col-sm-2">
					<label class="radio-inline"> <input type="radio"
						value="0" name="state" id="messagestateid0">未处理
					</label>
				</div>
				<div class="col-sm-2">
					<label class="radio-inline"> <input type="radio"
						value="1" name="state" id="messagestateid1">已处理
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-sm-3 control-label">附件备注</label>
				<div class="col-sm-6">
					<textarea readonly="readonly" class="form-control" rows="3" placeholder="Enter"
						name="remark" id="remark"></textarea>
				</div>
			</div>
			
    	</div>
    	<!-- 人才信息显示结束 -->
    </div>
    <!-- 整体row结束的地方 -->
	</form>
	<h4 style="margin: 0px 10px 20px 120px">附件预览</h4>
	<div class="form-group">
		<label style="margin: 0px 0px 0px 0px" for="inputName" class="col-sm-2 control-label"></label>
		<div class="col-sm-6" >
			<form id="add_messageattach_form" method="post" enctype="multipart/form-data">
				<input id="uploadfile" type="file" name="uploadfile" data-ref="url2" class="file-loading" value="test" multiple/>
				<input type="hidden" id="attachurl" name="url" >
				<input type="hidden" id="path" name="path" value="upload/message" >
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3" style="margin:20px 0px 0px 150px;">
			<div class="form-group" >
				
			</div>
		</div>
		<div class="col-md-3" style="margin: 20px 0px 0px 0px">
			<div class="form-group">
				<button type="button" class="btn btn-primary btn-sm" id="btn-edit-submit" >
				 <i class="fa fa-plus"></i>保存
				</button>
			</div>
		</div>
	</div>
	
	
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
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zh.js"></script>	
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/fileupload.js"></script>

<script>
	/* select2的样式说明 */
	$("#aceiveUserid").select2({
		tags:true,
		createTag:function (decorated, params) {
			return null;
		},
		width:'400px',
		color0: "blue"
	});
    var addperyantiForm = null;
    $(function () {
    	//填充数据
    	var messageid = $('#curenttalentid').val();
    	var seldata = new Object();
		seldata.messageid = messageid;
		$.ajax({
                    url: "<%=request.getContextPath()%>/rest/message/getDisMessagebyid/"+messageid,
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:seldata,
                    success: function (data) {
                       //alert(JSON.stringify(data));
                       initdepprojectbaseinfor(data);
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
         }); 
         
         //返回事件
      	$("#btn-re").on("click", function() {
        	var str = $('#preurl').val();
			/* alert(str); */
			window.location.href=str;		
			return false;
        });
    });
    
    function initdepprojectbaseinfor(data){
    	console.log(data);
    	var seldata = new Object();
    	seldata = data[0];
    	console.log(seldata);
    	
    		$("input[name=messagetypeName]").val(seldata.messagetypename);
            $("input[name=title]").val(seldata.title);
            $("textarea[name=content]").val(seldata.content);
            $("input[name=userName]").val(seldata.userName);
            $("textarea[name=remark]").val(seldata.remark);
            /*最好采用下拉列表的形式进行展示，因为每次并不能够刷新页面将当前的选定值进行展示 */
            $("input[name='state']").eq(seldata.state).attr("checked",true);
            
            filelist=[];
            pathArr=[];
            nameArr=[];
            for(var k=0; k< seldata.attachList.length; k++){
            	var item = seldata.attachList[k];
            	/* alert(JSON.stringify(item)); */
            	//构造
            	pathArr.push("<%=request.getContextPath()%>"+"/"+item.url);//文件访问地址 这里需要网络地址  例：http://localhost:8080/xxx/xx.jpg
    			var obj = new Object(); 
    			obj.caption=item.name;//item.id;    			
    			obj.type = item.type;
    			obj.size =100;
    			obj.key= item.id;
    			/* alert(obj.key) */;
    			obj.url = "<%=request.getContextPath()%>/rest/FileUpload/springDelete"+"?fileurl="+item.url;  //用于初始化文件删除事件地址  			
    			nameArr.push(obj); 
        	}        	
           //显示附件列表
            initFileInputdata();
         //修改人才信息时，保存按钮的事件 
        $("#btn-edit-submit").on("click", function () {
 				var dataform=$('#form_add').form();
 				var params = dataform.getFormSimpleData();
 				params.level = 0;
 				params.id = String($("#curenttalentid").val());
 				//params.state = $("input[name='state'][checked]").val();
 				console.log(params.id+"SSS")
 				$.ajax({
 				url : "<%=request.getContextPath()%>/rest/message/addDealMessageInfo",
 				type : 'post',
 				cache : "false",
 				data : params, //
 				dataType : "json",
 				success : function(data) {
 					if (data.success) {
 						//刷新列表
 						toastr.success('保存成功！' + JSON.stringify(data));
 					} else {
 						toastr.error('保存失败！' + JSON.stringify(data));
 					}
 				},
 				error : function(err) {
 					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
 				}
 				
 			});
 			window.location.reload();
 		});   
           
            
	};
	/* 该段代码为信息附件的相关代码*/       
		var oFileInput = new DSFileInput();
		var filelist=[];     
		var pathArr = new Array();//文件网络地址 集合
		var nameArr = new Array();//文件信息集合
		var filepath="upload/message";
		var selectmessage = new Object();
		
		var uploadUrl="<%=request.getContextPath()%>/rest/FileUpload/springUpload";
		var deleteUrl="<%=request.getContextPath()%>/rest/FileUpload/springDelete";
		$(function () { 
		    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);  
		});
		//添加附件
		function initFileInput()
		{
			$("#add_messageattach_form").empty();
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);
		};
		//展示附件
		function initFileInputdata()
		{
			$("#add_messageattach_form").empty();
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Initdata("uploadfile", pathArr,nameArr);
		};
		function uploadcallback(url,previewId,filetype) {
				var attach = new Object();
				attach.id = null
				attach.url = url;
				attach.type=filetype;
				attach.name="附件";
				/* +document.getElementById(uploadfile).value */
				attach.messageId = selectmessage.id;
				filelist.push(attach);
				var deleteaction = deleteUrl + "?fileurl=" +url;
				$("#" + previewId).find(".kv-file-remove").click(function() {
					$.ajax({
						url : deleteaction,
						type : "post",
						dataType : "json",
						success : function(result) {
							//删除文件成功
							//alert(filelist.length+result.url);
							filelist.removebyurl(result.url);
							//alert(filelist.length);
						},
						error : function(result) {
							//异常操作
						}
					});
				});
		}
		/* 在发送消息的时候，没有提供修改的功能，所以此处在修改附件时的删除功能并没有调用。 */
		//这个函数在初始化植入的删除按钮事件调用，这意味着有了数据库，需要删除数据库
		function deletecallback(key)
		{	
			alert(key);
			var data = new Object();
			
			data.id = key;
			if(key>0){
				$.ajax({
					url: "<%=request.getContextPath()%>/rest/message/deleteMessageAttachById",
					type: 'post',
					dataType: "json",
					cache: "false",
					data:data,
					success: function (data) {
						if (data.success) {
							toastr.success("删除数据库成功！");
							tables.api().row().remove().draw(false);
						} else {
							toastr.error('删除失败！'+JSON.stringify(data));
						}
					},
					error: function (err) {
						toastr.error("Server Connection Error<%=request.getContextPath()%>.");
					}
		        });
			}
			//删除filelist
			filelist.removebyid(key);
		};	
	
	/* Array.prototype.removebyid = function(id) {
			if (this.length < 1){
				return false;
			}
			var a = -1;
			for(var i=0;i<this.length;i++){
				if(this[i].id == id){
					a = i;
					break;
				}
			}		
			//var a = this.indexOf(b);
			if (a >= 0) {
				this.splice(a, 1);
				return true;
			}
			return false;
	};
	Array.prototype.removebyurl = function(url) {
			if (this.length < 1){
				return false;
			}
			var a = -1;
			for(var i=0;i<this.length;i++){
				if(this[i].url == url){
					a = i;
					break;
				}
			}		
			//var a = this.indexOf(b);
			if (a >= 0) {
				this.splice(a, 1);
				return true;
			}
			return false;
	}; */

</script>
