<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>故障录入</title>
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
	href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<!-- 查询、添加、批量删除、导出、刷新 -->
	<input type="hidden" id="inspectIdFromInspectPage"
		value="${inspectid }">
	<input type="hidden" id="stationIdFromInspectPage"
		value="${stationid }">
	<div class="content">
		<!-- 查询、添加、批量删除、导出、刷新 -->
		<div class="row-fluid">
			<div class="row">
				<form id="queryForm" action="" method="post">
					<div class="col-xs-2" style="width: 125px">
						<input type="text" id="keyword" name="keyword"
							class="form-control input-sm" placeholder="搜索" />
					</div>
					<button type="button" class="btn btn-primary btn-sm" id="btn-query">
						<i class="fa fa-search"></i> 查询
					</button>
				</form>
			</div>
		</div>

		<div class="pull-left" style="margin-top: 15px">
			<div class="btn-group">
				<button type="button" class="btn btn-primary btn-sm" id="btn-add">
					<i class="fa fa-plus"></i> 添加
				</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn-delAll">
					<i class="fa fa-remove"></i> 删除
				</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn-re">
					<i class="fa fa-refresh"></i> 刷新
				</button>
			</div>
		</div>

		<!--表格-->
		<table id="dataTable"
			class="table table-striped table-bordered table-hover table-condensed"
			align="center">
			<thead>
				<tr class="info">
					<td><input type="checkbox" id="checkAll"></td>
					<th>序号</th>
					<th>问题类型</th>
					<th>问题描述</th>
					<th>故障跟踪</th>
					<th>发现人</th>
					<th>发现时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>

		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-lg">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only"></span>
						</button>
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>

					<div class="modal-body">
						<div class="row-fluid">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" id="btn-loadmodel"
										class="btn btn-primary">
										<i class="fa fa-save">&nbsp;导入模板</i>
									</button>
								</div>
							</div>
							<div class="row" style="margin-left:0px;">
								<h5>故障信息:</h5>
							</div>
						</div>

						<!-------------第一个表框开始 ---------->
						<div class="panel panel-default" id="panel1">
							<div class="panel-body">
								<form class="form-horizontal" id="editForm" action=""
									method="post">
									<input type="hidden" class="form-control" name="id" id='id'>
									<!-- 第一行 -->

									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">巡检名称</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="inpectid"
												id="inpectid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">遥控站</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="redevid"
												id="redevid">
											</select>
										</div>

									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">配套系统</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="systemid"
												id="systemid">
											</select>
										</div>
										<label id="taskLable" for="inputName"
											class="col-sm-2 control-label">问题类型</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="typeid"
												id="typeid">
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">发现时间</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='findtime'
													id="findtime" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label for="inputName" class="col-sm-2 control-label">发现人名称</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="findperson"
												id="findperson" placeholder="请输入巡检人名称">
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">问题描述</label>
										<div class="col-sm-4">
											<textarea class="form-control" rows="5" name="faultdes"
												id="faultdes" placeholder="输入问题描述..."></textarea>
										</div>
									</div>
									<!-------------第一个表框结束 ---------->
								</form>
							</div>
						</div>
						<!-- 第一个表框结束 -->

						<div class="modal-footer">
							<button type="button" id="btn-cancel" class="btn btn-default"
								data-btn-type="cancel">
								<i class="fa fa-reply">&nbsp;取消</i>
							</button>
							<button type="submit" id="btn-submit" class="btn btn-primary">
								<i class="fa fa-save">&nbsp;保存</i>
							</button>
						</div>

					</div>

				</div>
			</div>
		</div>
		<!-- editModal END -->

		<div class="modal fade" id="verify_opinion_modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">审核</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label for="finishcontent" class="col-sm-2 control-label">解决方案</label>
								<div class="col-sm-6">
									<textarea class="form-control" style="resize:none"
										name="solution" rows="5" id="solution"
										placeholder="请输入解决方案......"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">取消</button>
						<button id="btn_confirm" type="button"
							class="btn btn-primary suredepart" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!--  -->

		<div class="modal fade" id="solution_modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">完成故障修复</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">解决时间</label>
								<div class="col-sm-6">
									<div class='input-group date' id='datetimepicker'>
										<input type='text' class="form-control" name='soluttime'
											id="soluttime" /> <span class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="finishcontent" class="col-sm-2 control-label">解决结果</label>
								<div class="col-sm-6">
									<textarea class="form-control" style="resize:none"
										name="solutionresult" rows="5" id="solutionresult"
										placeholder="请输入解决结果......"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">取消</button>
						<button id="btn_confirm_solution" type="button"
							class="btn btn-primary suredepart" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!--  -->

		<div class="modal fade" id="readonly_modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">故障信息查看</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">错误类型</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="typeforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">巡检名称</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="inspectforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">遥控站名称</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="redevforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">系统名称</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="systemforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="finishcontent" class="col-sm-2 control-label">问题描述</label>
								<div class="col-sm-6">
									<textarea class="form-control" style="resize:none"
										rows="5" id="faultdesforread"
										 readonly="readonly"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="finishcontent" class="col-sm-2 control-label">解决方案</label>
								<div class="col-sm-6">
									<textarea class="form-control" style="resize:none"
										rows="5" id="solutionforread"
										 readonly="readonly"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="finishcontent" class="col-sm-2 control-label">解决结果</label>
								<div class="col-sm-6">
									<textarea class="form-control" style="resize:none"
										rows="5" id="solutionresultforread"
										 readonly="readonly"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">发现时间</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="findtimeforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">审核时间</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="veriytimeforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">解决时间</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="soluttimeforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">发现人</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="findpersonforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">填写人</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="fillpersonforread" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">审核人</label>
								<div class="col-sm-6">
									<input type='text' class="form-control" id="veriypersonforread" readonly="readonly"/>
								</div>
							</div>
							
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-right"
							data-dismiss="modal">返回</button>
						
					</div>
				</div>
			</div>
		</div>
		<!--  -->

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


<script type="text/javascript">
	toastr.options = {
		closeButton : false,
		debug : false,
		progressBar : true,
		positionClass : "toast-top-center",
		onclick : null,
		showDuration : "300",
		hideDuration : "1000",
		timeOut : "1000",
		extendedTimeOut : "500",
		showEasing : "swing",
		hideEasing : "linear",
		showMethod : "fadeIn",
		hideMethod : "fadeOut"
	};
	$.fn.datetimepicker.dates['zh'] = {
		days : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" ],
		daysShort : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
		daysMin : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
		months : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
		monthsShort : [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二" ],
		meridiem : [ "上午", "下午" ],
		today : "今天"
	};
	var date = new Date();
	$('.date').datetimepicker({
		language : 'zh-cn',
		minView : "day",
		format : 'yyyy-mm-dd hh:ii:ss',
		todayBtn : true,
		autoclose : 1
	});

	$(".select2").select2({
		tags : true,
		createTag : function(decorated, params) {
			return null;
		},
		width : '100%'
	});
</script>
<script>
	var form = null;
	var querydata = [];
	querydata.querystring = "";

	//页面加载完成后根据查询语句设置查询框中的选项
	window.onload = function() {
		if (null != name) {
			$('#keyword').val(name);
		}
	}

	$(function() {

		form = $('#editForm').form();
		//添加、修改异步提交地址
		//只有具有admin权限的用户才具有对数据记录进行删除和修改的功能
		var str = null;
		<shiro:hasAnyRoles name = "admin">
    	 str = "<div class='btn-group'>" +
							"<a id='editRow' class='label label-primary'><i class='fa fa-edit'></i></a>" +
							"<a id='delRow' class='label label-danger'><i class='fa fa-trash-o'></i></a>" +
							"</div>"
    	</shiro:hasAnyRoles>

		var url = "";

		var tables = $("#dataTable").dataTable({
			serverSide : true, //分页，取数据等等的都放到服务端去
			pageLength : 10, //首次加载的数据条数
			ordering : false, //排序操作在服务端进行，所以可以关了。
			pagingType : "full_numbers",
			autoWidth : false,
			stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
			searching : false, //禁用datatables搜索
			ajax : {
				type : "post",
				url : "<%=request.getContextPath()%>/rest/fault/getFaultDataGrid",
				dataSrc : "data", //传输回来的数据
				dataType : 'json',
				data : querydata //传输过去的数据
			},
			columns : [ //对应上面thead里面的序列
				{
					"data" : "columnDefs" //复选框
				},
				{
					"data" : "id" //编号
				},
				{
					"data" : "faulttypename" //故障类型名称
				},
				{
					"data" : 'faultdes' // 问题描述
				},
				{
					"data" : 'state', // 问题状态
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							return "<div class='btn-group'>" +
								"<a id='btn_verify' class='label label-primary' type='button'>点击审核</a>" +
								"</div>";
							break;
						case 1:
							return "<div class='btn-group'>" +
								"<a id='btn_fix' class='label label-warning' type='button'>更新故障</a>" +
								"</div>";
							break;
						case 2:
							return '<small class="label label-success">故障已解决</small>';
							break;
						}

					}
				},
				{
					"data" : 'findperson'
				},
				{
					"data" : 'findtime',
					"render" : function(data, type, full, callback) {
						return new Date(data).format("yyyy-MM-dd hh:mm:ss");
					}
				},
				{
					"data" : "state",
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							return str;
							break;
						case 1:
							return str;
							break;
						case 2:
							return "<div class='btn-group'>" +
								"<a id='readRow' class='label label-info'><i class='fa fa-eye'></i></a>" +
								"<a id='delRow' class='label label-danger'><i class='fa fa-trash-o'></i></a>" +
								"</div>";
							break;
						}
					}
				}
			],
			//操作按钮
			columnDefs : [
				{
					targets : 0,
					defaultContent : "<input type='checkbox' name='checkList'>"
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
		//查询按钮
		$("#btn-query").on("click", function() {
			querydata.querystring = ""
			//输入框中的内容
			var taskcontent = $("#keyword").val();
			querydata.querystring = querydata.querystring + ",taskcontent:" + taskcontent;
			var oSettings = tables.fnSettings();
			oSettings.ajax.data = querydata;
			tables.api().ajax.reload();
			tables.fnDraw(); //查询后不需要保持分页状态，回首页
		});
		//表单数据验证
		inputvalidator();

		//添加
		$("#btn-add").on("click", function() {
			$("input[name=id]").val(null);
			redevid = null;
			systemid = null;
			sel.synfirstdata('inpectid', "<%=request.getContextPath()%>/rest/inspect/getInspectWithFaultList", 'id', 'name')
			// 问题类型
			sel.bindselectfirst('typeid', "<%=request.getContextPath()%>/rest/dic/getFaulttypeList", 'id', 'name')
			//sel.bindselectfirst('systemid', "<%=request.getContextPath()%>/rest/devsystem/getBdevsystemListOfStation?stationid=100", 'id', 'name')
			$("input[name=findtime]").val("");
			$("input[name=findperson]").val("");
			$("textarea[name=faultdes]").val("");
			url = "<%=request.getContextPath()%>/rest/fault/insertOneFault";
			$("#myModalLabel").html("<b>故障信息录入</b>");
			$("#editModal").modal("show");
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

		//修改
		$("#dataTable tbody").on("click", "#editRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			console.log(data + "修改")
			$("input[name=id]").val(data.id);
			redevid = data.redevid;
			systemid = data.systemid;
			sel.synNonebinddata('inpectid', "<%=request.getContextPath()%>/rest/inspect/getInspectWithFaultList", 'id', 'name', data.inpectid)
			sel.synbinddata('typeid', "<%=request.getContextPath()%>/rest/dic/getInspcetTypeList", 'id', 'name', data.typeid, function(data) {});

			$("input[name=name]").val(data.name);
			$("#isfault").select2("val", [ data.isfault ])
			$("textarea[name=inspectcontent]").val(data.inspectcontent);
			$("textarea[name=inspectresult]").val(data.inspectresult);
			$("input[name=findtime]").val(new Date(data.findtime).format("yyyy-MM-dd hh:mm:ss"));
			$("input[name=inspectperson]").val(data.inspectperson);
			//修改操作时controller的url
			url = "<%=request.getContextPath()%>/rest/inspect/updateOneInspect";
			$("#myModalLabel").html("<b>修改故障信息</b>");
			$("#editModal").modal("show");

			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

		var redevid;
		$("#inpectid").on("change", function() {
			// 巡检的编号
			var inspectIdVal = $("#inpectid").val();
			// 当不选择"无"选项时，产生联动效果
			if (inspectIdVal != -1) {
				if (redevid != null) {
					// 不为空时需要回显,同时级联
					sel.synbinddata('redevid', "<%=request.getContextPath()%>/rest/remotestation/getRemoteStationListOfInspect?inspectid=" + inspectIdVal, 'id', 'name', redevid, function(data) {});
					redevid = null;
				} else {
					sel.syndata('redevid', "<%=request.getContextPath()%>/rest/remotestation/getRemoteStationListOfInspect?inspectid=" + inspectIdVal, 'id', 'name', function(data) {});
				}
			} else {
				sel.synfirstdata('redevid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name');
			}
		});

		var systemid;
		$("#redevid").on("change", function() {
			var redevIdVal = $("#redevid").val();
			if (redevIdVal != -1) {
				if (systemid != null) {
					sel.synNonebinddata('systemid', "<%=request.getContextPath()%>/rest/devsystem/getBdevsystemListOfStation?stationid=" + redevIdVal, 'id', 'name', systemid);
					systemid = null;
				} else {
					//sel.syndata('systemid',"<%=request.getContextPath()%>/rest/devsystem/getBdevsystemListOfStation?stationid="+redevIdVal, 'id', 'name',function(data){});
					sel.synfirstdata('systemid', "<%=request.getContextPath()%>/rest/devsystem/getBdevsystemListOfStation?stationid=" + redevIdVal, 'id', 'name');
				}
			} else {
				sel.synfirstdata('systemid', "<%=request.getContextPath()%>/rest/devsystem/getBdevsystemList", 'id', 'name');
			}
		});


		// 提交
		$("#btn-submit").on("click", function() {
			$("#editForm").bootstrapValidator('validate'); //提交验证
			if ($("#editForm").data('bootstrapValidator').isValid()) { //获取验证结果，如果成功，执行下面代码
				if (confirm("确定提交么？")) {
					//获取到表单中的数据
					var params = $("#editForm").form().getFormSimpleData();
					console.log(JSON.stringify(params))
					//此处的data保存了操作的返回值	
					$.ajax({
						url : url,
						type : 'post',
						cache : "false",
						data : params, //
						dataType : "json",
						success : function(data) {
							if (data.success) {
								tables.fnDraw(false); //刷新保持分页状态 false重新加载当前页，true重新加载初始状态
								$("#editModal").modal("hide");
								toastr.success("保存成功！");
							} else {
								toastr.error("保存失败");
							}
						},
						error : function(err) {
							toastr.error("Server Connection Error<%=request.getContextPath()%>.");
						}
					});
				}
			}
			//下边清表单中的数据
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

		//删除
		$("#dataTable tbody").on("click", "#delRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			var obj = new Object();
			obj.id = data.id;
			if (confirm("是否确认删除这条信息?")) {
				$.ajax({
					url : "<%=request.getContextPath()%>/rest/fault/deleteOneFault",
					type : 'post',
					dataType : "json",
					cache : "false",
					data : obj,
					success : function(data) {
						if (data.success) {
							toastr.success("删除成功！");
							tables.api().row().remove().draw(false);
						} else {
							toastr.error('删除失败！' + JSON.stringify(data));
						}
					},
					error : function(err) {
						toastr.error("Server Connection Error<%=request.getContextPath()%>.");
					}
				});
			}
		});

		//批量删除
		$("#btn-delAll").on("click", function() {
			obj = $("input[name='checkList']");
			var check_val = [];
			for (k in obj) {
				if (obj[k].checked) {
					var data = tables.api().row(k).data();
					var oneEnterprice = new Object();
					oneEnterprice.id = data.id;
					oneEnterprice.name = data.name;
					check_val.push(oneEnterprice);
				}
			}
			var faultIds = JSON.stringify(check_val);
			url = "<%=request.getContextPath()%>/rest/fault/deleteFaultByBatch";
			if (confirm("确定要删除吗？！")) {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					cache : "false",
					data : faultIds, //传给后台的数据
					contentType : "application/json;charset=UTF-8",
					success : function(data) {
						if (data.success) {
							toastr.success("删除成功！");
							tables.api().row().remove().draw(false);
						} else {
							toastr.error('删除失败！' + JSON.stringify(data));
						}
					},
					error : function(err) {
						toastr.error("Server Connection Error<%=request.getContextPath()%>.");
					}
				});
			}
		});

		//刷新
		$("#btn-re").on("click", function() {
			tables.api().ajax.reload(); //刷新保持分页状态
			tables.fnDraw();
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

		function inputvalidator() {
			$('#editForm').bootstrapValidator({
				message : '请输入有效值',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				submitHandler : function(validator, functionform, submitButton) {
					// 版本号0.4.5支持
					// 版本号v0.5.2-dev不再支持submitHandler配置	
				},
				fields : {
					owerdep : {
						validators : {
							notEmpty : {
								message : '请选择市州'
							}
						}
					}
				} /* end field */
			}).on("success.form.bv", function(e) {
				e.preventDefault(); //防止重复提交						
			}); /* end $('#editForm').bootstrapValidator */
		}

		$("#btn-cancel").on("click", function() {
			$("#editModal").modal("hide");
		});

		// 已解决的故障只能查看信息了
		$("#dataTable tbody").on("click", "#readRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			$("#readonly_modal").modal("show");
			console.log(JSON.stringify(data))
			
			$("#typeforread").val(data.faulttypename);
			$("#inspectforread").val(data.inspectname);
			$("#redevforread").val(data.stationname);
			$("#systemforread").val(data.systemname);
			$("#faultdesforread").val(data.faultdes);
			$("#solutionforread").val(data.solution);
			$("#solutionresultforread").val(data.solutionresult);
			
			$("#findtimeforread").val(new Date(data.findtime).format("yyyy-MM-dd hh:mm:ss"));
			$("#veriytimeforread").val(new Date(data.veriytime).format("yyyy-MM-dd hh:mm:ss"));
			$("#soluttimeforread").val(new Date(data.soluttime).format("yyyy-MM-dd hh:mm:ss"));
			
			$("#findpersonforread").val(data.findperson);
			$("#fillpersonforread").val(data.fillpersonname);
			$("#veriypersonforread").val(data.veriypersonname);
			
			
		});

		var dataFault;
		// 审核按钮事件
		$("#dataTable tbody").on("click", "#btn_verify", function() {
			dataFault = tables.api().row($(this).parents("tr")).data();
			$("#verify_opinion_modal").modal("show");
			$("#solution").val("");
		});

		// 审核提交
		$("#btn_confirm").on("click", function() {
			dataFault.solution = $("#solution").val();
			dataFault.findtime = new Date(dataFault.findtime).format("yyyy-MM-dd hh:mm:ss");
			//console.log(JSON.stringify(verify_data));
			url = "<%=request.getContextPath()%>/rest/fault/insertFaultSolution";
			if (confirm("确定提交审核意见吗？？")) {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					cache : "false",
					data : dataFault, //传给后台的数据
					success : function(data) {
						if (data.success) {
							toastr.success("操作成功！");
							tables.api().row().remove().draw(false);
						} else {
							toastr.error('操作失败！' + JSON.stringify(data));
						}
					},
					error : function(err) {
						toastr.error("Server Connection Error<%=request.getContextPath()%>.");
					}
				});
			}
		});

		// 点击更新故障按钮之后的事件
		$("#dataTable tbody").on("click", "#btn_fix", function() {
			dataFault = tables.api().row($(this).parents("tr")).data();
			$("#solution_modal").modal("show");
			$("input[name=soluttime]").val("")
			$("#solutionresult").val("");
		});

		// 故障解决后提交事件
		$("#btn_confirm_solution").on("click", function() {
			dataFault.solutionresult = $("#solutionresult").val();
			dataFault.findtime = new Date(dataFault.findtime).format("yyyy-MM-dd hh:mm:ss");
			dataFault.veriytime = new Date(dataFault.veriytime).format("yyyy-MM-dd hh:mm:ss");
			dataFault.soluttime = new Date($("input[name=soluttime]").val()).format("yyyy-MM-dd hh:mm:ss");
			console.log(JSON.stringify(dataFault));
			url = "<%=request.getContextPath()%>/rest/fault/insertFaultSolutionResult";
			if (confirm("确定提交吗？？")) {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					cache : "false",
					data : dataFault, //传给后台的数据
					success : function(data) {
						if (data.success) {
							toastr.success("操作成功！");
							tables.api().row().remove().draw(false);
						} else {
							toastr.error('操作失败！' + JSON.stringify(data));
						}
					},
					error : function(err) {
						toastr.error("Server Connection Error<%=request.getContextPath()%>.");
					}
				});
			}
		});

		// 从巡检界面跳转过来时，会有值
		var inspectId = $("#inspectIdFromInspectPage").val()
		var stationId = $("#stationIdFromInspectPage").val()
		if (inspectId != "") {
			redevid = stationId;
			sel.synNonebinddata('inpectid', "<%=request.getContextPath()%>/rest/inspect/getInspectWithFaultList", 'id', 'name', inspectId)
			sel.bindselectfirst('typeid', "<%=request.getContextPath()%>/rest/dic/getFaulttypeList", 'id', 'name')
			$("input[name=findtime]").val("");
			$("input[name=findperson]").val("");
			$("textarea[name=faultdes]").val("");
			url = "<%=request.getContextPath()%>/rest/fault/insertOneFault";
			$("#myModalLabel").html("<b>故障信息录入</b>");
			$("#editModal").modal("show");
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		}
	});
</script>
