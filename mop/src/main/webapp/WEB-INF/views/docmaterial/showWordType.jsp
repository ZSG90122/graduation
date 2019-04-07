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
<title>文档资源查看</title>
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
<!--  下面两个是多文件上传-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/default.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/fileinput.css">
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
						<h4>文档资源查看</h4>
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
										<th width="2%" style="text-align: center;">序号</th>
										<th width="2%" style="text-align: center;">名称</th>
										<th width="2%" style="text-align: center;">类型</th>
										<!-- <th>简介</th> -->
										<th width="3%" style="text-align: center;">关键词</th>
										<th width="2%" style="text-align: center;">浏览权限</th>
										<th width="2%" style="text-align: center;">密级</th>
										<th width="2%" style="text-align: center;">上传用户</th>
										<th width="2%" style="text-align: center;">上传时间</th>
										<!-- <th>资料详情</th> -->
										<th width="2%" style="text-align: center;">下载</th>
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
</body>
</html>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery.form.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/fastclick/fastclick.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/app.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/demo.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/iCheck/icheck.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<!-- 从admineap拷贝过来的 -->
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<!--  下面两个是多文件上传-->
<script src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zh.js"></script>
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
		//添加、修改异步提交地址
		var str = "";
		<shiro:hasAnyRoles name = "admin">
		    	 str+= "<div class='btn-group'>" +
		    	 "<a id='dailRow' class='label label-primary' ><i class='fa fa-eye'></i></a>" +
		         "<a id='dowloadRow' class='label label-primary' ><i class='fa fa-download'></i></a>" +
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
				url : "<%=request.getContextPath()%>/rest/datamanager/getAllDocInfoView", /* 得到所有的文档信息 */
				dataSrc : "data",
				dataType : 'json',
				data:querystrdata,
				/* data : function(d) {
					var param = {};
					param.draw = d.draw;
					param.start = d.start;
					param.length = d.length;
					param.userId = ${user.id};
					var formData = $("#queryForm").serializeArray(); //把form里面的数据序列化成数组
					return param; //自定义需要传递的参数。
				} */
			},
			columns : [ //对应上面thead里面的序列
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
				api.column(0).nodes().each(function(cell, i) {
					cell.innerHTML = startIndex + i + 1;
				});
                /* 下载 */
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
					url : "<%=request.getContextPath()%>/rest/datamanager/getDocInfoBytitleOrKeyWord/" + querystring,
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
					api.column(0).nodes().each(function(cell, i) {
						cell.innerHTML = startIndex + i + 1;
					});
					/*  为查看按钮绑定点击事件*/
                    $(".fa-eye").off("click").click(function(){
                        var data = tables.api().row($(this).parents("tr")).data();
                         window.open('<%=request.getContextPath()%>/rest/PreWebPages/QuertyInformDetail/'+data.id, '_blank') 
                    })
                    /* 下载 */
	                 $(".fa-download").off("click").click(function(){
	                    var data = tables.api().row($(this).parents("tr")).data();
	                     window.open('<%=request.getContextPath()%>/rest/PreWebPages/QuertyInformDetail/'+data.id, '_blank') 
	                })
				}
			})
			localStorage.clear();
		});
		/* end 用户查询完毕  */
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
			 var preurl = "<%=request.getContextPath()%>/rest/datamanager/docView?querystr="+querystrdata.querystring;
            window.location.href="<%=request.getContextPath()%>/rest/datamanager/WordDetail?wordid="+data.id+"&preurl="+preurl;
			<%-- window.location.href="<%=request.getContextPath()%>/rest/datamanager/WordDetail?wordid="+data.id; --%>
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
			window.location.href="<%=request.getContextPath()%>/rest/datamanager/docView?querystr="+querystrdata.querystring;
			tables.fnDraw(false); //刷新保持分页状态
		});

	});
	
	//初始化form表单
	var modals = {
		name : "这个ds没有从admineap复用",
		info : function(msg) {
		alert(msg);
		}
	};

	//初始化左边树
	initTree(0);
	bindEvent();
	//判断用户时添加 还是 更新
	var queryOption = "";
	$('#addModal').on('show.bs.modal', function() {
		queryOption = '#form_add';
		cheackData(queryOption);
	})
	$('#editModal').on('show.bs.modal', function() {
		queryOption = '#form_update';
		cheackData(queryOption);
	})


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
		});
		console.log(treeData);
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
		         "<a id='dowloadRow' class='label label-primary' ><i class='fa fa-download'></i></a>" +
		         "</div>"
			</shiro:hasAnyRoles>
			var tables = $("#dataTable").dataTable();
			//获取文档资源 id 方便添加信息时使用
			if($("#keyword").val()!=""){
				$("#keyword").val("");
			}
			querystrdata.querystring = "";
			
			var docdepId = data.id;
			$("#talentroleId").val(docdepId);
			$("#docdepId").val(docdepId);
			var querystring = $("#docdepId").val();
			if(querystring==""){
				querystring="kong";
			}else{
				querystrdata.querystring = querystring;
			}
			//点击节点时  获取该节点下所有子节点的id传给后端 
			//console.log(data);
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
					url : "<%=request.getContextPath()%>/rest/datamanager/getAllDocInfoById/"+docdepId,
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
                    },
					{
						"data" : 'attur',
						"render" : function(data, type, row, meta) {
							if (data) {
								return '<a href="' + data + 'tagret="_blank" class="label label-primary"><i class="fa fa-download"></i></a>';
                            } else {
                                return data
                            }
						}
					} */
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
					api.column(0).nodes().each(function(cell, i) {
						cell.innerHTML = startIndex + i + 1;
					});
					/*  为查看按钮绑定点击事件*/
                    $(".fa-eye").off("click").click(function(){
                        var data = tables.api().row($(this).parents("tr")).data();
                         window.open('<%=request.getContextPath()%>/rest/PreWebPages/QuertyInformDetail/'+data.id, '_blank') 
                    })
                    /* 下载 */
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
</script>
