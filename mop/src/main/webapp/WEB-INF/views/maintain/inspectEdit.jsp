<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>巡检信息修改</title>
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
	<input type="hidden" value="${inspectid }" id="inspectidFromInfor" />
	<input type="hidden" value="${preurl }" id="preurlFromInfor">
	<!-- 查询、添加、批量删除、导出、刷新 -->
	<div class="content">
		<!-- 查询、添加、批量删除、导出、刷新 -->
		<form class="form-horizontal" id="editForm" action="" method="post">
			<div class="row-fluid">
				<div class="row" style="margin-left:0px;">
					<h5>巡检信息修改:</h5>
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
							<select class="form-control select2" name="owerdep" id="owerdep">
							</select>
						</div>
						<label for="inputName" class="col-sm-2 control-label">遥控站</label>
						<div class="col-sm-4">
							<select class="form-control select2" name="redevid" id="redevid">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label">巡检类型</label>
						<div class="col-sm-4">
							<select class="form-control select2" name="typeid" id="typeid">
							</select>
						</div>
						<label id="taskLable" for="inputName"
							class="col-sm-2 control-label">任务</label>
						<div class="col-sm-4">
							<select class="form-control select2" name="taskid" id="taskid">
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
							<select class="form-control select2" name="isfault" id="isfault">
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
									id="inspecttime" /> <span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
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

			<!-- ==========modal-body结束======== -->
			<!-- 						<div class="modal-footer"> -->
			<button type="button" id="btn-cancel" class="btn btn-default"
				data-btn-type="cancel">
				<i class="fa fa-reply">&nbsp;取消</i>
			</button>
			<button type="submit" id="btn-submit" class="btn btn-primary">
				<i class="fa fa-save">&nbsp;保存</i>
			</button>
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
							data-ref="url2" class="file-loading" value="test" multiple /> <input
							type="hidden" id="path" name="path" value="upload/material">
					</form>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" id="btn_fake_cancel" class="btn btn-default"
				data-btn-type="cancel">
				<i class="fa fa-reply">&nbsp;返回</i>
			</button>
			<button type="submit" id="btn_fake_submit" class="btn btn-primary">
				<i class="fa fa-save">&nbsp;保存</i>
			</button>
		</div>
		<!-- ====================editModal结束==================== -->
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
	var inspectidFromPrePage = $("#inspectidFromInfor").val(); // 用于上传图片的巡检的编号
	var querydata = [];
	querydata.querystring = "";
	//页面加载完成后根据查询语句设置查询框中的选项
	$(function() {
		// 按钮必须在表单内部才可以用bootstrapValidator验证，
		// 这与图片上传的form冲突，所以用另外一个按钮来操纵提交按钮，避免冲突
		$("#btn-submit").hide();
		$("#btn-cancel").hide();
		$("#btn_fake_submit").on("click", function() {
			$("#btn-submit").click();
		});

		console.log(inspectidFromPrePage + "sada");
		// 初始化上传控件
		initFileInput();

		//表单数据验证
		inputvalidator();

		//填充数据,利用跳转时传过来的id
		$.ajax({
			url : "<%=request.getContextPath()%>/rest/inspect/getInspectVobyid?inspectid=" + inspectidFromPrePage,
			type : 'post',
			dataType : "json",
			cache : "false",
			data : null,
			success : function(returnData) {
				fillBackData(returnData);
			},
			error : function(err) {
				toastr.error("Server Connection Error<%=request.getContextPath()%>.");
			}
		});

		//回填数据
		function fillBackData(returndata) {
			var data = returndata[0]
			console.log(data)
			$("input[name=id]").val(data.id);
			taskid = data.taskid;
			redevid = data.redevid;
			sel.synbinddata('owerdep', "<%=request.getContextPath()%>/rest/department/getdeplist", 'id', 'name', data.owerdep, function(data) {});
			sel.synbinddata('typeid', "<%=request.getContextPath()%>/rest/dic/getInspcetTypeList", 'id', 'name', data.typeid, function(data) {});
			$("#typeid").prop("disabled", true);
			$("#taskid").prop("disabled", true);
			$("input[name=name]").val(data.name);
			$("#isfault").empty();
			if (data.isfault == 0) {
				stateOfFault = data.isfault
				$("#isfault").append("<option value='" + 0 + "'>&nbsp;" + "无故障" + "</option>");
				$("#isfault").append("<option value='" + 1 + "'>&nbsp;" + "有故障" + "</option>");
			}
			if (data.isfault == 1) {
				stateOfFault = data.isfault
				$("#isfault").append("<option value='" + 0 + "'>&nbsp;" + "无故障" + "</option>");
				$("#isfault").append("<option value='" + 1 + "'>&nbsp;" + "有故障" + "</option>");
				$("#isfault").append("<option value='" + 2 + "'>&nbsp;" + "已修复" + "</option>");
			}
			if (data.isfault == 2) {
				$("#isfault").append("<option value='" + 1 + "'>&nbsp;" + "有故障" + "</option>");
				$("#isfault").append("<option value='" + 2 + "'>&nbsp;" + "已修复" + "</option>");
			}
			$("#isfault").select2("val", [ data.isfault ])
			$("textarea[name=inspectcontent]").val(data.inspectcontent);
			$("textarea[name=inspectresult]").val(data.inspectresult);
			$("input[name=inspecttime]").val(new Date(data.inspecttime).format("yyyy-MM-dd hh:mm:ss"));
			$("input[name=inspectperson]").val(data.inspectperson);

			// 回显图片
			filelist = [];
			pathArr = [];
			nameArr = [];
			for (var k = 0; k < data.bpersoninspectionattachs.length; k++) {
				var item = data.bpersoninspectionattachs[k];
				/* alert(JSON.stringify(item)); */
				//构造
				pathArr.push("<%=request.getContextPath()%>" + "/" + item.url); //文件访问地址 这里需要网络地址  例：http://localhost:8080/xxx/xx.jpg
				var obj = new Object();
				obj.size = 100;
				obj.key = item.id;
				obj.url = "<%=request.getContextPath()%>/rest/FileUpload/springDelete" + "?fileurl=" + item.url; //用于初始化文件删除事件地址

				nameArr.push(obj);
				//用于重新上传和更新
				var attach = new Object();
				attach.id = item.id
				attach.url = item.url;
				filelist.push(attach);
			}
			//显示附件列表
			initFileInput();
		}

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
			console.log("owerdep is change")
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
					$.ajax({
						url : "<%=request.getContextPath()%>/rest/inspect/updateOneInspect",
						type : 'post',
						cache : "false",
						data : params,
						dataType : "json",
						success : function(returnData) {
							if (returnData.success) {
								// 执行添加操作后需要返回添加成功后的巡检的id，用于图片的上传
								window.location.href = "<%=request.getContextPath()%>/rest/inspect/inspectManage";
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
			window.location.reload();
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
				submitHandler : function(validator, functionform, submitButton) {},
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

		//回退到上一个界面
		$("#btn_fake_cancel").on("click", function() {
			window.location.href = "<%=request.getContextPath()%>/rest/inspect/inspectManage";
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
		attach.id = null;
		attach.url = url;
		attach.title = "图片";
		filelist.push(attach); //上传
		var deleteaction = deleteUrl + "?fileurl=" + url;
		$("#" + previewId).find(".kv-file-remove").click(function() {
			$.ajax({
				url : deleteaction,
				type : "post",
				dataType : "json",
				success : function(result) {
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
				url : "<%=request.getContextPath()%>/rest/inspect/deleteOneAttach",
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