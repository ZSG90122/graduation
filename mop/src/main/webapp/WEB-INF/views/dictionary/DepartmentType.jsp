<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>工程单位管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
</head>
<!-- <body style="overflow: hidden" class="sidebar-mini"> -->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div style="margin:30px 0px 20px 50px;">
	<div class="row">
            <form id="queryForm" action="" method="post">
                    <div class="col-sm-3">
			        	<select class="form-control" id="sle">
			        	   <option value="0"  hidden>工程单位</option>
				           <option value="1">设备系统类型</option>
				           <option value="2">设备类型</option>
				           <option value="3">运维类型</option>
				           <option value="4">工程单位</option>
				           <option value="5">项目来源</option>
				           <option value="6">质检与复核单位</option>
				           <option value="7">消息类型</option>
				           <option value="8">地点列表</option>
				           <!-- <option value="9">工程状态</option> -->
				           <option value="10">工程存在问题</option>
				           <option value="11">标段内容</option>
				           <option value="12">飞机类别</option>
				           <option value="13">机场部队类别</option>
			         	</select>
			         	
			        </div>
                <button type="button" class="btn btn-primary btn-sm" id="btn-query">确定</button>
            </form>
        </div>
    </div>
	</div>
	
<div class="box" style="margin-top: 0px;">
<!-- 查询、添加、批量删除、导出、刷新 -->
<div class="content">
	<div class="box-header with-border">
       <h5 class="box-title">工程单位</h5>
       <!-- <a type="button" class="btn btn-flickr  pull-right" style="margin-right: 50px;" id="btn-update">更改</a> -->
       <!-- <a type="button" class="btn btn-success   pull-right" style="margin-right: 30px;" id="btn-add">添加</a> -->
       <div class="pull-right" style="margin-right: 50px;">
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm" id="btn-add">
                    <i class="fa fa-plus"></i> 添加
                </button>
            </div>
        </div>
    </div>
    <!-- 查询、添加、批量删除、导出、刷新 -->
    <div class="row-fluid">
    <!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed" align="center">
        <thead style="margin-top: 0px;">
        <tr class="info">
            <th width="1%" style="text-align:center"><input type="checkbox" id="checkAll">全选</th>
           <!--  <th></th> -->
            <th width="1%" style="text-align:center">序号</th>
            <!-- <th width="1%" style="text-align:center">ID</th> -->
            <th width="5%" style="text-align:center">工程单位</th>
            <th width="5%" style="text-align:center">备注信息</th>
            <th width="5%" style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>

    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">工程单位信息：</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal"  id="editForm" action="" method="post">
                        <input type="hidden" class="form-control" name="tbId" id='tbId'>
                        
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">工程单位</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">备注信息</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="remark">
                            </div>                     
                        </div>
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
</div>
</body>
</html>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/fastclick/fastclick.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/app.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/demo.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-treeview.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script 
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
		
<script>	
/* 确定按钮点击事件 */
       $("#btn-query").on("click", function () {
		  //首先获得下拉框的节点对象；
		    var select = document.getElementById("sle");
		     //2.如何获得当前选中的value值：
		     var value = select.value;
		     if(value == 1){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/devsystemType';
		     }else if(value == 2){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/devtype';
		     }else if(value == 3){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/maintaintype';
		     }else if(value == 4){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/departmentType';
		     }else if(value == 5){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/source';
		     }else if(value == 6){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/checkType';
		     }else if(value == 7){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/message';
		     }else if(value == 8){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/addressList';
		     }<%-- else if(value == 9){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/projectStatus';
		     } --%>else if(value == 10){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/projectProblem';
		     }else if(value == 11){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/bidContent';
		     }else if(value == 12){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/planeType';
		     }else if(value == 13){
		     	window.location.href = '<%=request.getContextPath()%>/rest/dic/planeMilType';
		     }         
        }); 
	
	
	var form = null;
    $(function () {
    	form=$('#editForm').form();
    	
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
            serverSide: true,//分页，取数据等等的都放到服务端去
            //processing: true,//载入数据的时候是否显示“载入中”
            pageLength: 10,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            pagingType: "full_numbers",
            autoWidth: false,
            stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索  
            ajax: {
                type: "post",
                url: "<%=request.getContextPath()%>/rest/dic/dataDepartmentType",
                dataSrc: "data",
                dataType:'json',
                data: function(){
					
                }
            },
            "createdRow": function (row, data, index) {
                // 设置表格中的内容居中 
                $('td', row).attr("class", "text-center");
            },
            columns: [//对应上面thead里面的序列
				{"data": "null"},
                {"data": "id"},
                /* {"data": "id"}, */
                {"data": "name"},
                {"data": 'remark'},
                {"data": 'columnDefs'},

            ],

			//操作按钮
            columnDefs: [
                {
                    targets: 0,
                    defaultContent: "<input type='checkbox' name='checkList'>"
                },
                {
                    targets: -1,
                    defaultContent: str
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

         //添加
        $("#btn-add").on("click", function () {
        	$("input[name=id]").val("");
            $("input[name=name]").val("");
            $("input[name=remark]").val("");
            $("#editModal").modal("show");
        });
        //修改
		$("#dataTable tbody").on("click", "#editRow", function() {
			var data = tables.api().row($(this).parents("tr")).data();
			$("input[name=id]").val(data.id);
            $("input[name=name]").val(data.name);
            $("input[name=remark]").val(data.remark);
            $("#editModal").modal("show");
		});
        //添加和修改时，保存按钮的事件
        $("#btn-submit").on("click", function () {
 				var dataform=$('#editForm').form();
 				var params = dataform.getFormSimpleData();
 				params.level = 0;
 				/* alert($("#aceiveUserid").val()); */
 				$.ajax({
 				url : "<%=request.getContextPath()%>/rest/dic/updateDepartmentType", 
 				type : 'post',
 				cache : "false",
 				data : params, //
 				dataType : "json",
 				success : function(data) {
 					if (data.success) {
 						//刷新列表
 						toastr.success('保存成功！' + JSON.stringify(data));
 					} else {
 						toastr.error('保存失败！' + JSON.stringify(data));
 					}
 					//刷新页
 					
 					tables.fnDraw();
 				},
 				error : function(err) {
 					toastr.error("Server Connection Error<%=request.getContextPath()%>.");
 				}
 				
 			});
 			window.location.reload();
 		});
        
		//checkbox全选
        $("#checkAll").on("click", function () {
            if ($(this).prop("checked") === true) {
                $("input[name='checkList']").prop("checked", $(this).prop("checked"));
                $("#dataTable tbody tr").addClass('selected');
                $(this).hasClass('selected')
            } else {
                $("input[name='checkList']").prop("checked", false);
                $("#dataTable tbody tr").removeClass('selected');
            }
        });

        $("#btn-cancel").on("click", function () {
			$("#editModal").modal("hide");
		});
		//删除
        $("#dataTable tbody").on("click", "#delRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            if (confirm("是否确认删除这条信息?")) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/rest/dic/deleteDepartmentType",
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:data,
                    success: function (data) {
                        if (data.success) {
                            toastr.success("删除成功！");
                            tables.api().row().remove().draw(false);
                        } else {
                            toastr.error('删除失败！'+JSON.stringify(data));
                        }
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
                });
            }
        });


    });  
</script>

