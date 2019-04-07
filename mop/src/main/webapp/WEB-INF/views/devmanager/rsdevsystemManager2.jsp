<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>配套系统管理</title>
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
<!-- <body style="overflow: hidden" class="sidebar-mini"> -->
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
					<button type="button" class="btn btn-primary btn-sm"
						id="btn-delAll">
						<i class="fa fa-remove"></i> 删除
					</button>
					<button type="button" class="btn btn-primary btn-sm"
						id="btn-export">
						<i class="fa fa-sign-in"></i> 导出
					</button>
					<button type="button" class="btn btn-primary btn-sm" id="btn-re">
						<i class="fa fa-refresh"></i> 刷新
					</button>
				</div>
			</div>

			<div class="row">
				<form id="queryForm" action="" method="post">
					<div class="col-sm-2" style="width: 60px">
						<label for=owerdep class="control-label">市州</label>
					</div>
					<div class="col-sm-2">
						<select class="form-control select2" id="queryowerdepid"
							name="owerdep">
						</select>
					</div>
					<div class="col-sm-2" style="width: 75px">
						<label for="stationdevhouse" class="control-label">遥控站</label>
					</div>
					<div class="col-sm-2">
						<!-- 这个部分应该是用于展示所有遥控站的下拉列表的，要去数据库中查询 
				           查询获得数据的工作交给ajax
				-->
						<select class="form-control select2" id="querystationdevhouseid"
							name="stationdevhouse">
						</select>
					</div>
					<!--  	<div class="col-sm-2" style="width: 60px">
					<label for="funtype" class="control-label">功能</label>
				</div>
				<div class="col-sm-1" style="width: 130px">
					<select class="form-control select2" id="queryfuntypeid" name="funtype">
						<option value="-1">全部</option>
						<option value="0">综合站</option>
						<option value="1">C波段</option>
						<option value="2">短波</option>
						<option value="3">铁路</option>
						<option value="4">航空</option>
					</select>
				</div>
			-->


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

		<!--表格-->
		<table id="dataTable"
			class="table table-striped table-bordered table-hover table-condensed"
			align="center">
			<thead>
				<tr class="info">
					<td><input type="checkbox" id="checkAll"></td>
					<!--  <th></th> -->
					<th>序号</th>
					<th>系统名称</th>
					<th>类别</th>
					<th>功能</th>
					<th>主供应商</th>
					<th>责任人</th>
					<!-- <th>信息管理</th> -->
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>

		<!-- 
        市州——下拉列表（所属的部门）去数据库中获取
        遥控站——下拉列表（所属的遥控站）去数据库中获取
        系统名称：输入框
        系统类别：去数据库中获取
        系统功能：文本框
        主要供应商：数据库中获取
        责任人：数据库中获取
     -->
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
									<h5>基本信息:</h5>
								</div>

							</div>
							<div class="panel panel-default" id="panel1">
								<div class="panel-body">
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">市州</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="depid" id="depid">
											</select>
										</div>
										<label for="inputName" class="col-sm-2 control-label">遥控站</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="rchouseid"
												id="rchouseid">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">系统名称</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="name" id="name"
												placeholder="请输入系统名称">
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">系统类别</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="type" id="type">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">系统功能</label>
										<div class="col-sm-4">
											<textarea class="form-control" rows="3" name="funlist"
												id="funlist" placeholder="请输入遥控站的功能"></textarea>
										</div>
									</div>

									<div class="form-group">
										<!-- panel的最后一排加入这个style  -->
										<label for="inputName" class="col-sm-2 control-label">主供应商</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="mainenterpriseid"
												id="mainenterpriseid">
											</select>
										</div>
									</div>
									<div class="form-group" style="margin-bottom:-15px;">
										<!-- panel的最后一排加入这个style  -->
										<label for="inputName" class="col-sm-2 control-label">责任人</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="managerid"
												id="managerid">
											</select>
										</div>
									</div>
								</div>
							</div>
							<!-- name="panel1" -->

							<div class="modal-footer">
								<button type="button" id="btn-cancel" class="btn btn-default"
									data-btn-type="cancel">
									<i class="fa fa-reply">&nbsp;取消</i>
								</button>
								<button type="submit" id="btn-submit" class="btn btn-primary">
									<i class="fa fa-save">&nbsp;保存</i>
								</button>
								<!-- <button type="submit" id="btn-submit" class="btn btn-primary">确认</button> -->
							</div>
						</form>
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
<%-- <script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script> --%>


<script type="text/javascript">
	/* https://www.cnblogs.com/softwarefang/p/6094174.html */
	//toastr.options.positionClass = 'toast-bottom-right';
	toastr.options = {  
			closeButton: false,  
			debug: false,  
			progressBar: true,  
			positionClass: "toast-top-center",  
			onclick: null,  
			showDuration: "300",  
			hideDuration: "1000",  
			timeOut: "1000",  
			extendedTimeOut: "500",  
			showEasing: "swing",  
			hideEasing: "linear",  
			showMethod: "fadeIn",  
			hideMethod: "fadeOut"  
		}; 
	$.fn.datetimepicker.dates['zh'] = {  
                days:       ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"],  
                daysShort:  ["日", "一", "二", "三", "四", "五", "六","日"],  
                daysMin:    ["日", "一", "二", "三", "四", "五", "六","日"],  
                months:     ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月","十二月"],  
                monthsShort:  ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],  
                meridiem:    ["上午", "下午"],  
                //suffix:      ["st", "nd", "rd", "th"],  
                today:       "今天"  
        };  	
	var date = new Date();
	$('.date').datetimepicker({
		language:'zh-cn',  
		minView: "month",
		format:'yyyy-mm-dd hh:ii:ss', 
		/* format:'yyyy-mm-dd', */
		startDate:date,
		todayBtn:true,
		autoclose: 1
	});
	
	$(".select2").select2({
		tags:true,
		createTag:function (decorated, params) {
			return null;
		},
		width:'100%'
	}); 
	
</script>
<script>
	var form = null;
	var querydata = [];
	var restr = $('#querystr').val(); //有跳转，跳转回来的时候用
	//querydata.querystring = "type:" + 0;
	querydata.querystring = "";
	if (null != restr) {
		querydata.querystring = restr;
		//解析restr 设置查询条件 projecttype_id:1,projectstate:1,name:
		//alert(restr);

		var name = "";
		//var type = null;
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

		sel.bindselectTheAll('queryowerdepid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name');
		sel.bindselectTheAll('querystationdevhouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name');

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
				//获取后台关于遥控站配套系统的相关信息（与bdevsystem表的数据相关）
				url : "<%=request.getContextPath()%>/rest/devsystem/devsystemvodataGrid",
				dataSrc : "data",

				dataType : 'json',
				data : querydata //似乎querydata必须是对象，draw等参数才会被带过去
			},
			columns : [ //对应上面thead里面的序列
				{
					"data" : "null"
				}, //复选框
				{
					"data" : "id"
				}, //编号
				{
					"data" : "name"
				}, //配套系统名称
				{
					"data" : 'typename', //配套系统类别
				},
				{
					"data" : 'funlist'
				}, //配套系统功能
				{
					"data" : 'enterprisename'
				}, //配套系统的主要供应商
				{
					"data" : 'username'
				}, //配套系统的主要负责人         
				{
					"data" : 'columnDefs'
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
			//获取所在部门的id
			var depid = $("#queryowerdepid").val();
			querydata.querystring = querydata.querystring + ",depid:" + depid;
			//获取遥控站的id
			var stationdevhouseid = $("#querystationdevhouseid").val();
			querydata.querystring = querydata.querystring + ",stationdevhouseid:" + stationdevhouseid;

			//输入框中的内容
			var name = $("#keyword").val();
			querydata.querystring = querydata.querystring + ",name:" + name;

			var oSettings = tables.fnSettings();
			oSettings.ajax.data = querydata;
			//依然走的是/devsystem/devsystemvodataGrid这个路径
			//但是此时的querystring是带上了条件的（查询条件）
			tables.api().ajax.reload();
			tables.fnDraw(); //查询后不需要保持分页状态，回首页
		});

		//为选中的遥控站添加一个配套系统
		//但是还是用的修改界面的弹窗，
		//修改需要显示数据，而添加不需要显示数据
		//所以添加数据的逻辑相对来说更为简单
		$("#btn-add").on("click", function() {
			sel.bindselectfirst('depid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name');
			sel.bindselectfirst('rchouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name');
			sel.bindselectfirst('type', "<%=request.getContextPath()%>/rest/dic/selectSystemTypeList", 'id', 'name');
			//供应商下拉列表的实现
			sel.bindselectfirst('mainenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name');
			//责任人下拉列表的实现
			sel.bindselectfirst('managerid', "<%=request.getContextPath()%>/rest/user/userList", 'id', 'name');
			//添加配套系统时的controller的url
			url = "<%=request.getContextPath()%>/rest/devsystem/insertdevsystem";
			$("input[name=name]").val("");
			$("textarea[name=funlist]").val("");
			$("#myModalLabel").html("<b>遥控站配套系统录入</b>");
			$("#editModal").modal("show");
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
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
			enterprisesIds = JSON.stringify(check_val);
			url = "<%=request.getContextPath()%>/rest/devsystem/deletedevsystemBatch";
			$.ajax({
				url : url,
				type : 'post',
				dataType : "json",
				cache : "false",
				data : enterprisesIds,
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

		//报表打印打印
		function openDownloadDialog(url, saveName) {
			if (typeof url == 'object' && url instanceof Blob) {
				url = URL.createObjectURL(url); // 创建blob地址
			}
			var aLink = document.createElement('a');
			aLink.href = url;
			aLink.download = saveName || ''; // HTML5新增的属性，指定保存文件名，可以不要后缀，注意，file:///模式下不会生效
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
			// 生成excel的配置项
			var wopts = {
				bookType : 'xlsx', // 要生成的文件类型
				bookSST : false, // 是否生成Shared String Table，官方解释是，如果开启生成速度会下降，但在低版本IOS设备上有更好的兼容性
				type : 'binary'
			};
			var wbout = XLSX.write(workbook, wopts);
			var blob = new Blob([ s2ab(wbout) ], {
				type : "application/octet-stream"
			});
			// 字符串转ArrayBuffer
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
			$("#btn-export").attr("disabled", true);
			var tableDom = document.getElementById("dataTable"); //只能导出当前分页，以后最好是由后台直接返回json
			var sheet = XLSX.utils.table_to_sheet(tableDom);
			var titlte = "遥控站清单" + ".xlsx";
			openDownloadDialog(sheet2blob(sheet), titlte);
			setInterval(function() {
				$("#btn-export").attr("disabled", false);
			}, 2000);
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
			alert(JSON.stringify(data));
			$("input[name=id]").val(data.id);
			$("input[name=name]").val(data.name)
			//binddata是在当需要将数据回显给表单时用的方法
			//供应商下拉列表的实现
			sel.binddata('depid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name', data.depid)
			sel.binddata('rchouseid', "<%=request.getContextPath()%>/rest/remotestation/getstationdevhouselist", 'id', 'name', data.rchouseid)
			sel.binddata('type', "<%=request.getContextPath()%>/rest/dic/selectSystemTypeList", 'id', 'name', data.type);
			sel.binddata('mainenterpriseid', "<%=request.getContextPath()%>/rest/benterprise/getenterpriselist", 'id', 'name', data.mainenterpriseid);
			//责任人下拉列表的回显
			sel.binddata('managerid', "<%=request.getContextPath()%>/rest/user/userList", 'id', 'name', data.managerid)
			//系统功能文本框内容的回显
			$("textarea[name=funlist]").val(data.funlist);

			//修改操作时controller的url
			url = "<%=request.getContextPath()%>/rest/devsystem/updateOnedevsystemValue";

			$("#myModalLabel").html("<b>修改遥控站信息</b>");
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
					name : {
						validators : {
							notEmpty : {
								message : '请输入名称'
							}
						}
					},
					code : {
						validators : {
							notEmpty : {
								message : '请输入遥控站编号'
							}
						}
					}
				} /* end field */
			}).on("success.form.bv", function(e) {
				e.preventDefault(); //防止重复提交						
			}); /* end $('#editForm').bootstrapValidator */
		}

		$("#btn-submit").on("click", function() {
			$("#editForm").bootstrapValidator('validate'); //提交验证
			if ($("#editForm").data('bootstrapValidator').isValid()) { //获取验证结果，如果成功，执行下面代码
				//alert("yes"); //验证成功后的操作，如ajax
				if (confirm("确定提交么？")) {
					var params = form.getFormSimpleData();
					alert(JSON.stringify(params));
					//此处的data保存了操作的返回值		
					ajaxPost(url, params, function(data, status) {
						if (data.success) {
							tables.fnDraw(false); //刷新保持分页状态 false重新加载当前页，true重新加载初始状态
							$("#editModal").modal("hide");
							toastr.success("保存成功！");
						} else {
							toastr.error("保存失败");
						}
						;
					});
				}
			}

			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();

		});
		$("#btn-cancel").on("click", function() {
			$("#editModal").modal("hide");
		});
		//删除
		$("#dataTable tbody").on("click", "#delRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			if (confirm("是否确认删除这条信息?")) {
				$.ajax({
					url : "<%=request.getContextPath()%>/rest/devsystem/deletedevsystem",
					type : 'post',
					dataType : "json",
					cache : "false",
					data : data,
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
	});

	function ShowDepart() {
		$("#modal-Department").modal("show");
	}
</script>
