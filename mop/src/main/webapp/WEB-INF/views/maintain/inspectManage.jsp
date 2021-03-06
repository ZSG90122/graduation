<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>巡检管理</title>
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
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css"> --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/fileinput.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<input type="hidden" id="query" value="${querystring }">
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
					<th>市州</th>
					<th>遥控站</th>
					<th>巡检类型</th>
					<th>巡检名称</th>
					<th>故障录入</th>
					<th>审核</th>
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

					<form class="form-horizontal" id="editForm" action="" method="post">
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
									<h5>巡检信息:</h5>
								</div>
							</div>

							<!-------------第一个表框开始 ---------->
							<div class="panel panel-default" id="panel1">
								<div class="panel-body">
									<input type="hidden" class="form-control" name="id" id='id'>
									<!-- 第一行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">市州</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="owerdep"
												id="owerdep">
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
										<label for="inputName" class="col-sm-2 control-label">巡检类型</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="typeid"
												id="typeid">
											</select>
										</div>
										<label id="taskLable" for="inputName"
											class="col-sm-2 control-label">任务</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="taskid"
												id="taskid">
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">巡检名称</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="name" id="name"
												placeholder="请输入巡检名称">
										</div>
										<label for="inputName" class="col-sm-2 control-label">故障状态</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="isfault"
												id="isfault">
												<option value="0">无故障</option>
												<option value="1">有故障</option>
												<option value="2">已修复</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">巡检内容</label>
										<div class="col-sm-4">
											<textarea class="form-control" rows="5" name="inspectcontent"
												id="inspectcontent" placeholder="输入巡检内容..."></textarea>
										</div>
										<label for="inputName" class="col-sm-2 control-label">巡检结论</label>
										<div class="col-sm-4">
											<textarea class="form-control" rows="5" name="inspectresult"
												id="inspectresult" placeholder="输入巡检结论..."></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">巡检时间</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='inspecttime'
													id="inspecttime" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label for="inputName" class="col-sm-2 control-label">巡检人名称</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="inspectperson"
												id="inspectperson" placeholder="请输入巡检人名称">
										</div>
									</div>
								</div>
							</div>
							<!-- ==========第一个表框结束======== -->
						</div>
						<!-- ==========modal-body结束======== -->
						<!-- 						<div class="modal-footer"> -->
						<button type="button" id="btn-cancel" class="btn btn-default"
							data-btn-type="cancel">
							<i class="fa fa-reply">&nbsp;取消</i>
						</button>
						<button type="submit" id="btn-submit" class="btn btn-primary">
							<i class="fa fa-save">&nbsp;保存</i>
						</button>
						<!-- 						</div> -->
					</form>

					<div class="modal-body">
						<div class="row-fluid">
							<div class="row" style="margin-left:0px;">
								<h5>图片上传:</h5>
							</div>
						</div>
						<div class="panel panel-default" id="panel1">
							<div class="panel-body">
								<form id="add_inspectattach_form" method="post"
									enctype="multipart/form-data">
									<input id="uploadimage" type="file" name="uploadimage"
										data-ref="url2" class="file-loading" value="test" multiple />
									<input type="hidden" id="path" name="path"
										value="upload/material">
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="btn_fake_cancel" class="btn btn-default"
							data-btn-type="cancel">
							<i class="fa fa-reply">&nbsp;取消</i>
						</button>
						<button type="submit" id="btn_fake_submit" class="btn btn-primary">
							<i class="fa fa-save">&nbsp;保存</i>
						</button>
					</div>

				</div>
			</div>
		</div>
		<!-- ====================editModal结束==================== -->
	</div>


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
							<label for="finishcontent" class="col-sm-2 control-label">审核意见</label>
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
	src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zh.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/conmmon/fileupload.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>


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
	querydata.querystring = $("#query").val();
	console.log(querydata.querystring)
	//页面加载完成后根据查询语句设置查询框中的选项
	window.onload = function() {
		if (null != name) {
			$('#keyword').val(name);
		}
	}
	$(function() {
		// 按钮必须在表单内部才可以用bootstrapValidator验证，
		// 这与图片上传的form冲突，所以用另外一个按钮来操纵提交按钮，避免冲突
		$("#btn-submit").hide();
		$("#btn-cancel").hide();
		$("#btn_fake_submit").on("click", function() {
			$("#btn-submit").click();
		})
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
				url : "<%=request.getContextPath()%>/rest/inspect/getInspectDataGrid",
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
					"data" : "owerdepname" //市州
				},
				{
					"data" : 'redevname' //遥控站
				},
				{
					"data" : 'inspecttypename' // 巡检类型
				},
				{
					"data" : 'name' // 巡检名称
				},
				{
					"data" : 'isfault',
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							return '<small class="label label-success">无故障</small>';
							break;
						case 1:
							return "<div class='btn-group'>" +
								"<a id='insert_fault' class='label label-danger' type='button'>故障录入</a>" +
								"</div>";
							break;
						case 2:
							return '<small class="label label-success">故障已修复</small>';
							break;
						}
					}
				},
				{
					"data" : 'state',
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							if (str === null)
								return "待审核";
							else
								return "<div class='btn-group'>" +
									"<a id='btn_verify' class='label label-primary'>点击审核</a>" +
									"</div>";
							break;
						case 1:
							return '<small class="label label-success">已审核</small>';
							break;
						default:
							return '<small class="label label-default">无需审核</small>';
							break;
						}
					}
				},
				{
					"data" : 'state', //此项用于操作第一列为一个递增的序列，操作最后一列为操作按钮（只有具有admin权限的使用者才具有该权限）
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							return str;
							break;
						case 1:
							return str;
							break;
						case 2:
							return str;
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
			$("#typeid").prop("disabled", false);
			$("input[name=id]").val(null);
			// 用于级联效果的参数，防止前面值的影响，置为空
			taskid = null;
			redevid = null;
			sel.syndata('owerdep', "<%=request.getContextPath()%>/rest/department/getdeplist", 'id', 'name', function(data) {});
			sel.syndata('typeid', "<%=request.getContextPath()%>/rest/dic/getInspcetTypeList", 'id', 'name', function(data) {});
			$("input[name=name]").val("");
			$("#isfault").empty();
			$("#isfault").append("<option value='" + 0 + "'>&nbsp;" + "无故障" + "</option>");
			$("#isfault").append("<option value='" + 1 + "'>&nbsp;" + "有故障" + "</option>");
			$("#isfault").select2("val", [ 0 ])
			$("textarea[name=inspectcontent]").val("");
			$("textarea[name=inspectresult]").val("");
			$("input[name=inspecttime]").val("");
			$("input[name=inspectperson]").val("");
			//初始化上传图片的参数
			filelist = [];
			pathArr = [];
			nameArr = [];
			initFileInput();
			url = "<%=request.getContextPath()%>/rest/inspect/insertOneInspect";
			$("#myModalLabel").html("<b>巡检信息录入</b>");
			$("#editModal").modal("show");
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});
		var stateOfFault = null; //这个值保存选中行是否存在过问题
		//修改
		$("#dataTable tbody").on("click", "#editRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			// 			if($("#keywordQualify").val()=="" && $("#talentroleId").val()==""){
			// 				querystrdata.querystring="";
			// 			}else if($("#keywordQualify").val()!="" && $("#talentroleId").val()==""){
			// 				querystrdata.querystring = $("#keywordQualify1").val()+","+$("#keywordQualify").val()+","+"k";
			// 			}else if($("#keywordQualify").val()=="" && $("#talentroleId").val()!=""){
			// 				querystrdata.querystring = ""+","+""+","+$("#talentroleId").val();
			// 			}
			var preurl = "<%=request.getContextPath()%>/rest/inspect/gotoInspectPageWithQuerystr";
			window.location.href = "<%=request.getContextPath()%>/rest/inspect/inspectEdit?inspectid=" + data.id + "&preurl=" + preurl;
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
				// 添加了校验之后会添加一个隐藏的标签，所以用两个next
				$("#taskid").next().css("display", "");
				if (taskid == null) {
					sel.bindselectNonefirst('taskid', "<%=request.getContextPath()%>/rest/task/getTransedTaskList", 'id', 'taskcontent');
				} else {
					sel.binddata('taskid', "<%=request.getContextPath()%>/rest/task/getFilledOneTaskById?taskid=" + taskid, 'id', 'taskcontent', taskid);
					taskid = null;
				}
				$("#taskLable").show();
			}
		});
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
			var value = $("#taskid").val();
			if ($("#editForm").data('bootstrapValidator').isValid() && value != -1) { //获取验证结果，如果成功，执行下面代码
				if (confirm("确定提交么？")) {
					//获取到表单中的数据
					var params = $("#editForm").form().getFormSimpleData();
					params["fileliststr"] = JSON.stringify(filelist);
					console.log(JSON.stringify(params));
					$.ajax({
						url : url,
						type : 'post',
						cache : "false",
						data : params,
						dataType : "json",
						success : function(returnData) {
							if (returnData.success) {
								tables.fnDraw(false);
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
			} else {
				if (value == -1)
					alert("任务巡检必须选择任务，若无任务请检查是否已下达！")
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
		// 数据校验
		function inputvalidator() {
			console.log("进行表单验证")
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
				}
			}).on("success.form.bv", function(e) {
				e.preventDefault(); //防止重复提交						
			});
		}
		$("#btn_fake_cancel").on("click", function() {
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
		// 插入故障按钮，带值跳转到故障录入界面
		$("#dataTable tbody").on("click", "#insert_fault", function() {
			verify_data = tables.api().row($(this).parents("tr")).data();
			if (undefined != $(window.parent.document).contents().find("#iframe_803")[0]) {
				parent.closeTab($(window.parent.document).contents().find("#iframe_803")[0]); //关掉重新
				parent.addTabs({
					id : '803',
					title : '故障录入',
					close : true,
					url : "/inspect/goTofaultManagePage?inspectid=" + verify_data.id
				});
				$(window.parent.document).contents().find("#iframe_803")[0].contentWindow.$("#btn-re").click();
			} else {
				parent.addTabs({
					id : '803',
					title : '故障录入',
					close : true,
					url : "/inspect/goTofaultManagePage?inspectid=" + verify_data.id
				});
			}
		});
	});
	// 上传文件的参数     在$(function(){})的外部
	var oFileInput = new DSFileInput();

	var filelist = [];
	var pathArr = new Array(); //文件网络地址 集合
	var nameArr = new Array(); //文件信息集合
	var filepath = "upload/material";
	var uploadUrl = "<%=request.getContextPath()%>/rest/FileUpload/springUpload";
	var deleteUrl = "<%=request.getContextPath()%>/rest/FileUpload/springDelete";
	// 上传成功后
	function uploadcallback(url, previewId, filetype) {
		var attach = new Object();
		attach.id = null
		attach.url = url;
		attach.title = "附件";
		filelist.push(attach); //上传
		console.log(filelist)
		var deleteaction = deleteUrl + "?fileurl=" + url;
		$("#" + previewId).find(".kv-file-remove").click(function() {
			$.ajax({
				url : deleteaction,
				type : "post",
				dataType : "json",
				success : function(result) {
					//删除文件成功
					filelist.removebyurl(result.url);
				},
				error : function(result) {}
			});
		});
	}

	function deletecallback(key) {
		console.log("deletecallback")
		var data = new Object();
		data.id = key;
		if (key > 0) {
			$.ajax({
				url : "<%=request.getContextPath()%>/rest/datamanager/deletewordbyid",
				type : 'post',
				dataType : "json",
				cache : "false",
				data : data,
				success : function(data) {
					if (data.success) {
						toastr.success("删除成功！");
					} else {
						toastr.error('删除失败！' + JSON.stringify(data));
					}
				},
				error : function(err) {
					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
				}
			});
		}
		filelist.removebyid(key);
	}
	function initFileInput() {
		$("#add_inspectattach_form").empty();
		$("#add_inspectattach_form").append("<input id='uploadimage' type='file' name='uploadimage' data-ref='url2' class='file-loading' value='test' multiple/>");
		oFileInput.Init("uploadimage", uploadUrl, deleteUrl, true, pathArr, nameArr, filepath, uploadcallback, deletecallback);
	}
	Array.prototype.removebyid = function(id) {
		if (this.length < 1) {
			return false;
		}
		var a = -1;
		for (var i = 0; i < this.length; i++) {
			if (this[i].id == id) {
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
		if (this.length < 1) {
			return false;
		}
		var a = -1;
		for (var i = 0; i < this.length; i++) {
			if (this[i].url == url) {
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