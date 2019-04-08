<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>任务管理</title>
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
					<th>任务类型</th>
					<th>任务内容</th>
					<th>任务状态</th>
					<th>下达人</th>
					<th>下达时间</th>
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
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">任务类型</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="type" id="type">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">任务内容</label>
										<div class="col-sm-4">
											<textarea class="form-control" rows="5" name="taskcontent"
												id="taskcontent" placeholder="输入任务的内容..."></textarea>
										</div>
									</div>
								</form>
								<!-------------第一个表框结束 ---------->
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
					<!-- modal-body END -->
				</div>
			</div>
		</div>
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
		minView : "month",
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
		var str = "";
		<shiro:hasAnyRoles name = "admin">
    	 str+= "<div class='btn-group'>" +
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
				url : "<%=request.getContextPath()%>/rest/task/getTaskDataGrid",
				dataSrc : "data", //传输回来的数据
				dataType : 'json',
				data : querydata //传输过去的数据
			},
			columns : [ //对应上面thead里面的序列
				{
					"data" : "null" //复选框
				},
				{
					"data" : "id" //编号
				},
				{
					"data" : "type" //市州
				},
				{
					"data" : 'taskcontent', //系统大类的名称
				},
				{
					"data" : 'state', //设备类型名称
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							return "待完成";
							break;
						case 1:
							return "已完成";
							break;
						}

					}
				},
				{
					"data" : 'transperson' //设备型号
				},
				{
					"data" : 'transtime', //设备运维类型
					"render" : function(data, type, full, callback) {
						return new Date(data).format("yyyy-MM-dd");
					}
				},
				{
					"data" : 'columnDefs' //此项用于操作第一列为一个递增的序列，操作最后一列为操作按钮（只有具有admin权限的使用者才具有该权限）
				}
			],
			//操作按钮
			columnDefs : [
				{
					targets : 0,
					defaultContent : "<input type='checkbox' name='checkList'>"
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
			sel.bindselectfirst('type', "<%=request.getContextPath()%>/rest/dic/selectTaskTypeList", 'id', 'name');
			$("textarea[name=taskcontent]").val("");
			url = "<%=request.getContextPath()%>/rest/task/insertOneTask";
			$("#myModalLabel").html("<b>任务录入</b>");
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
			sel.binddata('type', "<%=request.getContextPath()%>/rest/dic/selectTaskTypeList", 'id', 'name', data.type);
			$("textarea[name=taskcontent]").val(data.taskcontent);
			//修改操作时controller的url
			url = "<%=request.getContextPath()%>/rest/task/updateOneTask";
			$("#myModalLabel").html("<b>修改设备信息</b>");
			$("#editModal").modal("show");

			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

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
					url : "<%=request.getContextPath()%>/rest/task/deleteOneTask",
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
			var taskIds = JSON.stringify(check_val);
			url = "<%=request.getContextPath()%>/rest/task/deleteTaskByBatch";
			if (confirm("确定要删除吗？！")) {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					cache : "false",
					data : taskIds, //传给后台的数据
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
					devcode : {
						validators : {
							notEmpty : {
								message : '请输入设备编号'
							}
						}
					},
					name : {
						validators : {
							notEmpty : {
								message : '请输入设备名称'
							}
						}
					},
					typecode : {
						validators : {
							notEmpty : {
								message : '请输入设备规格型号'
							}
						}
					},
					application : {
						validators : {
							notEmpty : {
								message : '请输入设备用途'
							}
						}
					},
					leavecode : {
						validators : {
							notEmpty : {
								message : '请输入出厂编号'
							}
						}
					},
					buyaddress : {
						validators : {
							notEmpty : {
								message : '请输入采购地址'
							}
						}
					},
					devrevalue : {
						validators : {
							notEmpty : {
								message : '请输入设备原值'
							}
						}
					},
					assectcode : {
						validators : {
							notEmpty : {
								message : '请输入资产编号'
							}
						}
					},
					buyperson : {
						validators : {
							notEmpty : {
								message : '请输入采购人名称'
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
	});
</script>
