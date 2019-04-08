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
					<th>状态</th>
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
								<h5>资产档案信息:</h5>
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
										<label for="inputName" class="col-sm-2 control-label">遥控站</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="redevid"
												id="redevid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">配套系统</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="systemid"
												id="systemid">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">巡检名称</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="inpectid"
												id="inpectid">
											</select>
										</div>
										<label id="taskLable" for="inputName"
											class="col-sm-2 control-label">错误类型</label>
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
												<input type='text' class="form-control" name='inspecttime'
													id="inspecttime" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
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
						<h4 class="modal-title">审核意见</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label for="finishcontent" class="col-sm-2 control-label">参数名</label>
								<div class="col-sm-6">
									<textarea class="form-control" style="resize:none"
										name="finishcontent" rows="5" id="finishcontent"
										placeholder="请输入审核意见......"></textarea>
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

	</div>
</body>
</html>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
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
	src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/conmmon/xlsx.core.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>


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
         "<button id='editRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-edit'></i></button>" +
         "<button id='delRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-trash-o'></i></button>" +
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
							return "无故障";
							break;
						case 1:
							return "<div class='btn-group'>" +
								"<button id='insert_fault' class='btn btn-primary btn-sm' type='button'><i class='fa fa-plus'></i></button>" +
								"</div>";
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
					"data" : null,
					"render" : function(data, type, full, callback) {
						return "<div class='btn-group'>" +
							"<button id='editRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-edit'></i></button>" +
							"<button id='delRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-trash-o'></i></button>" +
							"</div>";
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
			// 用于级联效果的参数，防止前面值的影响，置为空
			taskid = null;
			redevid = null;
			sel.syndata('owerdep', "<%=request.getContextPath()%>/rest/department/getdeplist", 'id', 'name', function(data) {});
			sel.syndata('typeid', "<%=request.getContextPath()%>/rest/dic/getInspcetTypeList", 'id', 'name', function(data) {});

			$("input[name=name]").val("");
			$("#isfault").select2("val", [ 0 ])
			$("textarea[name=inspectcontent]").val("");
			$("textarea[name=inspectresult]").val("");
			$("input[name=inspecttime]").val("");
			$("input[name=inspectperson]").val("");
			url = "<%=request.getContextPath()%>/rest/inspect/insertOneInspect";
			$("#myModalLabel").html("<b>巡检信息录入</b>");
			$("#editModal").modal("show");
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

		//修改
		$("#dataTable tbody").on("click", "#editRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			$("input[name=id]").val(data.id);
			taskid = data.taskid;
			redevid = data.redevid;
			sel.synbinddata('owerdep', "<%=request.getContextPath()%>/rest/department/getdeplist", 'id', 'name', data.owerdep, function(data) {});
			sel.synbinddata('typeid', "<%=request.getContextPath()%>/rest/dic/getInspcetTypeList", 'id', 'name', data.typeid, function(data) {});

			$("input[name=name]").val(data.name);
			$("#isfault").select2("val", [ data.isfault ])
			$("textarea[name=inspectcontent]").val(data.inspectcontent);
			$("textarea[name=inspectresult]").val(data.inspectresult);
			$("input[name=inspecttime]").val(new Date(data.inspecttime).format("yyyy-MM-dd hh:mm:ss"));
			$("input[name=inspectperson]").val(data.inspectperson);
			//修改操作时controller的url
			url = "<%=request.getContextPath()%>/rest/inspect/updateOneInspect";
			$("#myModalLabel").html("<b>修改巡检信息</b>");
			$("#editModal").modal("show");

			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

		var taskid;
		// 巡检类型下拉列表值变化监听事件
		$("#typeid").on('change', function() {
			var typeIdVal = $("#typeid").val();
			if (typeIdVal != 1) {
				$("#taskid").next().css("display", "none");
				$("#taskid").empty();
				$("#taskLable").hide();
			} else {
				$("#taskid").next().css("display", "block");
				$("#taskid").prop("disabled", false);
				if (taskid == null) {
					sel.bindselectfirst('taskid', "<%=request.getContextPath()%>/rest/task/getTransedTaskList", 'id', 'taskcontent');
				} else {
					sel.binddata('taskid', "<%=request.getContextPath()%>/rest/task/getTransedTaskList", 'id', 'taskcontent', taskid);
					taskid = null;
				}
				$("#taskLable").show();
			}
		});

		// 遥控站与市州之间的级联
		var redevid;
		$("#owerdep").on('change', function() {
			var owerDepVal = $("#owerdep").val();
			if (redevid != null) {
				//查找相应市州下的遥控站
				sel.binddata('redevid', "<%=request.getContextPath()%>/rest/remotestation/getRemoteStationList?owerdep=" + owerDepVal, 'id', 'name', redevid);
				redevid = null;
			} else {
				sel.bindselectfirst('redevid', "<%=request.getContextPath()%>/rest/remotestation/getRemoteStationList?owerdep=" + owerDepVal, 'id', 'name');
			}
		});

		// 提交
		$("#btn-submit").on("click", function() {
			$("#editForm").bootstrapValidator('validate'); //提交验证
			if ($("#editForm").data('bootstrapValidator').isValid()) { //获取验证结果，如果成功，执行下面代码
				if (confirm("确定提交么？")) {
					//获取到表单中的数据
					var params = $("#editForm").form().getFormSimpleData();
					alert(JSON.stringify(params))
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
					url : "<%=request.getContextPath()%>/rest/inspect/deleteOneInspect",
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
			var inspectIds = JSON.stringify(check_val);
			url = "<%=request.getContextPath()%>/rest/inspect/deleteInspectByBatch";
			if (confirm("确定要删除吗？！")) {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					cache : "false",
					data : inspectIds, //传给后台的数据
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
					},
					name : {
						validators : {
							notEmpty : {
								message : '请输入巡检名称'
							}
						}
					},
					inspectcontent : {
						validators : {
							notEmpty : {
								message : '请输入巡检内容'
							}
						}
					},
					inspectresult : {
						validators : {
							notEmpty : {
								message : '请输入巡检结论'
							}
						}
					},
					inspectperson : {
						validators : {
							notEmpty : {
								message : '请输入巡检人姓名'
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

		var verify_data;
		// 审核按钮事件
		$("#dataTable tbody").on("click", "#btn_verify", function() {
			verify_data = tables.api().row($(this).parents("tr")).data();
			$("#verify_opinion_modal").modal("show");
			$("#finishcontent").val("");
		});

		// 提交审核意见
		$("#btn_confirm").on("click", function() {
			verify_data.finishcontent = $("#finishcontent").val();
			verify_data.filltime = new Date(verify_data.filltime).format("yyyy-MM-dd hh:mm:ss");
			verify_data.inspecttime = new Date(verify_data.inspecttime).format("yyyy-MM-dd hh:mm:ss");
			console.log(JSON.stringify(verify_data));
			url = "<%=request.getContextPath()%>/rest/inspect/verify";
			if (confirm("确定提交审核意见吗？？")) {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					cache : "false",
					data : verify_data, //传给后台的数据
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

		$("#dataTable tbody").on("click", "#btn_read", function() {});
	});
</script>
