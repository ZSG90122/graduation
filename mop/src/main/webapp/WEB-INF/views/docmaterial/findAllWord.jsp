<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>文档资源管理</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/fileinput.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse" style="font-size:16px;">
<input type="hidden" class="form-control" name="querystr"
		id='querystr' value="${querystr}">
<input type="hidden" class="form-control" name="talentroleId" id='talentroleId' >
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="row">
					<div class="col-sm-3">
						<h4>文档资源管理</h4>
					</div>
				</div>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-3">
						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<div id="tree"></div>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<div class="row-fluid">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-add">
										<i class="fa fa-plus"></i>添加
									</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-delAll">
										<i class="fa fa-remove"></i>删除
									</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-re">
										<i class="fa fa-refresh"></i>刷新
									</button>
								</div>
							</div>
							<div class="row">
								<form id="queryForm" action="" method="post"
									onkeydown="if(event.keyCode==13)return false;">
									<div class="col-xs-3">
										<input type="text" id="keyword" name="keyword"
											class="form-control input-sm" placeholder="请输入文档名称" />
									</div>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-query">
										<i class="fa fa-search"></i>查询
									</button>
								</form>
							</div>
							<!--表格-->
							<table id="dataTable"
								class="table table-striped table-bordered table-hover table-condensed"
								style="font-size:14px;">
								<thead>
									<tr class="info">
										<th width="2%" style="text-align: center;"><input id="checkAll" type='checkbox'></th>
										<th width="2%" style="text-align: center;">序号</th>
										<th width="3%" style="text-align: center;">名称</th>
										<th width="3%" style="text-align: center;">类型</th>
										<!-- <th>简介</th> -->
										<th width="4%" style="text-align: center;">关键词</th>
										<th width="4%" style="text-align: center;">浏览权限</th>
										<th width="2%" style="text-align: center;">密级</th>
										<th width="3%" style="text-align: center;">上传用户</th>
										<th width="3%" style="text-align: center;">上传时间</th>
										<!-- <th>详情</th> -->
										<th width="3%" style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
					<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- 信息添加 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only"></span>
					</button>
					<h4 class="modal-title" id="myModalLabel">文档资源信息添加</h4>
				</div>
				<div class="modal-body">
					<!-- <form id="form_add" action="" method="post">
					</form> -->
					 <!-- 下面这个form表单：包含文档的基本信息 -->         			
					<form class="form-horizontal"  id="form_add" action="" method="post">
				    <input type="hidden" class="form-control" name="wordid" id='wordid'> 
				    <div class="row">
				    	<div class="col-sm-15">
				    			<div class="col-md-10">
				    				<div class="form-group">
									<label class="col-md-4 control-label">文档名称</label>
										<div class="col-md-7">
											<input type="text" name="name" id="name" class="form-control">
										</div>
									</div>
									<div class="form-group">
									<label class="col-md-4 control-label">文档类别</label>
										<div class="col-md-7">
											<select  class="form-control" name="wordtype" id="wordtype">
											</select>
										</div>
									</div>
									<div class="form-group">
						        	<label class="col-md-4 control-label">文档简介</label>
						           		<div class="col-md-7">
						               		<textarea rows="2" cols="4" name="introduce" id="introduce" class="form-control"></textarea>
						               	</div>
									</div>
									<div class="form-group">
									<label class="col-md-4 control-label">文档关键词</label>
										<div class="col-md-7">
											<input type="text" name="keyword1" id="keyword1" class="form-control">
										</div>
									</div>
									<div class="form-group">
									<label class="col-md-4 control-label">浏览权限</label>
										<div class="col-md-7">
											<select  class="form-control" name="visdep" id="visdep">
												<option hidden="hidden"></option>
												<option value="1">私人用户</option>
												<option value="2">任意用户</option>
											</select>
										</div>
									</div>
									<div class="form-group">
								    <label class="col-md-4 control-label">文档密级</label>
										<div class="col-md-7">
											<select  class="form-control" name="seclevel" id="seclevel">
												<option hidden="hidden"></option>
												<option value="0">一般</option>
												<option value="1">秘密</option>
												<option value="2">机密</option>
												<option value="3">绝密</option>
											</select>
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
					<div class="col-md-15">
						<div class="form-group" style="margin:0px 0px 0px 75px;">
						<label for="inputName" class="col-md-4 control-label">文档材料</label>
							<div class="col-md-10">
								<form id="add_talentattach_form" method="post" enctype="multipart/form-data">
									<input id="uploadfile" type="file" name="uploadfile" data-ref="url2" class="file-loading" value="test" multiple/>
									<input type="hidden" id="path" name="path" value="upload/material" >
								</form>
							</div>
						</div>
					</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="margin:30px 0px 0px 230px;">
							<div class="form-group">
								<button type="button" class="btn btn-primary btn-sm" id="btn-update-submit" >
								 <i class="fa fa-plus"></i>保存
								</button>
							</div>
						</div>
					</div>
									
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<script	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script	src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script	src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script	src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script	src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script	src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zh.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/fileupload.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script>
	var name = "";
	var nameid = "";
	var querystrdata = [];
	querystrdata.querystring = "";
	var restr =$('#querystr').val();
	 
	if(restr!=""){
		querystrdata.querystring = restr;
		var qarr = restr.split(",");
		nameid = qarr[1];
		name = qarr[0];
	}
	//页面加载完成后根据查询语句设置查询框中的选项
	window.onload = function(){ 
		 if(null!=name){
		 	$('#keyword').val(name);
		 }
		 if(null!=nameid){
		 	$('#talentroleId').val(nameid);
		 }
	} 
	$(function() {
		/* 加载文档类型数据 */
    	sel.binddata('wordtype', "<%=request.getContextPath()%>/rest/dic/wordTypeList", 'id', 'name');
		//添加、修改异步提交地址
		var str = "";
		<shiro:hasAnyRoles name = "admin">
		    	 str+= "<div class='btn-group'>" +
		    	 "<a id='dailRow' class='label label-primary' ><i class='fa fa-eye'></i></a>" +
		         "<a id='editRow' class='label label-primary' ><i class='fa fa-edit'></i></a>" +
		         "<a id='dowloadRow' class='label label-primary' ><i class='fa fa-download'></i></a>" +
		         "<a id='delRow' class='label label-primary' ><i class='fa fa-trash-o'></i></a>" +
		         "</div>"
		</shiro:hasAnyRoles>

		/*填充table数据  */
		var url = "";
		var tables = $("#dataTable").dataTable({
			serverSide : true, //分页，取数据等等的都放到服务端去
			//processing: true,//载入数据的时候是否显示“载入中”
			pageLength : 10, //首次加载的数据条数
			ordering : false, //排序操作在服务端进行，所以可以关了。
			pagingType : "full_numbers", //首页，尾页，上一页和下一页四个按钮,加上数字按钮
			autoWidth : false,
			stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
			searching : false, //禁用datatables搜索
			ajax : {
				type : "post",
				url : "<%=request.getContextPath()%>/rest/datamanager/getAllDocInfo", /* 得到所有的文档信息 */
				dataSrc : "data",
				dataType : 'json',
				data:querystrdata
				/* data : function(d) {
					var param = {};
					param.draw = d.draw;
					param.start = d.start;
					param.length = d.length;
					param.userId = ${user.id};
					return param; //自定义需要传递的参数。
				} */
			},
			columns : [ //对应上面thead里面的序列
				{
					"data" : null
				},
				{
					"data" : 'id'
				},
				{
					"data" : 'title'
				},
				{
					"data" : 'typeName'
				},
				/* {
					"data" : 'docabstract'
				}, */
				{
					"data" : 'keyword'
				},
				{
					"data" : 'visdep',
					"render" : function(data, type, row, meta) {
						var visdep = "";
						switch (data) {
						case 1:
							visdep = "私人用户";
							break;
						case 2:
							visdep = "任意用户";
							break;
						}
						return visdep;
					}
				},
				{
					"data" : 'seclevel',
					"render" : function(data, type, row, meta) {
						var selevel = "";
						switch (data) {
						case 0:
							selevel = "一般";
							break;
						case 1:
							selevel = "秘密";
							break;
						case 2:
							selevel = "机密";
							break;
						case 3:
							selevel = "绝密";
							break;
						}
						return selevel;
					}
				},
				{
					"data" : 'seclevelName'
				},
				{
					"data" : 'pubtime',
					"render" : function(data, type, full, callback) {
						if (data == null) {
							return "";
						}
						var offlineTimeStr = new Date(data).Format("yyyy-mm-dd");
						return offlineTimeStr;
					}
				},
				{
					"data" : 'columnDefs'
				}
			],
			//操作按钮
			columnDefs : [
				{
					targets : 0,
					defaultContent : "<input type='checkbox'  name='checkList'>"
				},
				{
					targets : -1,
					defaultContent : str
				}
			],
			language : {
				lengthMenu : "",
				processing : "",
				paginate : {
					previous : "<",
					next : ">",
					first : "<<",
					last : ">>"
				},
				zeroRecords : "",
				info : "",
				infoEmpty : "",
				infoFiltered : "",
				sSearch : "",
			},
			//在每次table被draw完后回调函数
			fnDrawCallback : function() {
				var api = this.api();
				//获取到本页开始的条数
				var startIndex = api.context[0]._iDisplayStart;
				api.column(1).nodes().each(function(cell, i) {
					cell.innerHTML = startIndex + i + 1;
				});
				/*  为查看按钮绑定点击事件*/
		        $(".fa-download").off("click").click(function(){
		            var data = tables.api().row($(this).parents("tr")).data();
		             window.open('<%=request.getContextPath()%>/rest/PreWebPages/QuertyInformDetail/'+data.id, '_blank') 
		        })
			}
		});
		/*初始化表格填充完毕  */
		//查询按钮
		$("#btn-query").on("click", function() {
			if($("#talentroleId").val()!=""){
				$("#talentroleId").val("");
			}
			querystrdata.querystring = "";
			
			var querystring = $("#keyword").val();
			if(querystring==""){
				querystring="kong";
			}else{
				querystrdata.querystring = querystring;
			}
			tables.fnClearTable(false); //清空数据
			tables.fnDestroy(); //销毁datatable
			$("#dataTable").dataTable({
				serverSide : true, //分页，取数据等等的都放到服务端去
				pageLength : 10, //首次加载的数据条数
				ordering : false, //排序操作在服务端进行，所以可以关了。
				pagingType : "full_numbers",
				autoWidth : false,
				stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
				searching : false, //禁用datatables搜索
				ajax : {
					type : "post",
					url : "<%=request.getContextPath()%>/rest/datamanager/getDocInfoBytitle/" + querystring,
					dataSrc : "data",
					dataType : 'json',
					data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;
						param.length = d.length;
						param.userId = ${user.id};
						var formData = $("#queryForm").serializeArray(); //把form里面的数据序列化成数组
						formData.forEach(function(e) {
							param[e.name] = e.value; //=========================================
						});
						return param; //自定义需要传递的参数。
					}
				},
				columns : [ //对应上面thead里面的序列
					{
						"data" :'null'
					},
					{
						"data" : 'id'
					},
					{
						"data" : 'title'
					},
					{
						"data" : 'typeName'
					},
					/* {
						"data" : 'docabstract'
					}, */
					{
						"data" : 'keyword'
					},
					{
						"data" : 'visdep',
						"render" : function(data, type, row, meta) {
							var visdep = "";
							switch (data) {
							case 1:
								visdep = "私人用户";
								break;
							case 2:
								visdep = "任意用户";
								break;
							}
							return visdep;
						}
					},
					{
						"data" : 'seclevel',
						"render" : function(data, type, row, meta) {
							var selevel = "";
							switch (data) {
							case 0:
								selevel = "一般";
								break;
							case 1:
								selevel = "秘密";
								break;
							case 2:
								selevel = "机密";
								break;
							case 3:
								selevel = "绝密";
								break;
							}
							return selevel;
						}
					},
					{
						"data" : 'seclevelName'
					},
					{
						"data" : 'pubtime',
						"render" : function(data, type, full, callback) {
							if (data == null) {
								return "";
							}
							var offlineTimeStr = new Date(data).Format("yyyy-mm-dd");
							return offlineTimeStr;
						}
					},
					{
						"data" : 'columnDefs'
					}
				],
				//操作按钮
				columnDefs : [
					{
						targets : 0,
						defaultContent : "<input type='checkbox'  name='checkList'>"
					},
					{
						targets : -1,
						defaultContent : str
					}
				],
				language : {
					lengthMenu : "",
					processing : "",
					paginate : {
						previous : "<",
						next : ">",
						first : "<<",
						last : ">>"
					},
					zeroRecords : "",
					info : "",
					infoEmpty : "",
					infoFiltered : "",
					sSearch : "",
				},
				//在每次table被draw完后回调函数
				fnDrawCallback : function() {
					var api = this.api();
					//获取到本页开始的条数
					var startIndex = api.context[0]._iDisplayStart;
					api.column(1).nodes().each(function(cell, i) {
						cell.innerHTML = startIndex + i + 1;
					});
					/*  为查看按钮绑定点击事件*/
	                $(".fa-eye").off("click").click(function(){
	                    var data = tables.api().row($(this).parents("tr")).data();
	                     window.open('<%=request.getContextPath()%>/rest/PreWebPages/QuertyInformDetail/'+data.id, '_blank') 
	                })
				}
			})
			localStorage.clear();
		});
		/* end 用户查询完毕  */
		//修改
		$("#dataTable tbody").on("click", "#editRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			if($("#keyword").val()=="" && $("#talentroleId").val()==""){
				querystrdata.querystring="";
			}else if($("#keyword").val()!="" && $("#talentroleId").val()==""){
				querystrdata.querystring = $("#keyword").val()+","+"k";
			}else if($("#keyword").val()=="" && $("#talentroleId").val()!=""){
				querystrdata.querystring = ""+","+$("#talentroleId").val();
			}
			
			var preurl = "<%=request.getContextPath()%>/rest/datamanager/doceditView?querystr="+querystrdata.querystring;
            window.location.href="<%=request.getContextPath()%>/rest/datamanager/wordEdit?wordid="+data.id+"&preurl="+preurl;
			<%-- window.location.href="<%=request.getContextPath()%>/rest/datamanager/wordEdit?wordid="+data.id; --%>
		});
		//查看
		$("#dataTable tbody").on("click", "#dailRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			 if($("#keyword").val()=="" && $("#talentroleId").val()==""){
				querystrdata.querystring="";
			}else if($("#keyword").val()!="" && $("#talentroleId").val()==""){
				querystrdata.querystring = $("#keyword").val()+","+"k";
			}else if($("#keyword").val()=="" && $("#talentroleId").val()!=""){
				querystrdata.querystring = ""+","+$("#talentroleId").val();
			}
			 var preurl = "<%=request.getContextPath()%>/rest/datamanager/doceditView?querystr="+querystrdata.querystring;
            window.location.href="<%=request.getContextPath()%>/rest/datamanager/WordDetail?wordid="+data.id+"&preurl="+preurl;
			<%-- window.location.href="<%=request.getContextPath()%>/rest/datamanager/WordDetail?wordid="+data.id; --%>
		});
		//添加文档资源信息前的数据填充
		$("#btn-add").on("click", function() {
			$("input[name=name]").val("");
			$("select[name=wordtype]").val("");
			$("textarea[name=introduce]").val("");
			$("input[name=keyword1]").val("");
			$("select[name=visdep]").val("");
			$("select[name=seclevel]").val("");
			
			//初始化上传控件             
            filelist=[];
            pathArr=[];
            nameArr=[];
            initFileInput(); 
			$("#addModal").modal("show");
		});
		//修改人才信息时，保存按钮的事件 
        $("#btn-update-submit").on("click", function () {
 				if(filelist.length<=0){
 					alert("文档材料不能为空，请添加文档材料!");
 					return false;
 				}
 				
 				var dataform=$('#form_add').form();
 				var params = dataform.getFormSimpleData();
 				params.level = 0;
 				params.pubperson = ${user.id};
 				var personid = ${user.id};
 				params.fileliststr=JSON.stringify(filelist);
 				params.title = String($("#name").val());
 				params.docabstract=String ($("textarea[name=introduce]").val());
 				params.dtype = String ($("#wordtype option:selected").val());
 				params.keyword = String ($("#keyword1").val());
 				params.visdep = String ($("#visdep option:selected").val());
 				params.seclevel=String ($("#seclevel option:selected").val());
 				$.ajax({
 				url : "<%=request.getContextPath()%>/rest/datamanager/adddateWord/"+personid, 
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
 					/* //刷新页
 					
 					tables.fnDraw(); */
 				},
 				error : function(err) {
 					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
 				}
 				
 			});
 			window.location.reload();
 		});
		
		//批量删除
		$("#btn-delAll").on("click", function() {
			var tables = $("#dataTable").dataTable();
			var checkList_id = new Array();
			var checkList = $("input[name='checkList']:checked");
			for (var i = 0; i < checkList.length; i++) {
				var data = tables.api().row($(checkList.eq(i)).parents("tr")).data();
				checkList_id[i] = parseInt(data.id);
			}
			if (confirm("是否确认删除这些信息?")) {
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/rest/datamanager/deleteDocdep',
					data : {
						doc_id : checkList_id
					},
					traditional : true,
					success : function(result) {
						if (result.msg == "删除成功") {
							history.go(0);
							localStorage.clear();
						} else {
							alert(result.msg);
						}
					}
				});
			}
		});

		//刷新
		$("#btn-re").on("click", function() {
			if($("#keyword").val()=="" && $("#talentroleId").val()==""){
				querystrdata.querystring="";
			}else if($("#keyword").val()!="" && $("#talentroleId").val()==""){
				querystrdata.querystring = $("#keyword").val()+","+"k";
			}else if($("#keyword").val()=="" && $("#talentroleId").val()!=""){
				querystrdata.querystring = ""+","+$("#talentroleId").val();
			}
			window.location.href="<%=request.getContextPath()%>/rest/datamanager/doceditView?querystr="+querystrdata.querystring;
			tables.fnDraw(false); //刷新保持分页状态
		});
		//checkbox全选
		$("#checkAll").on("click", function() {
			if ($(this).prop("checked") === true) {
				$("input[name='checkList']").prop("checked", $(this).prop("checked"));
				$("#dataTable tbody tr").addClass('selected');
				$(this).hasClass('selected')
			} else {
				$("input[name='checkList']").prop("checked", false);
				$("#dataTable tbody tr").removeClass('selected');
			}
		});
		
		//删除
	$("#dataTable tbody").on("click", "#delRow", function() {
		var checkList_id = new Array();
		var tables = $("#dataTable").dataTable();
		var data = tables.api().row($(this).parents("tr")).data();
		console.log(data)
		checkList_id[0] = parseInt(data.id);
		console.log(checkList_id[0])
		if (confirm("是否确认删除这条信息?")) {
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/rest/datamanager/deleteDocdep',
				data : {
					doc_id : checkList_id
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
	//初始化左边树
	initTree(0);
	bindEvent();
	});
	//填充下拉列表
	function fullselect(data, selected) {
		var str = ""; // 
		data.forEach(function(e) {
			if (e.id == selected) {
				str = str + '<option value="' + e.id + '" selected="selected">' + e.text + '</option>';
			} else {
				str = str + '<option value="' + e.id + '">' + e.text + '</option>';
			}
		})
		return str;
	}

	function initTree(selectNodeId) {
		var treeData = null;
		ajaxPost("<%=request.getContextPath()%>/rest/datamanager/treeData", null, function(data) {
			treeData = data;
			console.log(treeData);
		});
		
		$("#tree").treeview({
			data : treeData,
			showBorder : true,
			expandIcon : "glyphicon glyphicon-stop",
			collapseIcon : "glyphicon glyphicon-unchecked",
			levels : 0
		});
		if (treeData.length == 0)
			return;
		//默认选中第一个节点
		selectNodeId = selectNodeId || 0;
		$("#tree").data('treeview').selectNode(selectNodeId);
		$("#tree").data('treeview').expandNode(selectNodeId);
		$("#tree").data('treeview').revealNode(selectNodeId);
		//选中树中的名称和id 用于添加时使用
		var tree_names = $('#tree').treeview('getUnselected');
		console.log(tree_names);
		var docType = fullselect(tree_names);
		//添加文档类型下拉列表
		$("#dtype").empty();
		$("#dtype").append(docType);
		$("#updtype").empty();
		$("#updtype").append(docType);

	}

	//为树绑定一个事件
	function bindEvent() {
		$('#tree').on('nodeSelected', function(event, data) {
			var str = "";
			<shiro:hasAnyRoles name = "admin">
		    	 str+= "<div class='btn-group'>" +
		    	 "<a id='dailRow' class='label label-primary' ><i class='fa fa-eye'></i></a>" +
		         "<a id='editRow' class='label label-primary' ><i class='fa fa-edit'></i></a>" +
		         "<a id='dowloadRow' class='label label-primary' ><i class='fa fa-download'></i></a>" +
		         "<a id='delRow' class='label label-primary' ><i class='fa fa-trash-o'></i></a>" +
		         "</div>"
		    </shiro:hasAnyRoles>
			var tables = $("#dataTable").dataTable();
			//获取文档资源 id 方便添加信息时使用
			if($("#keyword").val()!=""){
				$("#keyword").val("");
			}
			querystrdata.querystring = "";
			
			var docdepId = data.id;
			$("#docdepId").val(docdepId);
			$("#talentroleId").val(docdepId);
			var querystring = $("#docdepId").val();
			if(querystring==""){
				querystring="kong";
			}else{
				querystrdata.querystring = querystring;
			}
			
			//点击节点时  获取该节点下所有子节点的id传给后端 
			tables.fnClearTable(false); //清空数据
			tables.fnDestroy(); //销毁datatable
			$("#dataTable").dataTable({
				serverSide : true, //分页，取数据等等的都放到服务端去
				pageLength : 10, //首次加载的数据条数
				ordering : false, //排序操作在服务端进行，所以可以关了。
				pagingType : "full_numbers",
				autoWidth : false,
				stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
				searching : false, //禁用datatables搜索
				ajax : {
					type : "post",
					url : "<%=request.getContextPath()%>/rest/datamanager/getAllDocInfoeditById/"+docdepId,
					dataSrc : "data",
					dataType : 'json',
					data:querystrdata
					/* data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;  
						param.length = d.length;
						param.userId = ${user.id};
						return param; //自定义需要传递的参数。
					}  */
				},
				columns : [ //对应上面thead里面的序列
					{
						"data" : 'null'
					},
					{
						"data" : 'id',
					},
					{
						"data" : 'title'
					/* 下拉菜单 */
					},
					{
						"data" : 'typeName'
					},
					/* {
						"data" : 'docabstract'
					}, */
					{
						"data" : 'keyword'
					},
					{
						"data" : 'visdep',
						"render" : function(data, type, row, meta) {
							var visdep = "";
							switch (data) {
							case 1:
								visdep = "私人用户";
								break;
							case 2:
								visdep = "任意用户";
								break;
							}
							return visdep;
						}
					},
					{
						"data" : 'seclevel',
						"render" : function(data, type, row, meta) {
							var selevel = "";
							switch (data) {
							case 0:
								selevel = "一般";
								break;
							case 1:
								selevel = "秘密";
								break;
							case 2:
								selevel = "机密";
								break;
							case 3:
								selevel = "绝密";
								break;
							}
							return selevel;
						}
					},
					{
						"data" : 'seclevelName'
					},
					{
						"data" : 'pubtime',
						"render" : function(data, type, full, callback) {
							if (data == null) {
								return "";
							}
							var offlineTimeStr = new Date(data).Format("yyyy-mm-dd");
							return offlineTimeStr;
						}
					},
					/* {
						"data" : 'attur',
						"render" : function(data, type, row, meta) {
							if (data) {
	                            return '<a href="javascript:;" class="label label-primary faeye"><i class="fa fa-eye"></i></a>';
	                        } else {
	                            return data
	                        }
						}
					}, */
					{
						"data" : 'columnDefs'
					}
				],
				//操作按钮
				columnDefs : [
					{
						targets : 0,
						defaultContent : "<input type='checkbox'  name='checkList'>"
					},
					{
						targets : -1,
						defaultContent : str
					}
				],
				language : {
					lengthMenu : "",
					processing : "",
					paginate : {
						previous : "<",
						next : ">",
						first : "<<",
						last : ">>"
					},
					zeroRecords : "",
					info : "",
					infoEmpty : "",
					infoFiltered : "",
					sSearch : "",
				},
				//在每次table被draw完后回调函数
				fnDrawCallback : function() {
					var api = this.api();
					//获取到本页开始的条数
					var startIndex = api.context[0]._iDisplayStart;
					api.column(1).nodes().each(function(cell, i) {
						cell.innerHTML = startIndex + i + 1;
					});
					/*  为查看按钮绑定点击事件*/
                    $(".fa-download").off("click").click(function(){
                        var data = tables.api().row($(this).parents("tr")).data();
                         window.open('<%=request.getContextPath()%>/rest/PreWebPages/QuertyInformDetail/'+data.id, '_blank') 
                    })
				}
			})
			localStorage.clear();
			tables.fnDraw(); //查询后不需要保持分页状态，回首页 
		});
	}
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
