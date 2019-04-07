<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>角色权限管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.css">
    
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script> 
	<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="row">
					<div class="col-sm-3">
						<h2>角色权限管理</h2>
					</div>
				</div>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-5">
						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<table id="dataTable"
							class="table table-striped table-bordered table-hover table-condensed"
							align="center">
							<thead>
								<tr class="info">
									<th style="text-align: center;">选择</th>
									<th style="text-align: center;">序号</th>
									<th style="text-align: center;">角色</th>
									<th style="text-align: center;">描述</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="row-fluid">
							<!-- <div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-add">
										<i class="fa fa-plus"></i>添加
									</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-delAll">
										<i class="fa fa-remove"></i>删除
									</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-export">
										<i class="fa fa-sign-in"></i> 导出
									</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="btn-re">
										<i class="fa fa-refresh"></i>刷新
									</button>
								</div>
							</div> -->

							<!-- <div class="row">
								<form id="queryForm" action="" method="post"
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
							</div> -->
						</div>
						<!--表格-->
						<!-- <table id="dataTable"
							class="table table-striped table-bordered table-hover table-condensed"
							align="center">
							<thead>
								<tr class="info">
									<th><input id="checkAll" type='checkbox'>全选</th>
									<th>序号</th>
									<th>模块名称</th>
									<th>URL</th>
									
								</tr>
							</thead>
							<tbody></tbody>
						</table> -->
						
						<div class="box-body box-profile">
							<div id="authortree"></div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
	</div>

</body>
</html>

<script language="javascript">

var selectroleid = null;

$(function() {
	
	
	var roledatatables = $("#dataTable").dataTable({
			paging: false, // 禁止分页
            serverSide: false,//分页，取数据等等的都放到服务端去
            //processing: true,//载入数据的时候是否显示“载入中”
            //pageLength: 10,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            pagingType: "full_numbers",
            autoWidth: false,
            stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索
            ajax: {
                type: "post",
                url: "<%=request.getContextPath()%>/rest/department/roleGrid",
                dataSrc: "data",
                
                dataType:'json',
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
                data: function(){
					
                }
            },
            /*  "createdRow": function (row, data, index) {
                // 设置表格中的内容居中 
                $('td', row).attr("class", "text-center");
            }, */
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": 'name'},
				 {"data": 'description'}
            ],

			//操作按钮
            columnDefs: [
                {
                    targets: 0,
                    defaultContent: "<input type='radio' name='radioList'>"
                }
            ],
            language: {
                lengthMenu: "",
                processing: "",
                paginate: {
                    previous: "<",
                    next: ">",
                    first: "<<",
                    last: ">>"
                },
                zeroRecords: "",
                info: "",
                infoEmpty: "",
                infoFiltered: "",
                sSearch: "",
            },
			//在每次table被draw完后回调函数
            fnDrawCallback: function () {
                var api = this.api();
				//获取到本页开始的条数
                var startIndex = api.context[0]._iDisplayStart;
                api.column(1).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            }
        });
       var table = $('#dataTable').DataTable();
       
        $("#dataTable tbody").on('click', 'tr', function() {
            var data = table.row(this).data();
            var deledata = new Object();
        	deledata.roleId = data.id;
        	selectroleid = data.id;
            $.ajax({
				url: "<%=request.getContextPath()%>/rest/department/roleResouce",
				type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:deledata,
                    success: function (data) {
                         //alert(JSON.stringify(data));
                         initTree(0,data);
                         /* for (i=0;i<data.length;i++){
                         	$("#authortree").treeview('checkNode', data[i].resourceId, {
                    			silent : true
                			});
                         } */
                        
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
           });
        });
});
	var silentByChild = true;
	function initTree(selectNodeId,rolesoucedata) {
		var treeData = null;
		var state = new Array();
		state['checked'] = true;
		ajaxPost("<%=request.getContextPath()%>/rest/resource/tree", null, function(myjson) {
			var menus = []
			for (i = 0; i < myjson.length; i++) {
				if (myjson[i].pid == null) {
					var menu=null
					if (isContain(rolesoucedata,myjson[i].id)){		
						menu = {
						id : myjson[i].id,
						text : myjson[i].text,
						icon : myjson[i].iconCls,
						nodes : [],
						state:state
						}
					}else{
						menu = {
						id : myjson[i].id,
						text : myjson[i].text,
						icon : myjson[i].iconCls,
						nodes : []
						}
					}
					menus.push(menu)
				}
			}
			for (i = 0; i < myjson.length; i++) {
				if (myjson[i].pid != null) {
					var menu=null;
					if (isContain(rolesoucedata,myjson[i].id)){						
						menu = {
							id : myjson[i].id,
							text : myjson[i].text,
							icon : myjson[i].iconCls,
							url : myjson[i].attributes,
							targetType : myjson[i].targetType,
							state:state
						}
					}else{
					 	menu = {
							id : myjson[i].id,
							text : myjson[i].text,
							icon : myjson[i].iconCls,
							url : myjson[i].attributes,
							targetType : myjson[i].targetType
						}
					}
					for (j = 0; j < menus.length; j++) {
						if (menus[j].id == myjson[i].pid) {
							menus[j].nodes.push(menu)
						}
					}
				}
			}

			treeData = menus;
		//console.log(JSON.stringify(treeData));
		//alert(JSON.stringify(treeData));
		});
		$("#authortree").treeview({
			data : treeData,
			showBorder : true,
			expandIcon : "glyphicon glyphicon-stop",
			collapseIcon : "glyphicon glyphicon-unchecked",
			levels : 1,
			multiSelect : false, // 不允许多选，因为我们要通过check框来控制
			showCheckbox : true, // 展示checkbox
			onNodeSelected : function(event, data) {
				//fillDictForm(data);
				//formReadonly();
				//console.log(JSON.stringify(data));
			},
			onNodeChecked : function(event, node) {
				// 一级节点被选中，那么二级节点都要选中
				//alert(node.id);				
				if (node.nodes != null) { //有子节点
					$.each(node.nodes, function(index, value) {
						$("#authortree").treeview('checkNode', value.nodeId, {
							silent : true
						});
					});
				} else {					
					// 二级节点选中的时候，要根据情况判断父节点是否要全部选中
					// 父节点
					var parentNode = $("#authortree").treeview('getParent', node.nodeId);
					addroleresouce(selectroleid,node.id);
					addroleresouce(selectroleid,parentNode.id);					
					var isAllchecked = true; // 是否全部选中
					// 当前二级节点的所有兄弟节点，也就是获取一级下面的所有二级
					var siblings = $("#authortree").treeview('getSiblings', node.nodeId);					
					for (var i in siblings) {
						// 有一个没选中，则不是全选						
						if (!siblings[i].state.checked) {
							isAllchecked = false;
							break;
						}
						//alert(JSON.stringify(siblings[i]));
					}
					// 全选，则打钩
					if (isAllchecked) {
						$("#authortree").treeview('checkNode', parentNode.nodeId, {
							silent : true
						});
					} else { // 非全选，则变红
						$("#authortree").treeview('selectNode', parentNode.nodeId, {
							silent : true
						});
					}
				}
			},
			onNodeUnchecked : function(event, node) {
				// 选中的是一级节点
				delroleresouce(selectroleid,node.id);
				if (node.nodes != null) {
					// 这里需要控制，判断是否是因为二级节点引起的父节点被取消选中
					// 如果是，则只管取消父节点就行了
					// 如果不是，则子节点需要被取消选中
					if (silentByChild) {
						$.each(node.nodes, function(index, value) {
							$("#authortree").treeview('uncheckNode', value.nodeId, {
								silent : true
							});
						});
					}
				} else {
					// 二级节点被取消选中
					var parentNode = $("#authortree").treeview('getParent', node.nodeId);
					var isAllUnchecked = true; // 是否全部取消选中
					// 二级节点有一个选中，那么就不是全部取消选中
					var siblings = $("#authortree").treeview('getSiblings', node.nodeId);
					for (var i in siblings) {
						if (siblings[i].state.checked) {
							isAllUnchecked = false;
							break;
						}
					}
					// 全部取消选中，那么一级节点恢复到默认状态
					if (isAllUnchecked) {
						$("#authortree").treeview('unselectNode', parentNode.nodeId, {
							silent : true,
						});
						$("#authortree").treeview('uncheckNode', parentNode.nodeId, {
							silent : true,
						});
					} else {
						silentByChild = false;
						$("#authortree").treeview('selectNode', parentNode.nodeId, {
							silent : true,
						});
						$("#authortree").treeview('uncheckNode', parentNode.nodeId, {
							silent : true,
						});
					}
				}
				silentByChild = true;
			}
		});

		if (treeData.length == 0)
			return;
		//默认选中第一个节点
		selectNodeId = selectNodeId || 0;
		$("#authortree").data('treeview').selectNode(selectNodeId);
		$("#authortree").data('treeview').expandNode(selectNodeId);
		$("#authortree").data('treeview').revealNode(selectNodeId);


	}; //initTree
	
	function isContain(data,id)
	{
		for (k=0;k<data.length;k++){
			if (data[k].resourceId == id){
				return true;
			}
		}
		return false;
	};
	
	function addroleresouce(roleid,souceid)
	{
		var deledata = new Object();
        	deledata.roleid = roleid;
        	deledata.souceid = souceid;
            $.ajax({
				url: "<%=request.getContextPath()%>/rest/department/saveroleResouce",
				type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:deledata,
                    success: function (data) {
                         toastr.success('成功！');
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
           });
	}
	function delroleresouce(roleid,souceid)
	{
		var deledata = new Object();
        	deledata.roleid = roleid;
        	deledata.souceid = souceid;
            $.ajax({
				url: "<%=request.getContextPath()%>/rest/department/deleteroleResouce",
				type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:deledata,
                    success: function (data) {
                         toastr.success('删除成功！');                        
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
           });
	}
</script>