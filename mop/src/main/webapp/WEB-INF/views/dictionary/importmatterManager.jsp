<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'importmatterManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
	
	<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/js/toastr.min.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
	<script src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini sidebar-collapse">

	
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		
		<div class="content-wrapper">
			<!-- Main content -->
			<h2 align = "center">要事类别管理</h2>
			<section class="content">
				<div class="row">
					<div class="col-md-5">

						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<div class="btn-group">
									<button id="parentimportmatteradd" type="button" class="btn btn-default"
										data-btn-type="add">
										<li class="fa fa-plus">&nbsp;新增要事类别</li>
									</button>
									<button id="parentimportmatteredit" type="button" class="btn btn-default"
										data-btn-type="edit">
										<li class="fa fa-edit">&nbsp;编辑当前</li>
									</button>
									<button id="parentimportmatterdelete" type="button" class="btn btn-default"
										data-btn-type="delete">
										<li class="fa fa-remove">&nbsp;删除当前</li>
									</button>
								</div>	
							</div> <!-- /.box-tools -->
							<!-- /.box-header -->
							<div class="box-body box-profile">
								<table id="importmatterdataTable" class="table table-striped table-bordered table-hover table-condensed" align="center">
        							<thead>
        							<tr class="info">
            							<td><!-- <input type="checkbox" id="checkAll"> --></td>
            							<th>序号</th>
            							<th>名称</th>
            							<th>操作</th>
        							</tr>
        						 </thead>
       							 <tbody></tbody>
    							</table>
								
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
					<div class="col-md-5">
						<div class="box box-primary">
							<div class="box-header with-border">
							
							<div class="btn-group">
									<button id="childadd" type="button" class="btn btn-default"
										data-btn-type="add">
										<li class="fa fa-plus">&nbsp;新增子类别</li>
									</button>
									<button id="childedit" type="button" class="btn btn-default"
										data-btn-type="edit">
										<li class="fa fa-edit">&nbsp;编辑当前</li>
									</button>
									<button id="childdelete" type="button" class="btn btn-default"
										data-btn-type="delete">
										<li class="fa fa-remove">&nbsp;删除当前</li>
									</button>
								</div>		
							</div><!-- /.box-tools -->
							<!-- /.box-header -->
							<div class="box-body">
								<table id="childdataTable" class="table table-striped table-bordered table-hover table-condensed dataTable no-footer" role="grid" aria-describedby="templatedataTable_info">
									<thead>
        							<tr class="info">
            							<td><!-- <input type="checkbox" id="checkAll"> --></td>
            							<th>序号</th>
            							<th>名称</th>
            							<th>操作</th>
        							</tr>
        						 </thead>
       							 <tbody></tbody>

								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
					</div>
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>

	</div>
	
  	
  	<!-- 修改和新增模板的model -->
  	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">信息修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"  id="editForm" action="" method="post">
                        <input type="hidden" class="form-control" name="id" id='importid'>
                        <input type="hidden" name="parentid" id="parentid" value="0"  />
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">要事类别名:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" id="importname">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">说明:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="remark" id="importabstract">
                            </div>
                        </div>
        
						<div id="templatefooter" class="modal-footer">
                			<button type="button" id="modalbtn-cancel" class="btn btn-default"
								data-btn-type="cancel">
								<i class="fa fa-reply">&nbsp;取消</i>
							</button>
							<button type="button" id="modalbtn-submit" class="btn btn-primary">
												<i class="fa fa-save">&nbsp;保存</i>
							</button>
                    		<!-- <button type="submit" id="btn-submit" class="btn btn-primary">确认</button> -->
                		</div>                                              
                    </form>
                </div> <!-- modal-body END -->
                

                
            </div>
        </div>
    </div>
</body>
<script>
 	
    var selectedParentImportmatter = null;
 	//子类别管理
    var selectedChildImportmatter=null;
    var childtables = null;  
    var curentsave = 0;  //表示当前进行存储的是一级还是二级
        
  	$(function() {
  		//control通过model返回的数据
  		//var mss=  '${message}';
  		//alert(mss);
  		
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
		
		
		
		var str = "";
    	<shiro:hasAnyRoles name = "admin">
    	 str+= "<div class='btn-group'>" +
         "<button id='importmatterdetailRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-eye'></i></button>" +
         "</div>"
    	</shiro:hasAnyRoles>
         
        var url = "";
        var tables = $("#importmatterdataTable").dataTable({
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
                url: "<%=request.getContextPath()%>/rest/dic/importmatterdataGrid/0", 
                dataSrc: "data",
                dataType:'json',
                data: function(){
					
                }
            },
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": 'name'},
                
                {"data":'columnDefs'}
            ],

			//操作按钮
            columnDefs: [
                {
                    targets: 0,
                    defaultContent: "<input type='radio' name='checkList'>"
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

 		//datatables 行点击事件
 		var tabledata = $('#importmatterdataTable').DataTable();
 		$('#importmatterdataTable tbody').on('click', 'tr', function() {
 			var selectdata = tabledata.row(this).data();
 			selectedParentImportmatter = selectdata;
 			//JSON.stringify(data)
 			//alert('You clicked on ' + templatedata.id + '\'s row');
 			//form.clearForm();
			initChildTable(selectedParentImportmatter.id);
			selectedChildImportmatter = null;
 		});
 		
		$("#modalbtn-cancel").on("click", function () {
			$("#editModal").modal("hide");
		});
		//添加
        $("#parentimportmatteradd").on("click", function () {
        	//初始化区域数据
            url = "<%=request.getContextPath()%>/rest/dic/saveimportmatterInfor";
            $('#myModalLabel').text("新增一级要事类别");
            curentsave = 0;
        	$('#parentid').val(0);
            $("#importid").val(null);
            
            $("#modalbtn-submit").show();
            $("#importname").val("");
            $("#importabstract").val("");
            $("#editModal").modal("show");
        });
        //修改
        $("#parentimportmatteredit").on("click", function () {
        	//初始化区域数据
        	if(null == selectedParentImportmatter){
        		toastr.error("首先在下边选中模板！");
 				return;
        	}
        	curentsave = 0;
            url = "<%=request.getContextPath()%>/rest/dic/saveimportmatterInfor";            
            $('#myModalLabel').text("修改一级要事类别");           
            $("#modalbtn-submit").show();
            $("#importid").val(selectedParentImportmatter.id);
            $("#importname").val(selectedParentImportmatter.name);
            $("#importabstract").val(selectedParentImportmatter.remark);
            $("#editModal").modal("show");
        });
        //删除
        $("#parentimportmatterdelete").on("click", function () {
        	//初始化区域数据
        	if(null == selectedParentImportmatter){
        		toastr.error("首先在下边选中模板！");
 				return;
        	}
            if (confirm("是否确认删除这条信息?")) {
            	$.ajax({
                    url: "<%=request.getContextPath()%>/rest/dic/Deleteoneimportmatter",
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:selectedParentImportmatter,
                    success: function (data) {
                        if (data.success) {
                            toastr.success("删除成功！");
                            $("#templateitems").empty();
                            tables.api().row().remove().draw(false);
                            childtables.fnDraw();
                            selectedParentImportmatter = null;
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
        //要事类别保存，弹出对话框的按钮
        $("#modalbtn-submit").on("click", function () {
            $.ajax({
                cache: false,
                type: "POST",
                url: url,
                data: $("#editForm").serialize(),
                async: false,
                error: function (request) {
                  //https://www.cnblogs.com/softwarefang/p/6094174.html
                    showFail("Server Connection Error<%=request.getContextPath()%>.");
                },
                success: function (data) {
                    if (data.success == true) {
                        $("#editModal").modal("hide");
                        if (curentsave == 0){
                        	tables.fnDraw();
                        }else{
                        	childtables.fnDraw();
                        }
                    } 
                    else {
                    	alert(JSON.stringify(data));
                    	//toastr.info("dd");
                    	//toastr.success("ddd");
                    	//toastr.warning('服务器端返回：保存失败');
                    	toastr.error('服务器端返回：保存失败');
                        //showFail("");
                    }
                },
                error:function (XMLHttpRequest,textStatus,errorThrown) {
					// 状态码
					console.log(XMLHttpRequest.status);
					// 状态
					console.log(XMLHttpRequest.readyState);
					// 错误信息   
					console.log(textStatus);
                }
                
            });   
        });
        //一级类别表中的查看
 		$("#importmatterdataTable tbody").on("click", "#importmatterdetailRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            if(null == data){
        		toastr.error("首先在下边选中模板！");
 				return;
        	}
            $('#myModalLabel').text("查看二级要事类别"); 
            $("#importid").val(data.id);
            $("#importname").val(data.name);
            $("#importabstract").val(data.remark);
            $("#modalbtn-submit").hide();
            $("#editModal").modal("show");
            
        });
        
        
        //右边的按钮，即子类的增改删
        //子类别添加
        $("#childadd").on("click", function () {
        	//初始化区域数据
        	if(null == selectedParentImportmatter){
        		toastr.error("首先在选中右边的一级类别！");
 				return;
        	}
        	curentsave = 1;
            url = "<%=request.getContextPath()%>/rest/dic/saveimportmatterInfor";
            $('#myModalLabel').text("新增二级要事类别");
            $('#parentid').val(selectedParentImportmatter.id);
            $("#importid").val(null);
            $("#modalbtn-submit").show();
            $("#importname").val("");
            $("#importabstract").val("");
            $("#editModal").modal("show");
        });
        //子类别修改
        $("#childedit").on("click", function () {
        	//初始化区域数据
        	if(null == selectedChildImportmatter){
        		toastr.error("首先在下边选中模板！");
 				return;
        	}
        	curentsave = 1;
            url = "<%=request.getContextPath()%>/rest/dic/saveimportmatterInfor";
            
            $('#myModalLabel').text("修改二级要事类别");           
            $("#modalbtn-submit").show();
            $('#parentid').val(selectedChildImportmatter.parentid);
            $('#importid').val(selectedChildImportmatter.id);
            $("#importname").val(selectedChildImportmatter.name);
            $("#importabstract").val(selectedChildImportmatter.remark);
            $("#editModal").modal("show");
        });
        //子类别删除
        $("#childdelete").on("click", function () {
        	//初始化区域数据
        	if(null == selectedChildImportmatter){
        		toastr.error("首先在下边选中模板！");
 				return;
        	}
            if (confirm("是否确认删除这条信息?")) {
            	$.ajax({
                    url: "<%=request.getContextPath()%>/rest/dic/Deleteoneimportmatter",
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:selectedChildImportmatter,
                    success: function (data) {
                        if (data.success) {
                            toastr.success("删除成功！");
                            childtables.api().row().remove().draw(false);
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
        
        
 		
	}); //$(function)  
  
   function initChildTable(parentid){
   		var childstr = "";
    	<shiro:hasAnyRoles name = "admin">
    	 childstr+= "<div class='btn-group'>" +
         "<button id='childdetailRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-eye'></i></button>" +
         "</div>"
    	</shiro:hasAnyRoles>
         
        if(childtables!= null){
        	childtables.fnClearTable(); //清空数据
			childtables.fnDestroy(); //销毁datatable		
			$('#childdataTable tbody').off('click', 'tr');
			$("#childdataTable tbody").off("click", "#childdetailRow");	
        } 
        
        var url = "";
        childtables = $("#childdataTable").dataTable({
            serverSide: true,//分页，取数据等等的都放到服务端去
            //processing: true,//载入数据的时候是否显示“载入中”
            pageLength: 10,  //首次加载的数据条数
            ordering: false, //排序操作在服务端进行，所以可以关了。
            pagingType: "full_numbers",
            autoWidth: false,
            destroy:true,
            stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
            searching: false,//禁用datatables搜索
            ajax: {
                type: "post",
                url: "<%=request.getContextPath()%>/rest/dic/importmatterdataGrid/"+parentid, 
                dataSrc: "data",
                dataType:'json',
                data: function(){
					
                }
            },
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": 'name'},
                
                {"data":'columnDefs'}
            ],

			//操作按钮
            columnDefs: [
                {
                    targets: 0,
                    defaultContent: "<input type='radio' name='checkList'>"
                },
                {
                    targets: -1,
                    defaultContent: childstr
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

 		//datatables 行点击事件
 		var childtabledata = $('#childdataTable').DataTable();
 		$('#childdataTable tbody').on('click', 'tr', function() {
 			var selectdata = childtabledata.row(this).data();
 			selectedChildImportmatter = selectdata;
 			//JSON.stringify(data)
 			//alert('You clicked on ' + templatedata.id + '\'s row');
 			//form.clearForm();
			
 		});
   		$("#childdataTable tbody").on("click", "#childdetailRow", function () {
            var data = childtables.api().row($(this).parents("tr")).data();
            if(null == data){
        		toastr.error("首先在下边选中模板！");
 				return;
        	}
        	$('#myModalLabel').text("查看二级要事类别"); 
            $("#importid").val(data.id);
            $("#importname").val(data.name);
            $("#importabstract").val(data.remark);
            $("#modalbtn-submit").hide();
            $("#editModal").modal("show");
            
        });
   }
 
</script>

</html>
