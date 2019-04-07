<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>部门项目管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
<link rel="stylesheet"  href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
<%-- <link rel="stylesheet" 	href="<%=request.getContextPath()%>/assets/css/default.css"> --%>
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/assets/css/fileinput.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.min.css">
<style type="text/css">
.nav-tabs {
	margin-top: 10px;
}

.nav-tabs li a {
	line-height: 2
}

.nav-tabs .active a {
	border-top: solid 2px #3498db !important;
}
</style>


<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zh.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/fileupload.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>	
</head>


<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">

		
	<!-- 查询、添加、批量删除、导出、刷新 -->
	<div class="content">
		<!-- 查询、添加、批量删除、导出、刷新 -->
		<div class="row-fluid">
			<div class="pull-right">
	            <div class="btn-group">
	                <button type="button" class="btn btn-primary btn-sm" id="btn-add">
	                    <i class="fa fa-plus"></i> 添加
	                </button>
	                <!-- <button type="button" class="btn btn-primary btn-sm" id="btn-delAll">
	                    <i class="fa fa-remove"></i> 删除
	                </button>
	                <button type="button" class="btn btn-primary btn-sm" id="btn-export">
	                    <i class="fa fa-sign-in"></i> 导出
	                </button> -->
	                <button type="button" class="btn btn-primary btn-sm" id="btn-re">
	                    <i class="fa fa-refresh"></i> 刷新
	                </button>
	            </div>
        	</div> 

			<div class="row">
				<form id="queryForm" action="" method="post">
					<div class="col-xs-1 text-right">类型:</div>
					<div class="col-xs-2">
						<select class="form-control select2" style="width: 100%;"
							id="datatypeid" name="picorvideo">
							<option value="0">图片</option>
                            <option value="1">视频</option>							
						</select>
					</div>
					<button type="button" class="btn btn-primary btn-sm" id="btn-query">
                    	<i class="fa fa-search"></i> 查询
                	</button>
				</form>
			</div>			
		</div><!--row-fluid  -->
		<table id="dataTable" class="table table-striped table-bordered table-hover table-condensed">
	        <thead>
	        <tr class="info">
	            <td width="2%" style="text-align: center;"><input type="checkbox" id="checkAll"></td>
	           <!--  <th></th> -->
	            <th width="6%" style="text-align: center;">序号</th>
	            <th width="12%" style="text-align: center;">标题</th>
	            <th width="12%" style="text-align: center;">内容</th>
	            <th width="10%" style="text-align: center;">图片或视频</th>
	            <th width="10%" style="text-align: center;">上架</th>
	            <th width="10%" style="text-align: center;">上传人</th>
	            <th width="12%" style="text-align: center;">上传时间</th>
	            <th width="12%" style="text-align: center;">附件</th>
	            <th width="12%" style="text-align: center;">操作</th>
	        </tr>
	        </thead>
	        <tbody></tbody>
	    </table>
	
	    <!-- 消息添加  -->
	    <div class="modal fade " id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	                <div class="modal-header" >
	                    <button type="button" class="close" data-dismiss="modal">
	                        <span aria-hidden="true">&times;</span>
	                        <span class="sr-only"></span>
	                    </button>
	                    <h4 class="modal-title" id="myModalLabel">素材资料</h4>
	                </div>
	                <div class="modal-body">
	                    <form class="form-horizontal"  id="addForm" action="" method="post">
	                        <input type="hidden" class="form-control" name="id" id='messageid'>
	                        <input type="hidden" class="form-control" name="userId" id='userId'>
	                        
	                        <div class="form-group">
	                            <label for="inputName" class="col-sm-3 control-label">素材类型</label>
	                            <div class="col-sm-9">
	                            	<div class="col-sm-4">
											<label class="radio-inline"> <input type="radio"
												value="0" name="picorvideo" id="imageid" checked>图像
											</label>
									</div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input type="radio"
											value="1" name="picorvideo" id="videoid">视频
										</label>
									</div>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label for="inputName" class="col-sm-3 control-label">素材标题</label>
	                            <div class="col-sm-9">
	                                <input type="text" class="form-control" name="title" id="titleid">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label for="inputName" class="col-sm-3 control-label">素材内容</label>
	                            <div class="col-sm-9">
	                                <textarea class="form-control" type="text" name="introduction" id="introductionid" rows="5" cols="34.5"></textarea>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label for="inputName" class="col-sm-3 control-label">是否显示</label>
	                            <div class="col-sm-9">
	                            	<div class="col-sm-4">
											<label class="radio-inline"> <input type="radio"
												value="0" name="isopen" id="isopenid" checked>显示
											</label>
									</div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input type="radio"
											value="1" name="isopen" id="isopencloseid">撤回
										</label>
									</div>
	                            </div>
	                        </div>
							<div class="form-group">
								<label for="inputName" class="col-sm-3 control-label">添加附件</label>
								<div class="col-sm-9" id="add_messageattach_form">
								<!-- <form id="add_messageattach_form" method="post" enctype="multipart/form-data"> -->
									<input id="uploadfile" type="file" name="uploadfile" data-ref="url2" class="file-loading" value="test" /> <!-- multiple -->
									
									<!-- <input type="hidden" id="path" name="path" value="upload/message" > -->
								<!-- </form> -->
								</div>
								<input type="hidden" id="attachurl" name="url" >  <!-- 放在这个add_messageattach_form div中会被后边的初始化删掉 -->
							</div>
							</form>
								
							
							
							<div class="modal-footer">
	                			<button type="button" id="btn-add-cancel" class="btn btn-default"
									data-btn-type="cancel" data-dismiss="modal">
									<i class="fa fa-reply">&nbsp;取消</i>
								</button>
								<button type="submit" id="btn-add-submit" class="btn btn-primary" data-dismiss="modal">
													<i class="fa fa-paper-plane">&nbsp;保存</i>
								</button>
	                		</div>                                              
	                </div>
	                <!-- modal-body END -->
	            </div>
	        </div>
	    </div>
		
		
	</div> <!-- content  -->

</body>
</html>
<script>
 	var date = new Date();
	$('.date').datetimepicker({
		minView: "month",
		format:'yyyy-mm-dd hh:ii:ss',
		startDate:date,
		todayBtn:true,
		autoclose: 1,
		locale:moment.locale('zh-cn')
	});
	var querydata = [];
	querydata.querystring=null;
  	$(function() {    	
  		var str = "";
    	<shiro:hasAnyRoles name = "admin">
    	 str+= "<div class='btn-group'>" +
         "<button id='detailRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-eye'></i></button>" +
         "<button id='delRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-trash-o'></i></button>" +
         "</div>"
    	 </shiro:hasAnyRoles>
         
        var url = "<%=request.getContextPath()%>/rest/prewebloginpage/frontlogindatadataGrid";
        var tables = $("#dataTable").dataTable({
            serverSide: true,//分页，取数据等等的都放到服务端去
            //processing: true,//载入数据的时候是否显示“载入中”
            pageLength: 10,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            pagingType: "full_numbers",
            autoWidth: false,
            stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索
            ajax: {
                type: "post",
                url: url,
                dataSrc: "data",        
                dataType:'json',
                /* data: function(){
					
                } */
                data:querydata
            },
             "createdRow": function (row, data, index) {
                // 设置表格中的内容居中 
                $('td', row).attr("class", "text-center");
            },
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": 'title'},
                {
                        data: 'introduction',
                        //title: '内容',
                        
                        align: 'center',
                        colspan: 1,
                        width:60,
                        "render": function (data, type, full, callback) {
                        	if (data == null) {
                				return "";
            				}
            				var offlineTimeStr = "<div style='width:180px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis'>"+data+"</div";
            				return offlineTimeStr;
                    	}                         
                },
                //{"data": 'picorvideo'},
                {
                	"data":'picorvideo',
                	"render": function (data, type, full, callback) {
                        //状态：0已发送；1终止。
                        switch (data) {
                            case 0: return "图片"; break;
                            case 1: return "视频 "; break;
                        }
                       
                    }  
                },        
                //{"data": 'isopen'},
                 {
                	"data":'isopen',
                	"render": function (data, type, full, callback) {
                        //状态：0已发送；1终止。
                        switch (data) {
                            case 0: return "显示"; break;
                            case 1: return "撤回"; break;
                        }
                       
                    }  
                },
                {"data": 'username'},
                {
                	"data": 'uptime',
                	"render": function (data, type, full, callback) {
                        if (data == null) {
                			return "";
            			}
            			var offlineTimeStr = new Date(data).format("yyyy-MM-dd");
            			return offlineTimeStr;
                    }  
                },
                {
                	data:'url',
                	"width": "40px",
        			"title": "附件",
                	"render": function (data, type, full, callback) {
                        	if (data == null) {
                				return "";
            				}
            				var offlineTimeStr = "<a href='"+data+"' target='_blank'>"+"查看</a";
            				return offlineTimeStr;
                    }  
                },
                {"data":'columnDefs'}
            ],

			//操作按钮
            columnDefs: [
                {
                    targets: 0,
                    defaultContent: "<input type='checkbox' name='checkList'>"
                },
                {
                    targets: -1,
                    defaultContent: str
                }
            ],
            language: {
                lengthMenu: "",
                processing: "",
                paginate: {
                    previous: "<",
                    next: ">",
                    first: "<<",
                    last: ">>"
                },
                zeroRecords: "",
                info: "",
                infoEmpty: "",
                infoFiltered: "",
                sSearch: "",
            },
			//在每次table被draw完后回调函数
            fnDrawCallback: function () {
                var api = this.api();
				//获取到本页开始的条数
                var startIndex = api.context[0]._iDisplayStart;
                api.column(1).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            }
        });
        
        $("#btn-query").on("click", function () {
            var str = $("#datatypeid").val();
            
            querydata.querystring = str;			
			var oSettings = tables.fnSettings();
			oSettings.ajax.data = querydata;	            	
			tables.api().ajax.reload();
        });
        //刷新
        $("#btn-re").on("click", function () {
        	window.location.reload();
            tables.fnDraw(false);//刷新保持分页状态
        });  
        //添加
        $("#btn-add").on("click", function () {
        	/* 清空一下下拉框 */
        	//$("#uploadfile").fileinput('refresh').fileinput('clear');  ////$("#uploadfile").fileinput('reset'); 	
 			//$("#uploadfile").fileinput('destroy');//
			//$('#uploadfile').unbind(); //这个重要，否则在fileupload.js中绑定的事件回重复调用	
			
            pathArr=[];
            nameArr=[];
            
            initFileInput();           
           	$('#isopenid').prop("checked",true);
           	$('#imageid').prop("checked",true);
           $("#titleid").val("");
           $("#introductionid").val("");
            
            $("#btn-add-submit").show();
            $("#btn-add-cancel").show();
            $("#addModal").modal("show");
        });
  		
  		
  		
  		/* 该段代码为信息附件的相关代码*/       
		var oFileInput = new DSFileInput();    
		var pathArr = new Array();//文件网络地址 集合
		var nameArr = new Array();//文件信息集合
		var filepath="upload/frontimg";
		var selectmessage = new Object();
		var upfilenum = 0;
		var uploadUrl="<%=request.getContextPath()%>/rest/FileUpload/springUpload";
		var deleteUrl="<%=request.getContextPath()%>/rest/FileUpload/springDelete";
		/* $(function () { 
		    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);  
		}); */
		//添加附件
		function initFileInput()
		{
			$("#add_messageattach_form").empty();
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);
		    upfilenum=0;
		};
		//展示附件
		function initFileInputdata()
		{
			upfilenum = pathArr.length;
			$("#add_messageattach_form").empty();
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Initdata("uploadfile", pathArr,nameArr);
		};
		function uploadcallback(url,previewId,filetype) {
				$("#attachurl").val(url);
				upfilenum = upfilenum + 1;
				var deleteaction = deleteUrl + "?fileurl=" +url;
				$("#" + previewId).find(".kv-file-remove").click(function() {
					$.ajax({
						url : deleteaction,
						type : "post",
						dataType : "json",
						success : function(result) {	
							upfilenum = upfilenum -1;						
							//alert(JSON.stringify(result));
						},
						error : function(result) {
							//异常操作
						}
					});
				});
		}
		/* 在发送消息的时候，没有提供修改的功能，所以此处在修改附件时的删除功能并没有调用。 */
		//这个函数在初始化植入的删除按钮事件调用，这意味着有了数据库，需要删除数据库  这个函数暂时没有起作用
		function deletecallback(key)
		{	
			alert(key);
			return;
			var data = new Object();			
			data.id = key;
			if(key>0){
				$.ajax({
					url: "<%=request.getContextPath()%>/rest/xxx/xxx",
					type: 'post',
					dataType: "json",
					cache: "false",
					data:data,
					success: function (data) {
						if (data.success) {
							toastr.success("删除成功！");
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
		//添加消息时，保存按钮的事件 saveMessageInfor
        $("#btn-add-submit").on("click", function () {
        		checkaddbaseinfoformvalidator();
	        	$("#addForm").bootstrapValidator('validate'); //提交验证
				if (!$("#addForm").data('bootstrapValidator').isValid()) { 
					return false;
				}
        
        		if ( upfilenum > 1){
        			toastr.warning('上传的附件超过一个，只有最后一个有效！,系统中会产生一个垃圾数据！');
        		}
        		if ( upfilenum < 1){
        			toastr.error('附件没有上传！');
        			return false;
        		}

 				var dataform=$('#addForm').form();
 				var params = dataform.getFormSimpleData();
 				//console.log(params); 
 				//alert(JSON.stringify(params));	
 				//return false;			
 				$.ajax({
 				url : "<%=request.getContextPath()%>/rest/prewebloginpage/addFrontlogindataInfo", 
 				type : 'post',
 				cache : "false",
 				data : params, //
 				dataType : "json",
 				success : function(data) {
 					if (data.success) {
 						//刷新列表
 						toastr.success('保存成功！');
 					} else {
 						toastr.error('保存失败！' + JSON.stringify(data));
 					}
 					//刷新页
 					
 					tables.fnDraw();
 				},
 				error : function(err) {
 					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
 				}
 				
 			});
 			
 			$("#addForm").data('bootstrapValidator').destroy();
			$("#addForm").data('bootstrapValidator', null);
			checkaddbaseinfoformvalidator();
 		});
 		//查看消息
        $("#dataTable tbody").on("click", "#detailRow", function () {
        	var data = tables.api().row($(this).parents("tr")).data();
			//console.log(data)	
		   //alert(JSON.stringify(data));
           if(data.isopen == 0){
            	$('#isopenid').prop("checked",true);
           }else{
           		$('#isopencloseid').prop("checked",true);
           }
           if(data.picorvideo == 0){
            	$('#imageid').prop("checked",true);
           }else{
           		$('#videoid').prop("checked",true);
           }
           $("#titleid").val(data.title);
           $("#introductionid").val(data.introduction);
           pathArr=[];
           nameArr=[];
        
           	pathArr.push("<%=request.getContextPath()%>"+"/"+data.url);//文件访问地址 这里需要网络地址  例：http://localhost:8080/xxx/xx.jpg
   			var obj = new Object(); 
   			obj.caption=data.title;//item.id;    			
   			obj.type = "image";
   			obj.size =100;
   			obj.key= 1;
   			obj.url = "<%=request.getContextPath()%>/rest/FileUpload/springDelete"+"?fileurl="+data.url;  //用于初始化文件删除事件地址
   			    			
   			nameArr.push(obj); 
    	 	
           //显示附件列表
            initFileInputdata();
            
            $("#btn-add-cancel").hide();
            $("#btn-add-submit").hide();
            $("#addModal").modal("show"); 
        });
		//删除     发送发可以删除所有的信息
		$("#dataTable tbody").on("click", "#delRow", function() {

			var data = tables.api().row($(this).parents("tr")).data();
			if (confirm("是否确认删除这条信息?")) {
			
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/rest/prewebloginpage/delectfrontlogindata',
					data : {
						id : data.id
					},
					traditional : true,
					success : function(result) {
						if (result.msg == "删除成功") {
							localStorage.clear();
							history.go(0);
						} else {
							alert(result.msg);
						}
					}
				});
			}
		});
  		
  	});
  	
  	function checkaddbaseinfoformvalidator()
	{
		$("#addForm").bootstrapValidator({
                live: 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
                excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
                //submitButtons: '#checkrecordbtn-submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
                message: '通用的验证失败消息',//好像从来没出现过
                feedbackIcons: {//根据验证结果显示的各种图标
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {                    
                    title:{
                    	validators: {
                            notEmpty: {//检测非空,radio也可用
                                message: '标题必须输入'
                            }
                        }
                    }
                    
                }
            }).on("success.form.bv",function(e){					
				e.preventDefault(); //防止默认提交，验证通过就默认提交，如果手动在提交一次，如ajax方式就重复提交了，当然如果是提交form的anction则通过后自动就提交了，更好						
			}); /* end $('#editForm').bootstrapValidator */
	}  /* end function */
</script>