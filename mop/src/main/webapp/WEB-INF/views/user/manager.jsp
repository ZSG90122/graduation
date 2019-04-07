<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>侧边栏</title>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/AllPagesStyle/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
</head>
<body style="overflow: hidden" class="sidebar-mini">
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
					<div class="col-xs-2">
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
					<th><input id="checkAll" type='checkbox'>全选</th>
					<th>序号</th>
					<!-- <th>ID</th> -->
					<th>用户</th>
					<th>姓名</th>
					<th>电话</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>

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
						<form id="form_login" action="" method="post">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group has-feedback">
										<input type="text" name="jg_login_user" id="add_loginname"
											class="form-control" placeholder="登录名"> <span
											class="glyphicon  glyphicon-user form-control-feedback"></span>
									</div>
									<div class="form-group has-feedback">
										<input type="text" name="jg_login_name" id="add_name"
											class="form-control" placeholder="用户姓名"> <span
											class="glyphicon glyphicon-user form-control-feedback"></span>
									</div>
									<div class="form-group has-feedback">
										<input type="password" name="jg_login_pwd" id="add_password"
											class="form-control" placeholder="密码"> <span
											class="glyphicon glyphicon-lock form-control-feedback"></span>
									</div>
									<div class="form-group has-feedback">
										<input type="password" id="toPassword" name="jg_login_repwd"
											class="form-control" placeholder="确认密码"> <span
											class="glyphicon glyphicon-lock form-control-feedback"></span>
									</div>
									<div class="form-group text-center" id="wrap">
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio1" value="0" checked>
											男
										</label> <label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="1">
											女
										</label> <input style="width: 40px;margin-left: 10px;" type="text"
											id="age" name="jg_login_age" placeholder="年龄">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group has-feedback">
										<input type="text" name="jg_login_phone" id="phone"
											class="form-control" placeholder="电话"> <span
											class="glyphicon glyphicon-phone form-control-feedback"></span>
									</div>
									<div class="form-group has-feedback">
										<input type="text" id="address" class="form-control"
											placeholder="地址"> <span
											class="glyphicon glyphicon-send form-control-feedback"></span>
									</div>
									<div class="form-group has-feedback">
										<input type="text" id="image" class="form-control"
											placeholder="头像"> <span
											class="glyphicon glyphicon-sunglasses form-control-feedback"></span>
									</div>

									<!--由于在user表中把organization_id换成站的范围 所以组织模块暂时删除-->
									<div class="form-group mySelect form-inline">
									<label for="select_one_2">角色</label> <select
											class="form-control" id="select_one_2">
										</select>
										<label for="select_one_1">管理区域</label> <select class="form-control"
											id="select_one_1">
										</select>
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

		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only"></span>
						</button>
						<h4 class="modal-title" id="myModalLabel">信息修改/分配管辖区域和角色</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" id="editForm" action=""
							method="post">
							<input type="hidden" class="form-control" name="areaId">
							<div class="login-box-body">
								<form id="form_login" action="" method="post">
									<div class="row">
										<div class="col-md-offset-3 col-md-6">
											<div class="form-group has-feedback">
												<input type="text" style="display: none;" id="user_id">
												登录名:<input type="text" name="jg_login_user" id="login_name"
													class="form-control"> <span
													class="glyphicon  glyphicon-user form-control-feedback"
													style="margin-top: 20px;"></span>
											</div>
											<div class="form-group has-feedback">
												用户名：<input type="text" name="jg_login_name" id="name"
													class="form-control"> <span
													style="margin-top: 20px;"
													class="glyphicon glyphicon-user form-control-feedback"></span>
											</div>
											<div class="form-group mySelect">
												管辖区域： <select class="form-control" id="select1">
												</select>&nbsp;&nbsp;&nbsp;&nbsp;角色： <select class="form-control"
													id="select2">
												</select>
											</div>
										</div>
									</div>
								</form>
							</div>
							<!-- /.login-box-body -->
						</form>
					</div>
					<!-- modal-body END -->

					<div class="modal-footer">
						<button type="button" id="btn-submit" class="btn btn-primary">确认</button>
					</div>
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
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script>
	$(function() {
		//添加、修改异步提交地址
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
				url : "<%=request.getContextPath()%>/rest/user/dataGrid",
				dataSrc : "data",
				dataType : 'json',
				//                data: function (d) {
				//                    var param = {};
				//                    param.draw = d.draw;
				//                    param.start = d.start;
				//                    param.length = d.length;
				//                    var formData = $("#queryForm").serializeArray();//把form里面的数据序列化成数组
				//                    formData.forEach(function (e) {
				//                        param[e.name] = e.value;
				//                    });
				//                    return param;//自定义需要传递的参数。
				//                }
				//            },
				data : function(d) {
					alert(JSON.stringify(d));
				}
			},
			columns : [ //对应上面thead里面的序列
				{
					"data" : "null"
				},
				{
					"data" : 'id'
				},
			/* 	{
					"data" : 'id'
				}, */
				{
					"data" : 'loginName'
				},
				{
					"data" : 'name'
				},
				{
					"data" : 'phone'
				},
				{
					"data" : 'createTime'
				},
				{
					"data" : 'columnDefs'
				},
				//                {
				//                    "data": 'createTime',
				//                    "render": function (data, type, full, callback) {
				//                        return data.substr(0, 19)
				//                    }
				//                },
				//                {
				//                    "data": 'updateTime', defaultContent: "",
				//                    "render": function (data, type, full, callback) {
				//                        if (data != null && data != "") {
				//                            return data.substr(0, 19)
				//                        } else {
				//                            return data;
				//                        }
				//                    }
				//                },
				//                {"data": null, "width": "60px"},

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

		//查询按钮
		$("#btn-query").on("click", function() {
			tables.fnDraw(); //查询后不需要保持分页状态，回首页
		});

		//添加前的数据填充
		$("#btn-add").on("click", function() {
			$.post('<%=request.getContextPath()%>/rest/user/getAllRolesAndAreaInfo',
					function(result){
				//填充数据之前先清理上一时刻数据
				$("#select_one_1").children().remove();
				$("#select_one_2").children().remove();
				$("#select_one_1").append(fallSelectInfo(1,result.sysAreaGroup));
				$("#select_one_2").append(fallSelectInfo(1,result.roles));
			})
			$("#addModal").modal("show");
		});
		//批量删除
		$("#btn-delAll").on("click", function() {
			var checkList_id=new Array();
			var checkList=$("input[name='checkList']:checked");
			for(var i=0;i<checkList.length;i++){
				var data = tables.api().row($(checkList.eq(i)).parents("tr")).data();
				checkList_id[i]=parseInt(data.id);
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
			console.log(JSON.stringify(data) + "=====================");
			//这里提交表单 查询基础信息 
			$.post('<%=request.getContextPath()%>/rest/user/getAllRolesAndAreaInfo', function(result) {
				//数据的显示
				$("#user_id").val(data.id);
				$("#login_name").val(data.loginName)
				$("#name").val(data.name);
				var organizationId = data.organizationId;
				var role_id = data.rolesList[0].id;
				//填充数据之前先清理上一时刻数据
				$("#select1").children().remove();
				$("#select2").children().remove();
				//下拉列表的数据填充
				$("#select1").append(fallSelectInfo(organizationId, result.sysAreaGroup));
				$("#select2").append(fallSelectInfo(role_id, result.roles));

			})
			$("#editModal").modal("show");
		});
		//下拉列表的数据填充函数
		function fallSelectInfo(index, obj) {
			//一：遍历数组  二：判断id是否相同 相同则选择
			var str = "";
			for (var i = 0; i < obj.length; i++) {
				if (index == obj[i].id) {
					str = str + "<option selected=\"selected\" value=\"" + eval(obj[i].id) + "\">" + obj[i].name + "</option>";
				} else {
					str = str + "<option value=\"" + eval(obj[i].id) + "\">" + obj[i].name + "</option>";
				}

			}
			console.log(str);
			return str;
		}
		//超级用户提交修改信息
		$("#btn-submit").on("click", function() {
			var data = {
				id : $("#user_id").val(),
				loginName : $("#login_name").val(),
				name : $("#name").val(),
				organizationId : $("#select1 option:selected").val(),
				roleIds : $("#select2 option:selected").val()
			}
			//更新数据
			$.post('<%=request.getContextPath()%>/rest/user/updateUserInfoBySuper', data, function(result) {
				if (result.msg == "更新成功") {
					alert(result.msg);
					history.go(0);
				} else {
					alert(result.msg);
				}
			})
		});

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
							history.go(0);
						} else {
							alert(result.msg);
						}
					}
				});
			}
		});

//添加用户信息的验证
//验证数据
$('#form_login').bootstrapValidator({
     fields: {
         /*验证*/
         jg_login_user: {
             /*键名username和input name值对应*/
             message: '用户验证失败',
             validators: {
                 notEmpty: {
                     /*非空提示*/
                     message: '用户名不能为空'
                 },
                 regexp: {
                     /* 只需加此键值对，包含正则表达式，和提示 */
                     regexp: /[a-zA-Z0-9_]{2,16}/ ,
                     message: '请正确输入您的登录名'
                 }
             }
         },
         jg_login_name: {
             /*键名username和input name值对应*/
             message: '用户验证失败',
             validators: {
                 notEmpty: {
                     /*非空提示*/
                     message: '用户名不能为空'
                 },
                 regexp: {
                     /* 只需加此键值对，包含正则表达式，和提示 */
                     regexp: /[a-zA-Z0-9_]{2,16}/ ,
                     message: '请正确输入您的用户名'
                 }
             }
         },
         jg_login_pwd: {
             message: '密码无效',
             validators: {
                 notEmpty: {
                     message: '密码不能为空'
                 },
                 stringLength: {
                     min: 6,
                     max: 30,
                     message: '密码长度必须在6到30之间'
                 }
             }
         },
         jg_login_repwd: {
             message: '密码无效',
             validators: {
                 notEmpty: {
                     message: '密码不能为空'
                 },
                 stringLength: {
                     min: 6,
                     max: 30,
                     message: '密码长度必须在6到30之间'
                 }
             }
         },
         jg_login_phone: {
             message: '电话格式错误',
             validators: {
                 notEmpty: {
                     /*非空提示*/
                     message: '电话不能为空'
                 },
                 regexp: {
                     /* 只需加此键值对，包含正则表达式，和提示 */
                     regexp: /^1[34578]\d{9}$/,
                     message: '请正确输入您的电话号码'
                 }
             }
         },
         jg_login_age: {
             message: '年龄错误',
             validators: {
                 notEmpty: {
                     /*非空提示*/
                     message: '年龄不能为空'
                 },
                 regexp: {
                     /* 只需加此键值对，包含正则表达式，和提示 */
                     regexp: /100|((1[0-1]|\d)?\d)/,
                     message: '请正确输入您的年龄'
                 }
             }
         }
     } //验证内容
 }).on('success.form.bv', function (e) {
 	e.preventDefault();
     var $form = $(e.target);
     var bv = $form.data('bootstrapValidator');
//装填数据
var  date = {
 loginName: $("#add_loginname").val(),
 name: $("#add_name").val(),
 password: $("#add_password").val(),
 sex:  $('#wrap input[name="inlineRadioOptions"]:checked ').val(),
 age:  $("#age").val(),
 phone:  $("#phone").val(),
 address:  $("#address").val(),
 image:  $("#image").val(),
 userType:"1",
 organizationId:$("#select_one_1 option:selected").val(),
 roleIds:$("#select_one_2 option:selected").val(),
 status:"0"
}
console.log(date);
//这里提交表单
$.post('<%=request.getContextPath()%>/rest/user/addUser',date, function (result) {
	alert(result.msg);
	if (result.msg == "注册成功") {
		history.go(0);
		}else{
			alert(result.msg);
		}
});
})
 }); 
</script>
