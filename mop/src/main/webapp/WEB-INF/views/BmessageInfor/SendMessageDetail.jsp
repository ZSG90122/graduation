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

<style type="text/css">
.select2-container--default .select2-selection--multiple .select2-selection__choice{
background-color:#b1dbf3;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice__remove{
color:#f90a29;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice{
color:#191717;
}
</style>

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
					<!-- onclick="javascript:history.back(-1)" -->
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
    <input type="hidden" class="form-control" name="messageid" id='messageid'>
    <input type="hidden" class="form-control" name="id" id='messageid'>
    <input type="hidden" class="form-control" name="userId" id='userId'>
    <div class="row">
    
    
    	<!-- 存放人才基本信息 -->
    	<div class="col-sm-10">
    		<div class="form-group">
                <label for="inputName" class="col-sm-3 control-label">接收人</label>
               	<div class="col-md-6">
               		<select class="combox" id="aceiveUserid" name="receiveuserId"  multiple> 
				</select>
	            </div>
	            <!-- <button type="button" class="btn btn-primary btn-sm" id="receiveuser_id">添加
	            </button> -->
	                   </div>
	                   
	                   <div class="form-group">
	                       <label for="inputName" class="col-sm-3 control-label">消息类型</label>
	                       <div class="col-sm-6">
	                       	<select class="form-control select2" style="width: 100%;" id="messagetypeId" name="messagetypeId">	
				</select>
	                       	<!-- <input placeholder="公告/通知/分享" type="text" class="form-control" name="messagetype" id="messagetype_id" /> -->
	                       </div>
	                   </div>
	                   <div class="form-group">
	                       <label for="inputName" class="col-sm-3 control-label">消息标题</label>
	                       <div class="col-sm-6">
	                           <input type="text" class="form-control" name="title" id="title">
	                       </div>
	                   </div>
	                   <div class="form-group">
	                       <label for="inputName" class="col-sm-3 control-label">消息内容</label>
	                       <div class="col-sm-6">
	                           <textarea class="form-control" type="text" name="content" id="content" rows="5" cols="34.5"></textarea>
	                       </div>
	                   </div>
						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">附件备注</label>
							<div class="col-sm-6">
								<textarea class="form-control" rows="3" placeholder="Enter"
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
                    url: "<%=request.getContextPath()%>/rest/message/getMessagebyid/"+messageid,
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
    	
    		selectmessage = seldata;
            $("#messageid").val(seldata.id);
            sel.binddata('messagetypeId', "<%=request.getContextPath()%>/rest/dic/getMessagetypeList", 'id', 'name',seldata.messagetypeId);
            $("#aceiveUserid").val();
            $("input[name=title]").val(seldata.title);
            $("textarea[name=content]").val(seldata.content);
            $("textarea[name=remark]").val(seldata.remark);
    		
    		/* 遍历出已经添的人员 */
            for(var i in seldata.dispatchList){
            	var item = seldata.dispatchList[i];
				/* 在添加过程中，如果为空则直接添加，如果不为空，则遍历已有的option，如果存在，什么都不做，如果不存在，则添加(添加前先先匹配清除一次) */
				$("#aceiveUserid").append('<option value='+i+'>'+item.userName+'</option>');
			}
            var opts = document.getElementById("aceiveUserid");
            for(var j=0;j<opts.options.length;j++){
                  opts.options[j].selected = 'selected';
            }
            /* 获取信息状态状态的两种写法 */
           /*  if(data.state == 0){
            	$('#messagestateid0').prop("checked",true);
            }*/
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
    			obj.url = "<%=request.getContextPath()%>/rest/FileUpload/springDelete"+"?fileurl="+item.url;  //用于初始化文件删除事件地址
    			    			
    			nameArr.push(obj); 
    			//用于重新上传和更新
    			var attach = new Object();
				attach.id = item.id
				attach.url = item.url;
				attach.type=item.type;
				attach.messageId = item.messageId;
				filelist.push(attach);
        	}        	
           //显示附件列表
            initFileInputdata();
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
