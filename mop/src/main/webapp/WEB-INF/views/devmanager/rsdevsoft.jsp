<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>设备管理</title>
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
					<div class="col-sm-2" style="width: 60px">
						<label for=owerdep class="control-label">市州</label>
					</div>
					<div class="col-sm-2">
						<select class="form-control select2" id="queryOwerDepById"
							name="queryOwerDepById">
						</select>
					</div>
					<div class="col-sm-2" style="width: 75px">
						<label for="stationdevhouse" class="control-label">遥控站</label>
					</div>
					<div class="col-sm-2">
						<select class="form-control select2" id="queryStationDevHouseById"
							name="queryStationDevHouseById">
						</select>
					</div>
					<div class="col-sm-2" style="width: 100px">
						<label for="name" class="control-label">系统名称</label>
					</div>
					<div class="col-sm-2">
						<select class="form-control select2" id="querySystemById"
							name="querySystemById">
						</select>
					</div>
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
				<button type="button" class="btn btn-primary btn-sm" id="btn-export">
					<i class="fa fa-sign-in"></i> 导出
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
					<th>系统大类</th>
					<th>设备类型</th>
					<th>设备型号</th>
					<th>运维类型</th>
					<th>售后</th>
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
						<h4 class="modal-title" id="myModalLabel">信息修改</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" id="editForm" action=""
							method="post">
							<input type="hidden" class="form-control" name="id" id='id'>
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
									<!-- 第一行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">设备编号</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="devcode"
												id="devcode" placeholder="请输入设备编号">
										</div>
										<label for="inputName" class="col-sm-2 control-label">设备名称</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="name" id="name"
												placeholder="请输入设备名称">
										</div>
									</div>

									<!-- 第二行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">系统大类</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="systemtypeid"
												id="systemtypeid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">设备类型</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="devtypeid"
												id="devtypeid">
											</select>
										</div>
									</div>

									<!-- 第三行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">运维类型</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="maintenid"
												id="maintenid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">规格型号</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="typecode"
												id="typecode" placeholder="请输入规格型号">
										</div>
									</div>

									<!-- 第四行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">责任人</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="mngpersonid"
												id="mngpersonid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">设备用途</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="application"
												id="application" placeholder="请输入设备的用途">
										</div>
									</div>

									<!-- 第五行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">所属地州</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="depid" id="depid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">所属遥控站</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="rchouseid"
												id="rchouseid">
											</select>
										</div>
									</div>

									<!-- 第六行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">供应商</label>
										<div class="col-sm-4">
											<select class="form-control select2"
												name="providerenterpriseid" id="providerenterpriseid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">制造商</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="madeenterpriseid"
												id="madeenterpriseid">
											</select>
										</div>
									</div>

									<!-- 第七行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">出厂日期</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='leavedate'
													id="leavedate" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label for="inputName" class="col-sm-2 control-label">出厂编号</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="leavecode"
												id="leavecode" placeholder="请输入出厂编号">
										</div>
									</div>

									<!-- 第八行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">采购日期</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='buydate'
													id="buydate" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label for="inputName" class="col-sm-2 control-label">采购地址</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="buyaddress"
												id="buyaddress" placeholder="请输入采购地址">
										</div>
									</div>
									<!-- 第九行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">设备原值</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="devrevalue"
												id="devrevalue" placeholder="请输入设备原值">
										</div>
										<label for="inputName" class="col-sm-2 control-label">资产编号</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="assectcode"
												id="assectcode" placeholder="请输入资产编号">
										</div>
									</div>
									<!-- 第十行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">采购人</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="buyperson"
												id="buyperson" placeholder="请输入采购人名称">
										</div>
										<label for="inputName" class="col-sm-2 control-label">质保时间</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='qualdate'
													id="qualdate" /> <span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
									<!-- 十一行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">保修时间</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='repairdate'
													id="repairdate" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label for="inputName" class="col-sm-2 control-label">报废时间</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='scrapdate'
													id="scrapdate" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
									<!-------------第一个表框结束 ---------->
								</div>
							</div>
							<!-- 第一个表框结束 -->

							<!-- 第二个表框开始 -->
							<!-- 头信息开始 -->
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
									<h5>安装配置信息:</h5>
								</div>
							</div>
							<!-- 头信息结束 -->

							<!-- 内容部分开始 -->
							<div class="panel panel-default" id="panel2">
								<div class="panel-body">
									<div class="form-group">
										<!-- 第一行 -->
										<label for="inputName" class="col-sm-2 control-label">安置地点</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="installrchouseid"
												id="installrchouseid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">使用人</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="usepersonid"
												id="usepersonid">
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">安装公司</label>
										<div class="col-sm-4">
											<select class="form-control select2"
												name="installenterpriseid" id="installenterpriseid">
											</select>
										</div>
									</div>

									<!-- 第二行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">安置日期</label>
										<div class="col-sm-4">
											<div class='input-group date' id='datetimepicker'>
												<input type='text' class="form-control" name='installdate'
													id="installdate" /> <span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
										<label for="inputName" class="col-sm-2 control-label">安置事由</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="installreson"
												id="installreson" placeholder="请输入安装事由">
										</div>
									</div>

									<!-- 第三行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">IP地址</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="mainip"
												id="mainip" placeholder="请输入IP地址">
										</div>
										<label for="inputName" class="col-sm-2 control-label">端口号</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="mainport"
												id="mainport" placeholder="请输入端口号">
										</div>
									</div>

									<!-- 第四行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">传输协议1</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="tprotocal1"
												id="tprotocal1" placeholder="请输入传输协议1">
										</div>
										<label for="inputName" class="col-sm-2 control-label">传输协议2</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="tprotocal2"
												id="tprotocal2" placeholder="请输入传输协议2">
										</div>
									</div>

									<!-- 第五行 -->
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">用户名</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="username"
												id="username" placeholder="请输入用户名">
										</div>
										<label for="inputName" class="col-sm-2 control-label">密码</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="password"
												id="password" placeholder="请输入密码">
										</div>
									</div>

									<!-- 行结束 -->
								</div>
							</div>
							<!-- 内容部分结束 -->
							<!-- 第二个表框结束 -->

							<!-- ================= -->
							<div class="box box-primary">
								<div class="box-header with-border">
									<div class="btn-group">
										<button type="button" class="btn btn-default"
											data-btn-type="add">&nbsp;性能参数</button>
										<button type="button" class="btn btn-default"
											data-btn-type="edit">&nbsp;配件</button>
										<button type="button" class="btn btn-default"
											data-btn-type="delete">&nbsp;影音文档</button>
									</div>
								</div>
								<div class="box-body">
									<div class="btn-group">
										<button type="button" class="btn btn-primary btn-sm"
											id="btn-add-softparameter">
											<i class="fa fa-plus"></i> 添加
										</button>
										<button type="button" class="btn btn-primary btn-sm"
											id="btn-delAll-softparameter">
											<i class="fa fa-remove"></i> 删除
										</button>
									</div>
									<table id="softparameterTable"
										class="table table-striped table-bordered table-hover table-condensed"
										align="center">
										<thead>
											<tr class="info">
												<td><input type="checkbox" id="checkAll"></td>
												<th>编号</th>
												<th>参数名</th>
												<th>取值</th>
												<th>数据类型</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
							<!-- ================= -->

							<div class="modal-footer">
								<button type="button" id="btn-cancel" class="btn btn-default"
									data-btn-type="cancel">
									<i class="fa fa-reply">&nbsp;取消</i>
								</button>
								<button type="submit" id="btn-submit" class="btn btn-primary">
									<i class="fa fa-save">&nbsp;保存</i>
								</button>
							</div>
						</form>
					</div>
					<!-- modal-body END -->

				</div>
			</div>
		</div>

		<!-- ============================================ -->
		<!-- 添加性能参数的model -->
		<div class="modal fade" id="modal-softparameter">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">性能参数录入</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label for="softParameterName" class="col-sm-2 control-label">参数名</label>
								<div class="col-sm-6">
									<input type="text" class="form-control"
										name="softParameterName" id="softParameterName"
										placeholder="请输入参数名">
								</div>
							</div>
							<div class="form-group">
								<label for="softParameterValue" class="col-sm-2 control-label">参数值</label>
								<div class="col-sm-6">
									<input type="text" class="form-control"
										name="softParameterValue" id="softParameterValue"
										placeholder="请输入参数值">
								</div>
							</div>
							<div class="form-group">
								<label for="softParameterDataType"
									class="col-sm-2 control-label">数据类型</label>
								<div class="col-sm-4">
									<select class="form-control select2"
										name="softParameterDataType" id="softParameterDataType">
										<option value="0" selected="selected">数字</option>
										<option value="1">字符串</option>
									</select>
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
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
			<!-- ============================================ -->


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
		format : 'yyyy-mm-dd',
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
	var restr = $('#querystr').val(); //有跳转，跳转回来的时候用
	querydata.querystring = "";
	if (null != restr) {
		querydata.querystring = restr;
		//解析restr 设置查询条件 projecttype_id:1,projectstate:1,name:

		var name = "";
		var owerdep = null
		var qarr = restr.split(",");
		for (var i = 0; i < qarr.length; i++) {
			var item = qarr[i];
			var itemarra = item.split(":");
			switch (itemarra[0]) {
			case "name":
				name = itemarra[1];
				break;
			case "name":
				name = itemarra[1];
				break;
			default:
				break;
			}
		}
	}
	//页面加载完成后根据查询语句设置查询框中的选项
	window.onload = function() {
		if (null != name) {
			$('#keyword').val(name);
		}
	}

	$(function() {
		form = $('#editForm').form();
		sel.bindselectTheAll('queryOwerDepById', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name');
		sel.bindselectTheAll('queryStationDevHouseById', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name');
		sel.bindselectTheAll('querySystemById', "<%=request.getContextPath()%>/rest/devsystem/getbdevsystemvolist", 'id', 'name');
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
			//processing: true,//载入数据的时候是否显示“载入中”
			pageLength : 10, //首次加载的数据条数
			ordering : false, //排序操作在服务端进行，所以可以关了。
			pagingType : "full_numbers",
			autoWidth : false,
			stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
			searching : false, //禁用datatables搜索
			ajax : {
				type : "post",
				url : "<%=request.getContextPath()%>/rest/devsoft/devsoftdataGrid",
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
					"data" : "departname" //市州
				},
				{
					"data" : 'systemname', //系统大类的名称
				},
				{
					"data" : 'devtypename' //设备类型名称
				},
				{
					"data" : 'typecode' //设备型号
				},
				{
					"data" : 'devmaintainname' //设备运维类型
				},
				{
					"data" : 'enterprisename' //售后（供应商的名称）
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
			//获取所在部门的id
			var depid = $("#queryOwerDepById").val();
			querydata.querystring = querydata.querystring + ",depid:" + depid;
			//获取遥控站的id
			var stationdevhouseid = $("#queryStationDevHouseById").val();
			querydata.querystring = querydata.querystring + ",stationdevhouseid:" + stationdevhouseid;
			//获取配套系统的id
			var systemid = $("#querySystemById").val();
			querydata.querystring = querydata.querystring + ",systemid:" + systemid;
			//输入框中的内容
			var name = $("#keyword").val();
			querydata.querystring = querydata.querystring + ",name:" + name;

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
			$("input[name=devcode]").val("1");
			$("input[name=name]").val("1");
			//系统大类下拉列表数据的获取
			sel.bindselectfirst('systemtypeid', "<%=request.getContextPath()%>/rest/dic/selectSystemTypeList", 'id', 'name');
			//设备类型下拉列表数据的获取
			sel.bindselectfirst('devtypeid', "<%=request.getContextPath()%>/rest/dic/selectDevTypeList", 'id', 'name');
			//运维类型下拉列表数据的获取
			sel.bindselectfirst('maintenid', "<%=request.getContextPath()%>/rest/dic/selectDevMaintainTypeList", 'id', 'name');
			$("input[name=typecode]").val("1");
			//责任人下拉列表数据的获取
			sel.bindselectfirst('mngpersonid', "<%=request.getContextPath()%>/rest/user/userList", 'id', 'name');
			//所在部门下拉列表数据的获取
			sel.bindselectfirst('depid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name');
			sel.bindselectfirst('rchouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name');
			$("input[name=application]").val("1");
			//供应商下拉列表数据的获取
			sel.bindselectfirst('providerenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name');
			//制造商下拉列表数据的获取
			sel.bindselectfirst('madeenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name');
			$("input[name=leavecode]").val("1");
			$("input[name=buyaddress]").val("1");
			$("input[name=devrevalue]").val("1");
			$("input[name=assectcode]").val("1");
			$("input[name=buyperson]").val("1");
			sel.bindselectfirst('installrchouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name');
			sel.bindselectfirst('usepersonid', "<%=request.getContextPath()%>/rest/user/userList", 'id', 'name');
			sel.bindselectfirst('installenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name');
			$("input[name=installreson]").val("1");
			$("input[name=mainip]").val("1");
			$("input[name=mainport]").val("1");
			$("input[name=tprotocal1]").val("1");
			$("input[name=tprotocal2]").val("1");
			$("input[name=username]").val("1");
			$("input[name=password]").val("1");
			$("#leavedate").val("");
			$("#buydate").val("");
			$("#qualdate").val("");
			$("#repairdate").val("");
			$("#scrapdate").val("");
			$("#installdate").val("");
			
			//添加配套系统的设备信息时的controller的url
			url = "<%=request.getContextPath()%>/rest/devsoft/insertDevSoftVo";
			$("#myModalLabel").html("<b>设备录入</b>");
			$("#editModal").modal("show");
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
		});

		//删除
		$("#dataTable tbody").on("click", "#delRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			// 如果不是仅仅以id来删除某条记录的话而是传入整个对象，
			// 那么就必须处理时间格式
			// data.leavedate = new Date(data.leavedate).format("yyyy-MM-dd");
			// data.buydate = new Date(data.buydate).format("yyyy-MM-dd");
			// data.qualdate = new Date(data.qualdate).format("yyyy-MM-dd");
			// data.repairdate = new Date(data.repairdate).format("yyyy-MM-dd");
			// data.scrapdate = new Date(data.scrapdate).format("yyyy-MM-dd");
			// data.installdate = new Date(data.installdate).format("yyyy-MM-dd");
			var obj = new Object();
			obj.id = data.id;
			obj.name = data.name;
			if (confirm("是否确认删除这条信息?")) {
				$.ajax({
					url : "<%=request.getContextPath()%>/rest/devsoft/deleteDevSoft",
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
			devSoftIds = JSON.stringify(check_val);
			url = "<%=request.getContextPath()%>/rest/devsoft/deleteDevSoftBatch";
			$.ajax({
				url : url,
				type : 'post',
				dataType : "json",
				cache : "false",
				data : devSoftIds, //传给后台的数据
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
		});

		//报表打印
		function openDownloadDialog(url, saveName) {
			if (typeof url == 'object' && url instanceof Blob) {
				url = URL.createObjectURL(url);
			}
			var aLink = document.createElement('a');
			aLink.href = url;
			aLink.download = saveName || '';
			var event;
			if (window.MouseEvent)
				event = new MouseEvent('click');else {
				event = document.createEvent('MouseEvents');
				event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
			}
			aLink.dispatchEvent(event);
		}

		function sheet2blob(sheet, sheetName) {
			sheetName = sheetName || 'sheet1';
			var workbook = {
				SheetNames : [ sheetName ],
				Sheets : {}
			};
			workbook.Sheets[sheetName] = sheet;
			var wopts = {
				bookType : 'xlsx',
				bookSST : false,
				type : 'binary'
			};
			var wbout = XLSX.write(workbook, wopts);
			var blob = new Blob([ s2ab(wbout) ], {
				type : "application/octet-stream"
			});
			function s2ab(s) {
				var buf = new ArrayBuffer(s.length);
				var view = new Uint8Array(buf);
				for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
				return buf;
			}
			return blob;
		}

		//导出
		$("#btn-export").on("click", function() {
			url = "<%=request.getContextPath()%>/rest/devsoft/getDevSoftList";
			$.ajax({
				url : url,
				type : 'post',
				dataType : "json",
				cache : "false",
				contentType : "application/json;charset=UTF-8",
				success : function(data) {
					//处理时间格式
					$.each(data, function(index, value) {
						data[index].leavedate = new Date(data[index].leavedate).format("yyyy-MM-dd");
						data[index].buydate = new Date(data[index].buydate).format("yyyy-MM-dd");
						data[index].qualdate = new Date(data[index].qualdate).format("yyyy-MM-dd");
						data[index].repairdate = new Date(data[index].repairdate).format("yyyy-MM-dd");
						data[index].scrapdate = new Date(data[index].scrapdate).format("yyyy-MM-dd");
						data[index].installdate = new Date(data[index].installdate).format("yyyy-MM-dd");
					//alert(new Date(data[index].leavedate).format("yyyy-MM-dd"));
					})
					$("#btn-export").attr("disabled", true);
					var sheet = XLSX.utils.json_to_sheet(data);
					var titlte = "遥控站清单" + ".xlsx";
					openDownloadDialog(sheet2blob(sheet), titlte);
					setInterval(function() {
						$("#btn-export").attr("disabled", false);
					}, 2000);
				},
				error : function(err) {
					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
				}
			});
		});

		//刷新
		$("#btn-re").on("click", function() {
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

		//修改
		$("#dataTable tbody").on("click", "#editRow", function() {

			var data = tables.api().row($(this).parents("tr")).data();
			//根据选中的行，获取到该行数据的id，再去后台查询，用于model里面
			//那张表的数据的回显
			softparameterTable.rows.add(data.parameterList).draw()
			$("input[name=id]").val(data.id);
			$("input[name=devcode]").val(data.devcode);
			$("input[name=name]").val(data.name);
			sel.binddata('systemtypeid', "<%=request.getContextPath()%>/rest/dic/selectSystemTypeList", 'id', 'name', data.systemtypeid);
			sel.binddata('devtypeid', "<%=request.getContextPath()%>/rest/dic/selectDevTypeList", 'id', 'name', data.devtypeid);
			sel.binddata('maintenid', "<%=request.getContextPath()%>/rest/dic/selectDevMaintainTypeList", 'id', 'name', data.maintenid);
			$("input[name=typecode]").val(data.typecode);
			sel.binddata('mngpersonid', "<%=request.getContextPath()%>/rest/user/userList", 'id', 'name', data.mngpersonid);
			sel.binddata('depid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name', data.depid);
			sel.binddata('rchouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name', data.rchouseid);
			$("input[name=application]").val(data.application);
			sel.binddata('providerenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name', data.providerenterpriseid);
			sel.binddata('madeenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name', data.madeenterpriseid);
			$("#leavedate").val(new Date(data.leavedate).format("yyyy-MM-dd"));
			$("input[name=leavecode]").val(data.leavecode);
			$("#buydate").val(new Date(data.buydate).format("yyyy-MM-dd"));
			$("input[name=buyaddress]").val(data.buyaddress);
			$("input[name=devrevalue]").val(data.devrevalue);
			$("input[name=assectcode]").val(data.assectcode);
			$("input[name=buyperson]").val(data.buyperson);
			$("#qualdate").val(new Date(data.qualdate).format("yyyy-MM-dd"));
			$("#repairdate").val(new Date(data.repairdate).format("yyyy-MM-dd"));
			$("#scrapdate").val(new Date(data.scrapdate).format("yyyy-MM-dd"));
			sel.binddata('installrchouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name', data.installrchouseid);
			sel.binddata('usepersonid', "<%=request.getContextPath()%>/rest/user/userList", 'id', 'name', data.usepersonid);
			sel.binddata('installenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name', data.installenterpriseid);
			$("#installdate").val(new Date(data.installdate).format("yyyy-MM-dd"));
			$("input[name=installreson]").val(data.installreson);
			$("input[name=mainip]").val(data.mainip);
			$("input[name=mainport]").val(data.mainport);
			$("input[name=tprotocal1]").val(data.tprotocal1);
			$("input[name=tprotocal2]").val(data.tprotocal2);
			$("input[name=username]").val(data.username);
			$("input[name=password]").val(data.password);
			//修改操作时controller的url
			url = "<%=request.getContextPath()%>/rest/devsoft/updateDevSoftVo";
			$("#myModalLabel").html("<b>修改设备信息</b>");
			$("#editModal").modal("show");

			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
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

		$("#btn-submit").on("click", function() {
			var length = softparameterTable.data().length;
			var list = [];
			for (var i = 0; i < length; ++i) {
				list.push(softparameterTable.rows().data()[i]);
			}
			$("#editForm").bootstrapValidator('validate'); //提交验证
			if ($("#editForm").data('bootstrapValidator').isValid()) { //获取验证结果，如果成功，执行下面代码
				if (confirm("确定提交么？")) {
					//获取到表单中的数据
					var params = form.getFormSimpleData();
					params["parameterList"] = JSON.parse(JSON.stringify(list));
					alert(JSON.stringify(params));
					//此处的data保存了操作的返回值	
					$.ajax({
						url : url,
						type : 'post',
						dataType : "json",
						cache : "false",
						data : JSON.stringify(params),
						contentType : "application/json;charset=UTF-8",
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

		$("#btn-cancel").on("click", function() {
			$("#editModal").modal("hide");
		});

		//由于bootstrap不支持多层modal弹出框，当关闭其中一个modal是，会把所有modal-open给关闭，需要人工指定打开新的modal
		$("#modal-softparameter").on('hidden.bs.modal', function() {
			$(document.body).addClass("modal-open");
		});

		//添加设备参数时model弹出
		$("#btn-add-softparameter").on("click", function() {
			$("#modal-softparameter").modal("show");
		});

		var softparameterTable = $("#softparameterTable").DataTable({
			pageLength : 3, //首次加载的数据条数
			ordering : false, //排序操作在服务端进行，所以可以关了。
			pagingType : "full_numbers",
			autoWidth : false,
			stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
			searching : false, //禁用datatables搜索
			columns : [
				{
					"data" : 'columnDefs'
				},
				{
					"data" : null
				},
				{
					"data" : "name"
				},
				{
					"data" : "value"
				},
				{
					"data" : "valuetype",
					"render" : function(data, type, full, callback) {
						switch (data) {
						case 0:
							return "数字";
							break;
						case 1:
							return "字符串";
							break;
						default:
							return "其他";
							break;
						}
					}
				}
			],
			//操作按钮
			columnDefs : [
				{
					targets : 0,
					defaultContent : "<input type='checkbox'>"
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
			fnDrawCallback : function() {
				var api = this.api();
				//获取到本页开始的条数
				var startIndex = api.context[0]._iDisplayStart;
				api.column(1).nodes().each(function(cell, i) {
					cell.innerHTML = startIndex + i + 1;
				});
			}
		});

		$("#btn_confirm").on("click", function() {
			var data = new Object();
			data.name = $("#softParameterName").val();
			data.value = $("#softParameterValue").val();
			data.valuetype = parseInt($("#softParameterDataType").val());
			softparameterTable.row.add(data).draw();
			$("#softParameterName").val("");
			$("#softParameterValue").val("")
			$("#softParameterDataType").val("");
		});

		//监听model完全消失时触发的函数
		$("#editModal").on('hidden.bs.modal', function() {
			softparameterTable.clear().draw();
		})
		$("#softparameterTable tbody").on("click", 'tr', function() {
			 $(this).toggleClass('selected');
		});
		$("#btn-delAll-softparameter").on("click", function() {
			 softparameterTable.rows('.selected').remove().draw( false );
		});
		
	});
</script>
