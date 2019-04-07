<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>人员管理</title>
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
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="row">
					<div class="col-sm-3">
						<h1>人员管理</h1>
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
					<div class="col-md-8">
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
									<!-- <button type="button" class="btn btn-primary btn-sm"
										id="btn-export">
										<i class="fa fa-sign-in"></i> 导出
									</button> -->
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-re">
										<i class="fa fa-refresh"></i>刷新
									</button>
								</div>
							</div>

							<div class="row">
								<form id="queryForm" action="#" method="post"
									onkeydown="if(event.keyCode==13)return false;">
									<div class="col-xs-2">
										<input type="text" id="keyword" name="keyword"
											class="form-control input-sm" placeholder="搜索" />
									</div>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-query">
										<i class="fa fa-search"></i> 查询
									</button>
								</form>
							</div>
						</div>
						<!--表格-->
						<table id="dataTable"
							class="table table-striped table-bordered table-hover table-condensed"
							align="center">
							<thead>
								<tr class="info">
									<th><input id="checkAll" type='checkbox'>全选</th>
									<th>序号</th>
									<!-- <th>ID</th> -->
									<th>姓名</th>
									<th>登录名</th>
									<th>密级</th>
									<th>电话</th>
									<th>性别</th>
									<th>年龄</th>
									<th>状态</th>
									<th>操作</th>
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
					<h4 class="modal-title" id="myModalLabel">信息添加</h4>
				</div>

				<div class="modal-body">
					<form id="form_add" action="" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group has-feedback">
									<input type="text" name="loginName" id="add_loginname"
										class="form-control" placeholder="登录名"> <span
										class="glyphicon  glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="text" name="name" id="add_name"
										class="form-control" placeholder="用户姓名"> <span
										class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="password" name="password" id="add_password"
										class="form-control" placeholder="密码"> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="password" id="toPassword" name="jg_login_repwd"
										class="form-control" placeholder="确认密码"> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="form-group text-center" id="wrap">
									<label >性别：</label> 
									<label class="radio-inline">
										<input type="radio" name="sex" id="inlineRadio1" value="0" checked> 男
									</label> 
									<label class="radio-inline"> 
										<input type="radio" name="sex" id="inlineRadio2" value="1"> 女
									</label>
									<label style="margin: 0px 0px 0px 10px"></label>
									<label >年龄：</label> 
									<input style="width: 50px;margin-left: 0px;" type="text" id="age" name="age">
								</div>
								<div class="form-group mySelect form-inline">
									<label for="select_one_2">角色：</label> 
									<select
										class="form-control" name="roleIds" id="select_one_2"
										style="width: 212px;">
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group has-feedback">
									<input type="text" name="phone" id="phone" class="form-control"
										placeholder="电话"> <span
										class="glyphicon glyphicon-phone form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="text" name="address" id="address"
										class="form-control" placeholder="地址"> <span
										class="glyphicon glyphicon-send form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input class="uploadfile" type="file" name="uploadfile"
										data-ref="url2" class="file-loading" value="test" multiple /> 
										<input type="hidden" class="path" name="path" value="upload/user" >
                               			<input type="hidden" class="fileinfor" name="fileinfor" value="thi is fileinfor" >
                               			<input type="hidden" id="add_respond" >
								</div>
								<!--由于在user表中把organization_id换成站的范围 所以组织模块暂时删除-->
								<div class="form-group mySelect form-inline">
									<label for="select_one_5">密级：</label>
									<select
										class="form-control" name="level" id="select_one_5" style="width: 212px;">
										<option hidden="hidden">请选择</option>
										<option value="0">一般</option>
										<option value="1">秘密</option>
										<option value="2">机密</option>
										<option value="3">绝密</option>
									</select>
								</div>
								<div class="form-group mySelect form-inline">
									<label for="select_one_1">状态：</label> 
									<select
										class="form-control" name="status" id="select_one_1" style="width: 212px;">
										<option value="0">激活</option>
										<option value="1">未激活</option>
									</select>
								</div>
								<div class="form-group mySelect form-inline">
									<input type="text" class="form-control depart_name"
										name="jq_depart_name" disabled="disabled" class="form-control"
										style="width: 185px;"> <input type="hidden"
										name="departmentId" id="adddepartmentId" class="depart_id">
									<button type="button" data-toggle="modal"
										data-target="#modal-department"
										class="btn btn-success btn-block btn-flat"
										style="width: 80px;display: inline-block;">添加部门</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-offset-4"></div>
							<!-- /.col -->
							<div class="col-xs-5 col-xs-offset-3">
								<button id="btn_login" type="submit"
									class="btn btn-primary btn-block btn-flat">添加</button>
							</div>
							<!-- /.col -->
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!--  信息修改-->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only"></span>
					</button>
					<h4 class="modal-title" id="myModalLabel">信息修改</h4>
				</div>
				<div class="modal-body">
					<form id="form_update" action="" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group has-feedback">
									<input type="hidden" name="id" id="upUserId"> <input
										type="text" name="loginName" id="up_loginname"
										class="form-control" placeholder="登录名"> <span
										class="glyphicon  glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="text" name="name" id="up_name"
										class="form-control" placeholder="用户姓名"> <span
										class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="password" name="password" id="up_password"
										class="form-control" placeholder="密码"> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="form-group text-center" id="upwrap">
									<label >性别：</label> 
									<label class="radio-inline">
										<input type="radio" name="sex" id="inlineRadio3" value="0" checked> 男
									</label> 
									<label class="radio-inline"> 
										<input type="radio" name="sex" id="inlineRadio4" value="1"> 女
									</label>
									<label style="margin: 0px 0px 0px 10px"></label>
									<label >年龄：</label> 
									<input style="width: 50px;margin-left: 0px;" type="text" id="upage" name="age">
									<!-- <label class="radio-inline"> <input type="radio"
										name="sex" id="inlineRadio3" value="0" checked> 男
									</label> <label class="radio-inline"> <input type="radio"
										name="sex" id="inlineRadio4" value="1"> 女
									</label> 
									<input style="width: 40px;margin-left: 10px;" type="text" id="upage" name="age" placeholder="年龄"> -->
								</div>
								<div class="form-group mySelect form-inline">
									<label for="select_one_3">角色：</label> 
									<select
										class="form-control" name="roleIds" id="select_one_3"
										style="width: 212px;">
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group has-feedback">
									<input type="text" name="phone" id="upphone" class="form-control" placeholder="电话"> 
									<span  class="glyphicon glyphicon-phone form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="text" name="address" id="upaddress"
										class="form-control" placeholder="地址"> <span
										class="glyphicon glyphicon-send form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input class="uploadfile" type="file" name="uploadfile"
										data-ref="url2" class="file-loading" value="test" multiple /> 
										<input type="hidden" class="path" name="path" value="upload/user" >
                               			<input type="hidden" class="fileinfor" name="fileinfor" value="thi is fileinfor" >
                               			<input type="hidden" id="up_respond" name="image">
								</div>

								<!--由于在user表中把organization_id换成站的范围 所以组织模块暂时删除-->
								<div class="form-group mySelect form-inline">
									<label for="select_one_6">密级：</label>
									 <select class="form-control" name="level" id="select_one_6" style="width: 212px;">
										<option value="0">一般</option>
										<option value="1">秘密</option>
										<option value="2">机密</option>
										<option value="3">绝密</option>
									</select>
								</div>
								<div class="form-group mySelect form-inline">
									<!-- <label for="select_one_3">角色</label> <select
										class="form-control" name="roleIds" id="select_one_3"
										style="width: 80px;">
									</select> -->
									<label for="select_one_4">状态：</label> <select
										class="form-control" name="status" id="select_one_4"  style="width: 212px;">
										<option value="0">激活</option>
										<option value="1">未激活</option>
									</select>
								</div>

								<div class="form-group mySelect form-inline">
									<input type="text" class="form-control depart_name pull-right"
										name="jq_depart_name" disabled="disabled" class="form-control"
										style="width: 190px;"> <input type="hidden"
										name="departmentId" id="updepartmentId" class="depart_id">
									<button type="button" data-toggle="modal"
										data-target="#modal-department"
										class="btn btn-success btn-block btn-flat"
										style="width: 80px;display: inline-block;">选择部门</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-offset-4"></div>
							<!-- /.col -->
							<div class="col-xs-5 col-xs-offset-3">
								<button id="btn_update" type="submit"
									class="btn btn-primary btn-block btn-flat">修改</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  选中部门-->
	<div class="modal fade" id="modal-department">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">部门选择</h4>
				</div>
				<div class="modal-body">
					<div id="smalltree"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary suredepart"
						data-dismiss="modal">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
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
<script
	src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script
	src="<%=request.getContextPath()%>/assets/js/zh.js"></script>
<script>


var tables=null;

	$(function() {
		//添加、修改异步提交地址
		var str = "";
		<shiro:hasAnyRoles name = "admin">
		    	 str+= "<div class='btn-group'>" +
		         "<button id='editRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-edit'></i></button>" +
		         "<button id='delRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-trash-o'></i></button>" +
		         "</div>"
		    	 </shiro:hasAnyRoles>

		/*填充table数据  */
		var url = "";
		tables = $("#dataTable").dataTable({
			serverSide : true, //分页，取数据等等的都放到服务端去
			//processing: true,//载入数据的时候是否显示“载入中”
			pageLength : 10, //首次加载的数据条数
			ordering : false, //排序操作在服务端进行，所以可以关了。
			pagingType : "full_numbers",
			autoWidth : false,
			stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
			searching : false, //禁用datatables搜索
			ajax : {
				type : "post",
				url : "<%=request.getContextPath()%>/rest/user/dataGrid",
				dataSrc : "data",
				dataType : 'json',
				data : function(d) {
					var param = {};
					param.draw = d.draw;
					param.start = d.start;
					param.length = d.length;
					var formData = $("#queryForm").serializeArray(); //把form里面的数据序列化成数组
					formData.forEach(function(e) {
						param[e.name] = e.value;
					});
					return param; //自定义需要传递的参数。
				}
			/* data : function(d) {
				//console.log(JSON.stringify(d));
			} */
			},
			columns : [ //对应上面thead里面的序列
				{
					"data" : "null"
				},
				{
					"data" : 'id'
				},
				/* {
					"data" : 'id'
				}, */
				{
					"data" : 'name'
				},
				{
					"data" : 'loginName'
				},
				{
					"data" : 'level',
					"render" : function(data, type, row, meta) {
						var level = "";
						switch (data) {
						case 0:
							level = "一般";
							break;
						case 1:
							level = "秘密";
							break;
						case 2:
							level = "机密";
							break;
						case 3:
							level = "绝密";
							break;
						}
						return level;
					}
				},
				{
					"data" : 'phone'
				},
				{
					"data" : 'sex',
					"render" : function(data, type, row, meta) {
						return data ? "女" : "男";
					}
				},
				{
					"data" : 'age'
				},
				{
					"data" : "status",
					"render" : function(data, type, row, meta) {
						return data ? "未激活" : "激活";

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
			}
		});
		/*初始化表格填充完毕  */


		//查询按钮
		$("#btn-query").on("click", function() {
			//清除左侧树的选择
			/* var selectarr=$('#tree').treeview('getSelected')[0];
			$('#tree').treeview('unselectNode', [ selectarr.nodeId, { silent: true } ]); */
			var data = $("#keyword").val();
			if (data == null | data=="" | data==" "){
				url = "<%=request.getContextPath()%>/rest/user/dataGrid"
			}else{
				url  = "<%=request.getContextPath()%>/rest/user/getStafferInfoByName/" + data
			}
			
			tables.fnClearTable(false); //清空数据
			tables.fnDestroy(); //销毁datatable
			$("#dataTable").find('tbody').children().remove();
			
			tables=$("#dataTable").dataTable({
				serverSide : true, //分页，取数据等等的都放到服务端去
				pageLength : 10, //首次加载的数据条数
				ordering : false, //排序操作在服务端进行，所以可以关了。
				pagingType : "full_numbers",
				autoWidth : false,
				stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
				searching : false, //禁用datatables搜索
				ajax : {
					type : "post",
					url : url,
					dataSrc : "data",
					dataType : 'json',
					data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;
						param.length = d.length;
						var formData = $("#queryForm").serializeArray(); //把form里面的数据序列化成数组
						formData.forEach(function(e) {
							param[e.name] = e.value;
						});
						return param; //自定义需要传递的参数。
					}
				},
				columns : [ //对应上面thead里面的序列
					{
						"data" : "null"
					},
					{
						"data" : 'id'
					},
					/* {
						"data" : 'id'
					}, */
					{
						"data" : 'name'
					},
					{
						"data" : 'loginName'
					},
					{
						"data" : 'level',
						"render" : function(data, type, row, meta) {
							var level = "";
							switch (data) {
							case 0:
								level = "一般";
								break;
							case 1:
								level = "秘密";
								break;
							case 2:
								level = "机密";
								break;
							case 3:
								level = "绝密";
								break;
							}
							return level;
						}
					},
					{
						"data" : 'phone'
					},
					{
						"data" : 'sex',
						"render" : function(data, type, row, meta) {
							return data ? "女" : "男";
						}
					},
					{
						"data" : 'age'
					},
					{
						"data" : "status",
						"render" : function(data, type, row, meta) {
							return data ? "未激活" : "激活";

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
					
				}
			})
			//localStorage.clear();
			//tables.fnDraw();
		});
		/* end 用户查询完毕  */



		//添加用户信息前的数据填充
		$("#btn-add").on("click", function() {
			$.post('<%=request.getContextPath()%>/rest/user/getAllRolesAndAreaInfo',
				function(result) {
					//填充数据之前先清理上一时刻数据
					$("#select_one_2").children().remove();
					$("#select_one_2").append(fallSelectInfo(1, result.roles));
				})
			$("#addModal").modal("show");
		});


		//批量删除
		$("#btn-delAll").on("click", function() {
			var checkList_id = new Array();
			var checkList = $("input[name='checkList']:checked");
			for (var i = 0; i < checkList.length; i++) {
				var data = tables.api().row($(checkList.eq(i)).parents("tr")).data();
				checkList_id[i] = parseInt(data.id);
			}

			if (confirm("是否确认删除这些信息?")) {
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/rest/user/delectUser',
					data : {
						user_id : checkList_id
					},
					traditional : true,
					success : function(result) {
						if (result.msg == "删除成功") {
							alert(result.msg);
							localStorage.clear();
							history.go(0);
						} else {
							alert(result.msg);
						}
					}
				});
			}
		});


		//导出
		$("#btn-export").on("click", function() {});

		//刷新
		$("#btn-re").on("click", function() {
			window.location.reload();
			tables.fnDraw(false); //刷新保持分页状态
		});
		/* 关闭modal之后，重新打开 */
		$("#modal-department").on("hidden.bs.modal",function(){
			  $(document.body).addClass("modal-open");
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

		//修改
		$("#dataTable tbody").on("click", "#editRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			console.log(data);
			//这里提交表单 查询基础信息 
			$.post('<%=request.getContextPath()%>/rest/user/getAllRolesAndAreaInfo', function(result) {
				//填充数据之前先清理上一时刻数据
				var id = data.rolesList[0].id;
				$("#select_one_3").children().remove();
				$("#select_one_3").append(fallSelectInfo(id, result.roles));
				//数据的显示
				$("#upUserId").val(data.id);
				$("#up_loginname").val(data.loginName);
				$("#up_name").val(data.name);
				//密码没有
				$("#up_password").val(null);
				$("input[type=radio][value='" + data.sex + "']").attr("checked",true);  
				$("#upage").val(data.age);
				$("#upphone").val(data.phone);
				$("#upaddress").val(data.address);
				$("#up_respond").val(data.image);
				$("#select_one_4 option[value='" + data.status + "']").attr("selected", true);
				console.log(data.level);
				$("#select_one_6 option[value='" + data.level + "']").attr("selected", true);
				//显示部门名称
				$(".depart_name").val(data.departmentName);
				$(".depart_id").val(data.departmentId);
			})
			$("#editModal").modal("show");
		});
		
		//下拉列表的数据填充函数
		function fallSelectInfo(index, obj) {
			//一：遍历数组  二：判断id是否相同 相同则选择
			var str = "";
			for (var i = 0; i < obj.length; i++) {
				if (index == obj[i].id) {
					str = str + "<option selected=\"selected\" value=\"" + obj[i].id + "\">" + obj[i].name + "</option>";
				} else {
					str = str + "<option value=\"" + obj[i].id + "\">" + obj[i].name + "</option>";
				}

			}
			return str;
		}



		//删除
		$("#dataTable tbody").on("click", "#delRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			if (confirm("是否确认删除这条信息?")) {
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/rest/user/delectUser',
					data : {
						user_id : [ parseInt(data.id) ]
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



		//初始化form表单
		var modals = {
			name : "这个ds没有从admineap复用",
			info : function(msg) {
				alert(msg);
			}
		};
		//初始化左边树
		initTree(0);
		initModelTree(0);
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

	/*  头像上传*/
		  $(".uploadfile").fileinput({
              uploadUrl:"<%=request.getContextPath()%>/rest/FileUpload/springUpload",//上传的地址
              uploadAsync:true, //默认异步上传
              showUpload: true, //是否显示上传按钮,跟随文本框的那个
              showRemove : false, //显示移除按钮,跟随文本框的那个
              showCaption: true,//是否显示标题,就是那个文本框
              showPreview : false, //是否显示预览,不写默认为true
              dropZoneEnabled: false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
              //minImageWidth: 50, //图片的最小宽度
              //minImageHeight: 50,//图片的最小高度
              //maxImageWidth: 1000,//图片的最大宽度
              //maxImageHeight: 1000,//图片的最大高度
              maxFileSize: 10240,// 10m； 单位为kb，如果为0表示不限制文件大小,默认为0
               maxFileCount: 1, //表示允许同时上传的最大文件个数
               enctype: 'multipart/form-data',
               validateInitialCount:true,
               previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
               msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
               allowedFileTypes: ['image'],//配置允许文件上传的类型
               allowedPreviewTypes : [ 'image'],//配置所有的被预览文件类型
               allowedPreviewMimeTypes : [ 'jpg', 'png'],//控制被预览的所有mime类型
               language : 'zh',
               uploadExtraData:function (previewId, index){//向后台传递参数
          	 	var data={
              		path:"upload/user",
               		fileinfor:"thi is fileinfor",
              		description:"upload/user"
              	};
                  return data; 
             	}
          });
		//异步上传返回结果处理
        $('.uploadfile').on('fileerror', function(event, data, msg) {
            console.log("fileerror");
            console.log(data);
        });
        //异步上传返回结果处理
        $(".uploadfile").on("fileuploaded", function (event, data, previewId, index) {
        	$("#uploadfile").fileinput('reset'); //重置预览表中的所有文件
            //alert(JSON.stringify(data));
            //alert(index);
            //alert(previewId);
            var ref=$(this).attr("data-ref");
            $("input[name='"+ref+"']").val(data.response.url);
            var url = "url" + index;
           	 $("#add_respond").val(data.response[url]);
           	 $("#up_respond").val(data.response[url]);
            //alert(data.response[url]);
        });

        //同步上传错误处理
        $('.uploadfile').on('filebatchuploaderror', function(event, data, msg) {
        	$("#uploadfile").fileinput('reset'); //重置预览表中的所有文件
            console.log("filebatchuploaderror");
            console.log(data);
        });
        
        //同步上传返回结果处理
        $(".uploadfile").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        	$("#uploadfile").fileinput('reset'); //重置预览表中的所有文件
            console.log("filebatchuploadsuccess");
            console.log(data);
        });

        //上传前
        $('.uploadfile').on('filepreupload', function(event, data, previewId, index) {
            console.log("filepreupload");
            //alert("begin");
        });
        //filedelete事件：预览时点击缩略图上的删除按钮才能触发的 
        
        //filesuccessremove事件：图片上传成功后，点击删除按钮的回调函数
        $('.uploadfile').on('filesuccessremove', function(event, id) {
    			alert(id); //可以根据这个进行编程实现服务器文件的删除，因为文件已经上传，但也可以不用删废文件可以后续清理，跟随文本框那个移除按钮不能调用原因代分析，
		});
	
	})

	function initTree(selectNodeId) {
		var treeData = null;
		ajaxPost("<%=request.getContextPath()%>/rest/department/activetreeDatabydep", null, function(data) {
			treeData = data;
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
		//$("#tree").data('treeview').selectNode(selectNodeId);
		$("#tree").data('treeview').expandNode(selectNodeId);
		$("#tree").data('treeview').revealNode(selectNodeId);  
	}
	
	//为树绑定一个事件
	function bindEvent() {
		$('#tree').on('nodeSelected', function(event, data) {
			var str = "";
			<shiro:hasAnyRoles name = "admin">
			    	 str+= "<div class='btn-group'>" +
			         "<button id='editRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-edit'></i></button>" +
			         "<button id='delRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-trash-o'></i></button>" +
			         "</div>"
			    	 </shiro:hasAnyRoles>
			//var tables = $("#dataTable").dataTable();
			//获取部门id 方便添加信息时使用
			var departmentId = data.id;
			$("#departmentId").val(departmentId);
			//点击节点时  获取该节点下所有子节点的id传给后端 
			//console.log(data);
			
			var data = departmentId;
			tables.fnClearTable(false); //清空数据
			tables.fnDestroy(); //销毁datatable
			$("#dataTable").find('tbody').children().remove();
			tables=$("#dataTable").dataTable({
				serverSide : true, //分页，取数据等等的都放到服务端去
				pageLength : 10, //首次加载的数据条数
				ordering : false, //排序操作在服务端进行，所以可以关了。
				pagingType : "full_numbers",
				autoWidth : false,
				stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
				searching : false, //禁用datatables搜索
				ajax : {
					type : "post",
					url : "<%=request.getContextPath()%>/rest/user/getAllStafferInfo/" + data,
					dataSrc : "data",
					dataType : 'json',
					data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;
						param.length = d.length;
						return param; //自定义需要传递的参数。
					}
				},
				columns : [ //对应上面thead里面的序列
					{
						"data" : "null"
					},
					{
						"data" : 'id'
					},
					/* {
						"data" : 'id'
					}, */
					{
						"data" : 'name'
					},
					{
						"data" : 'loginName'
					},
					{
						"data" : 'level',
						"render" : function(data, type, row, meta) {
							var level = "";
							switch (data) {
							case 0:
								level = "一般";
								break;
							case 1:
								level = "秘密";
								break;
							case 2:
								level = "机密";
								break;
							case 3:
								level = "绝密";
								break;
							}
							return level;
						}
					},
					{
						"data" : 'phone'
					},
					{
						"data" : 'sex',
						"render" : function(data, type, row, meta) {
							return data ? "女" : "男";
						}
					},
					{
						"data" : 'age'
					},
					{
						"data" : "status",
						"render" : function(data, type, row, meta) {
							return data ? "未激活" : "激活";

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
				}
			})

			//localStorage.clear();
			//tables.fnDraw(); //查询后不需要保持分页状态，回首页 
		});
	}

	//model中tree的初始化
	function initModelTree(selectNodeId) {
		var treeData = null;
		ajaxPost("<%=request.getContextPath()%>/rest/department/activetreeDatabydep", null, function(data) {
			treeData = data;
		});
		$("#smalltree").treeview({
			data : treeData,
			showBorder : true,
			expandIcon : "glyphicon glyphicon-stop",
			collapseIcon : "glyphicon glyphicon-unchecked",
			levels : 1,
			onNodeSelected : function(event, data) {
				//获取部门id 方便添加信息时使用
				var departmentId = data.id;
				var departmentName = data.text;
				$(".depart_id").val(departmentId);
				$(".depart_name").val(departmentName);
			}
		});
		if (treeData.length == 0)
			return;
		//默认选中第一个节点
		selectNodeId = selectNodeId || 0;
		$("#tree").data('treeview').selectNode(selectNodeId);
		$("#tree").data('treeview').expandNode(selectNodeId);
		$("#tree").data('treeview').revealNode(selectNodeId);
	}

	//根据queryOption动态添加验证
	function cheackData(queryOption) {
		var form = null;
		var winId = 'iconWin';
		form = $(queryOption).form();
		//添加用户信息的验证
		//验证数据
		$(queryOption).bootstrapValidator({
			fields : {
				/*验证*/
				loginName : {
					/*键名username和input name值对应*/
					message : '用户验证失败',
					validators : {
						notEmpty : {
							/*非空提示*/
							message : '用户名不能为空'
						},
						regexp : {
							/* 只需加此键值对，包含正则表达式，和提示 */
							regexp : /[a-zA-Z0-9_]{2,16}/,
							message : '请正确输入您的登录名'
						}
					}
				},
				name : {
					/*键名username和input name值对应*/
					message : '用户验证失败',
					validators : {
						notEmpty : {
							/*非空提示*/
							message : '用户名不能为空'
						}
					}
				},
				password : {
					message : '密码无效',
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						stringLength : {
							min : 6,
							max : 30,
							message : '密码长度必须在6到30之间'
						}
					}
				},
				jg_login_repwd : {
					message : '密码无效',
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						stringLength : {
							min : 6,
							max : 30,
							message : '密码长度必须在6到30之间'
						}
					}
				},
				phone : {
					message : '电话格式错误',
					validators : {
						notEmpty : {
							/*非空提示*/
							message : '电话不能为空'
						},
						regexp : {
							/* 只需加此键值对，包含正则表达式，和提示 */
							regexp : /^1[34578]\d{9}$/,
							message : '请正确输入您的电话号码'
						}
					}
				},
				age : {
					message : '年龄错误',
					validators : {
						notEmpty : {
							/*非空提示*/
							message : '年龄不能为空'
						},
						regexp : {
							/* 只需加此键值对，包含正则表达式，和提示 */
							regexp : /100|((1[0-1]|\d)?\d)/,
							message : '请正确输入您的年龄'
						}
					}
				}
			} //验证内容
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			var $form = $(e.target);
			var bv = $form.data('bootstrapValidator');
			/*  判断是否选择部门*/
			if ($('.depart_name').val() == "") {
				alert("请选择部门！");
				$("#form_add").data('bootstrapValidator').resetForm();
				return null;
			}

			//装填数据
			form = $(queryOption).form();
			var date = form.getFormSimpleData();
			date.userType = 0;
			var url = "";
			if (queryOption === "#form_update") {
				date.departmentId = $("#updepartmentId").val();
				url = '<%=request.getContextPath()%>/rest/user/updateUserInfoBySuper';
			} else {
				date.departmentId = $("#adddepartmentId").val();
				url = "<%=request.getContextPath()%>/rest/user/addUser";
			}
			//根据queryOption选择不同的用户头像地址
			var image_url="";
			if(queryOption === "#form_update"){
				image_url="#up_respond";
				date.image=$("#up_respond").val();
			}else{
				image_url="#add_respond";
				date.image=$("#add_respond").val();
			}
			/*  判断是否上传了头像*/
			if(!$(image_url).val()){
				if(!confirm("确定不上传用户头像？")){
					$("#form_add").data('bootstrapValidator').resetForm();
				}else{
					//这里提交表单
					$.post(url, date, function(result) {
						if (result.msg == "success") {
							history.go(0);
						} else {
							alert(result.msg);
						}
					});
				}
			}else{
					//这里提交表单
					$.post(url, date, function(result) {
						if (result.msg == "success") {
							history.go(0);
						} else {
							alert(result.msg);
						}
					});
			} 
			
		})
	}
</script>
