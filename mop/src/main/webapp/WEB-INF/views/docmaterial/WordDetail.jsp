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

<title>文档信息预览界面：</title>

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
	<%-- <style type="text/css">
		.tab-content{
			/* 设置div的边框 */
			border:1px solid black;
		}
	</style>--%>
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<!-- 查询、添加、批量删除、导出、刷新 -->
<input type="hidden" class="form-control" name="iframeid"
		id='preurl' value="${param.preurl }">
<input type="hidden" class="form-control" name="curenttalentid"
		id='curenttalentid' value="${wordid }">	
<div class="content">
	<!-- 该界面的上半部分： -->
    <div class="row-fluid">
        <div class="pull-right">
            <div class="btn-group">
            	 <div id="show" style="margin:0px 10px 0px 0px;">
					<button type="button" class="btn btn-primary btn-sm" id="btn-re">
					<i class="fa fa-reply"></i> 返回
					</button>
					<!-- onclick="javascript:history.back(-1)" -->
				</div>
            </div>
        </div>
        <div class="row" style="margin:0px 0px 0px 5px;">
            <h4>文档资料查看：</h4>
        </div>
        <div class="box box-primary" style="margin:0px 0px 20px 0px;">
		</div>
    </div> 
     <!-- 下面这个form表单：包含人才的基本信息 -->         			
	<form class="form-horizontal"  id="form_add" action="" method="post">
    <input type="hidden" class="form-control" name="wordid" id='wordid'> 
    <div class="row">
    	<div class="col-sm-15">
    			<div class="col-md-10">
    				<div class="form-group">
					<label class="col-md-3 control-label">文档名称</label>
						<div class="col-md-7">
							<input type="text" name="name" id="name" class="form-control">
						</div>
					</div>
					<div class="form-group">
					<label class="col-md-3 control-label">文档类别</label>
						<div class="col-md-7">
							<select  class="form-control" name="wordtype" id="wordtype">
							</select>
						</div>
					</div>
					<div class="form-group">
		        	<label class="col-md-3 control-label">文档简介</label>
		           		<div class="col-md-7">
		               		<textarea rows="2" cols="4" name="introduce" id="introduce" class="form-control"></textarea>
		               	</div>
					</div>
					<div class="form-group">
					<label class="col-md-3 control-label">文档关键词</label>
						<div class="col-md-7">
							<input type="text" name="keyword" id="keyword" class="form-control">
						</div>
					</div>
					<div class="form-group">
					<label class="col-md-3 control-label">浏览权限</label>
						<div class="col-md-7">
							<select  class="form-control" name="visdep" id="visdep">
								<option hidden="hidden"></option>
								<option value="1">私人用户</option>
								<option value="2">任意用户</option>
							</select>
						</div>
					</div>
					<div class="form-group">
				    <label class="col-md-3 control-label">文档密级</label>
						<div class="col-md-7">
							<div class="col-md-5">
								<label class="radio-inline"> 
									<input type="radio" value="0" name="seclevel" id="seclevel1">一般
								</label>
							</div>
							<div class="col-md-5">
								<label class="radio-inline"> 
								<input type="radio" value="1" name="seclevel" id="seclevel2">秘密
								</label>
							</div>
							<div class="col-md-5">
								<label class="radio-inline"> 
									<input type="radio" value="2" name="seclevel" id="seclevel3">机密
								</label>
							</div>
							<div class="col-md-5">
								<label class="radio-inline"> 
								<input type="radio" value="3" name="seclevel" id="seclevel4">绝密
								</label>
							</div>
						</div>
					</div>
    			</div>
		</div>
    	<!-- 文档信息显示结束 -->
    </div>
    <!-- 整体row结束的地方 -->
	</form>
	  <!-- 资料照片 -->
	<div class="row">
	<div class="col-md-10">
		<div class="form-group" style="margin:0px 0px 0px 110px;">
		<label for="inputName" class="col-md-3 control-label">文档材料</label>
			<div class="col-md-10">
				<form id="add_talentattach_form" method="post" enctype="multipart/form-data">
					<input id="uploadfile" type="file" name="uploadfile" data-ref="url2" class="file-loading" value="test" multiple/>
					<input type="hidden" id="path" name="path" value="upload/material" >
				</form>
			</div>
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
    var addperyantiForm = null;
    $(function () {
    	/* 加载文档类型数据 */
    	sel.binddata('wordtype', "<%=request.getContextPath()%>/rest/dic/wordTypeList", 'id', 'name');
    	
    	var url;
    	//填充数据
    	var wordid = $('#curenttalentid').val();
    	var seldata = new Object();
		seldata.wordid = wordid;
		$.ajax({
                    url: "<%=request.getContextPath()%>/rest/datamanager/getWordbyid/"+wordid,
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:seldata,
                    success: function (seldata) {
                       //alert(JSON.stringify(data));
                       initdepprojectbaseinfor(seldata);
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
         });
         
         //填充数据加载函数
	function initdepprojectbaseinfor(seldata){
    	console.log(seldata);
    	var data = new Object();
    	data = seldata[0];
    	console.log(seldata);
    		$("input[name=name]").val(data.title);
			$("#wordtype option[value='"+data.dtype+"']").attr("selected","selected");
			$("textarea[name=introduce]").val(data.docabstract);
			$("input[name=keyword]").val(data.keyword);
			$("#visdep option[value='"+data.visdep+"']").attr("selected","selected");
			$("input[name='seclevel']").eq(data.seclevel).attr("checked",true);
			if(data.attur == ""){
				//alert("ss");
			}else{
			/* 由于一个文档只有一个内容，所以采用下面的形式 */
			filelist=[];
            pathArr=[];
            nameArr=[];
            pathArr.push("<%=request.getContextPath()%>"+"/"+data.attur);//文件访问地址 这里需要网络地址  例：http://localhost:8080/xxx/xx.jpg
            var obj = new Object();
            obj.key= data.id;
            obj.type = data.type;
            obj.url = "<%=request.getContextPath()%>/rest/FileUpload/springDelete"+"?fileurl="+data.attur;  //用于初始化文件删除事件地址
    		nameArr.push(obj); 
            var attach = new Object();
            attach.id = data.id;
			attach.attur = data.attur;
			attach.type=data.type;
			attach.wordId = data.id;
			filelist.push(attach);
           //显示文档附件
            initFileInputdata();
            }
		};
       
       
      //返回事件
      	$("#btn-re").on("click", function() {
        	var str = $('#preurl').val();
			/* alert(str); */
			window.location.href=str;		
			return false;
        });   
    });
    
	var oFileInput = new DSFileInput();
	var filelist=[];     
	var pathArr = new Array();//文件网络地址 集合
	var nameArr = new Array();//文件信息集合
	var filepath="upload/material";
	var selecttalent = new Object();
	
	var uploadUrl="<%=request.getContextPath()%>/rest/FileUpload/springUpload";
	var deleteUrl="<%=request.getContextPath()%>/rest/FileUpload/springDelete";
	$(function () {     
	    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);  
	});
	function uploadcallback(url,previewId,filetype) {
			var attach = new Object();
			/* attach.id = null */
			attach.attur = url;
			attach.type=filetype;
			/*attach.name="附件";
			attach.talentId = selecttalent.id; */
			filelist.push(attach);//上传
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
	};
	//这个函数在初始化植入的删除按钮事件调用，这意味着有了数据库，需要删除数据库
	function deletecallback(key)
	{	
		var data = new Object();
		data.id = key;
		if(key>0){
			$.ajax({
				url: "<%=request.getContextPath()%>/rest/datamanager/deletewordbyid",
				type: 'post',
				dataType: "json",
				cache: "false",
				data:data,
				success: function (data) {
					if (data.success) {
						toastr.success("删除数据库成功！");
						//tables.api().row().remove().draw(false);
					} else {
						toastr.error('删除失败！'+JSON.stringify(data));
					}
				},
				error: function (err) {
					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
				}
	        });
		}
		//filelist.push(url);
		//删除filelist
		//alert(filelist.length);
		filelist.removebyid(key);
		//alert(filelist.length);
	};
	
	function initFileInput()
	{
		$("#add_talentattach_form").empty();
	    $("#add_talentattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
	    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);
	};
	
	function initFileInputdata()
	{
		$("#add_talentattach_form").empty();
	    $("#add_talentattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
	    oFileInput.Initdata("uploadfile", pathArr,nameArr);
	};
	Array.prototype.removebyid = function(id) {
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
	};
	
</script>
