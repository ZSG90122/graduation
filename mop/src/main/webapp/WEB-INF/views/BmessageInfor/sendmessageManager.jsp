<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>  
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>消息管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/ionicons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/fileinput.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
	<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css"> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.min.css">
<style type="text/css">
.select2-container--default .select2-selection--multiple .select2-selection__choice{
background-color:#b1dbf3;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice__remove{
color:#f90a29;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice{
color:#191717;
}
</style>

</head>
<!-- <body style="overflow: hidden" class="sidebar-mini"> -->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
<input type="hidden" class="form-control" name="querystr"
		id='querystr' value="${querystr}">
<!-- 查询、添加、批量删除、导出、刷新 -->
<div class="content">
    <!-- 查询、添加、批量删除、导出、刷新 -->
    <div class="row-fluid">
        <div class="pull-right">
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

        <div class="row">
            <form id="queryForm" action="" method="post" onkeydown="if(event.keyCode==13)return false;">
                <div class="col-xs-2">
                    <input type="text" id="keyword" name="keyword" class="form-control input-sm"
                           placeholder="输入标题"/>
                </div>
                <button type="button" class="btn btn-primary btn-sm" id="btn-query">
                    <i class="fa fa-search"></i> 查询
                </button>
            </form>
        </div>
    </div>

    <!--表格-->
<!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="info">
            <td width="2%" style="text-align: center;"><input type="checkbox" id="checkAll"></td>
           <!--  <th></th> -->
            <th width="4%" style="text-align: center;">序号</th>
            <th width="12%" style="text-align: center;">消息类型</th>
            <th width="12%" style="text-align: center;">标题</th>
            <th width="12%" style="text-align: center;">内容</th>
            <th width="12%" style="text-align: center;">发送时间</th>
            <th width="12%" style="text-align: center;">发送人</th>
            <th width="8%" style="text-align: center;"></th>
            <th width="8%" style="text-align: center;"></th>
            <th width="12%" style="text-align: center;">操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>

    <!-- 消息添加  -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">消息详情</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"  id="addForm" action="" method="post">
                        <input type="hidden" class="form-control" name="id" id='messageid'>
                        <input type="hidden" class="form-control" name="userId" id='userId'>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">接收人</label>
                           	<div class="col-md-6">
                           		<select class="combox" id="aceiveUserid" name="receiveuserId"  multiple> 
								</select>
				             </div>
				             <button type="button" class="btn btn-primary btn-sm" id="receiveuser_id">添加
				             </button>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">消息类型</label>
                            <div class="col-sm-6">
                            	<select class="form-control select2" style="width: 100%;" id="messagetypeId" name="messagetypeId">	
								</select>
                            	<!-- <input placeholder="公告/通知/分享" type="text" class="form-control" name="messagetype" id="messagetype_id" /> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">消息标题</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="title" id="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">消息内容</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" type="text" name="content" id="content" rows="5" cols="34.5"></textarea>
                            </div>
                        </div>
						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">附件备注</label>
							<div class="col-sm-7">
								<textarea class="form-control" rows="3" placeholder="Enter"
									name="remark" id="remark"></textarea>
							</div>
						</div>
					</form>
						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">添加附件</label>
							<div class="col-sm-9" >
							<form id="add_messageattach_form" method="post" enctype="multipart/form-data">
								<input id="uploadfile" type="file" name="uploadfile" data-ref="url2" class="file-loading" value="test" multiple/>
								<input type="hidden" id="attachurl" name="url" >
								<!-- <input type="hidden" id="path" name="path" value="upload/message" > -->
							</form>
							</div>
						</div>
						<!-- 调整取消与发送按钮与上面的间距（不提倡） -->
						<table class="table table-bordered comTable table2">
						</table>
						
						<div class="modal-footer">
                			<button type="button" id="btn-add-cancel" class="btn btn-default"
								data-btn-type="cancel" data-dismiss="modal">
								<i class="fa fa-reply">&nbsp;取消</i>
							</button>
							<button type="submit" id="btn-add-submit" class="btn btn-primary" data-dismiss="modal">
												<i class="fa fa-paper-plane">&nbsp;发送</i>
							</button>
                		</div>                                              
                </div>
                <!-- modal-body END -->
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="mpersonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">接收人员信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"  id="editForm" action="" method="post">
                        <input type="hidden" class="form-control" name="tbId" id='tbId'>
                        <div class="form-group">
                            <table  class="table table-striped table-bordered table-hover table-condensed" >
								<thead>
        						<tr class="info">
           						<!--  <th></th> -->
            					<th width="1%" style="text-align: center;" class="col-sm-1 ">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</th>
            					<th width="1%" style="text-align: center;" class="col-sm-2 ">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;字</th>
            					<th width="10%" style="text-align: center;" class="col-sm-3">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</th>
            					<th width="10%" style="text-align: center;" class="col-sm-3">信&nbsp;息&nbsp;状&nbsp;态</th>
        						</tr>
        						</thead>
        						<tbody id="mpersonTab"></tbody>
        					</table>
                        </div>
                        
						<div class="modal-footer">
                			<button type="button" id="mpersonbtn-cancel" class="btn btn-default"
								data-btn-type="cancel" data-dismiss="modal">
								<i class="fa fa-reply">&nbsp;关闭</i>
							</button>
                		</div>                                              
                    </form>
                </div>
                <!-- modal-body END -->
            </div>
        </div>
    </div>
	<div class="modal fade" id="mattachModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">附件信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"  id="editForm" action="" method="post">
                        <input type="hidden" class="form-control" name="tbId" id='tbId'>
                        <div class="form-group">
                            <table  class="table table-striped table-bordered table-hover table-condensed" >
								<thead>
        						<tr class="info">
           						<!--  <th></th> -->
            					<th style="text-align: center;" class="col-sm-1 ">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</th>
            					<th style="text-align: center;" class="col-sm-2 ">文&nbsp;件&nbsp;名</th>
            					<th style="text-align: center;" class="col-sm-3">备注信息</th>
        						</tr>
        						</thead>
        						<tbody id="mattachTab"></tbody>
        					</table>
                        </div>
                        
						<div class="modal-footer">
                			<button type="button" id="mattachbtn-cancel" class="btn btn-default"
								data-btn-type="cancel" data-dismiss="modal">
								<i class="fa fa-reply">&nbsp;关闭</i>
							</button>
                		</div>                                              
                    </form>
                </div>
                <!-- modal-body END -->
            </div>
        </div>
    </div> <!-- modal fade-->
    
	<!-- 添加人员界面 -->
	<div class="modal fade" id="addpersonModal" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only"></span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">选择接收人员</h4>
                </div>
                <!-- 选择人员预览 -->
			    <!-- <div class="col-md-12">
					<div class="box box-primary">
						<h5>已选人员：</h5>
						<input type="text" id="aceiveUserid" name="aceiveUser" style="width: 365px"/>
						<select class="combox" id="aceiveUserid" name="aceiveUser"  multiple> 
						</select>
					</div>
                </div> -->
					<div class="row">
						<div class="col-md-5">
							<div class="box box-primary">
								<div class="box-body box-profile">
									<div id="tree"></div>
								</div>
							</div>
						</div>
						
						<div class="col-md-7">
							<div class="box box-primary">
							<!-- 表格 -->
							<table id="dataTable_user"
								class="table table-striped table-bordered table-hover table-condensed"
								align="center">
								<thead>
									<tr class="info">
										<th style="text-align: center;"><input  id="checkAllUser" type='checkbox' >全选</th>
										<th style="text-align: center;">序号</th>
										<th style="text-align: center;">姓名</th>
								</thead>
								<tbody></tbody>
							</table>
							</div>
						</div>
				   </div>
				   <div class="modal-footer">
				   		<button type="button" id="addperson-cancel" class="btn btn-primary"
					            data-btn-type="cancel" data-dismiss="modal">关闭</button>
             			<button type="submit" id="submit_user" class="btn btn-primary"
					            data-btn-type="cancel" data-dismiss="modal">确定</button>
             	 </div>
        </div>
    </div>
    
</div>
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
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/fileupload.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/fileinput.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zh.js"></script>	
		
<script>
	var querystrdata = [];
	querystrdata.querystring = "";
	var restr =$('#querystr').val(); 
	if(restr!=""){
		querystrdata.querystring = restr;
	}
	//页面加载完成后根据查询语句设置查询框中的选项
	window.onload = function(){ 
		 if(null!=restr){
		 	$('#keyword').val(restr);
		 }
	} 
	var addForm = null;
    $(function () {
		//添加、修改异步提交地址
		var str = "";
    	<shiro:hasAnyRoles name = "admin">
    	 str+= "<div class='btn-group'>" +
         "<button id='detailRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-eye'></i></button>" +
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
                url: "<%=request.getContextPath()%>/rest/message/dataGrid",
                dataSrc: "data",        
                dataType:'json',
                data:querystrdata
                /* data: function(){
					
                } */
            },
             "createdRow": function (row, data, index) {
                // 设置表格中的内容居中 
                $('td', row).attr("class", "text-center");
            },
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": 'messagetypename'},
                {"data": 'title'},
                {"data": 'content'},
                {
                	"data": 'createtime',
                	"render": function (data, type, full, callback) {
                        if (data == null) {
                			return "";
            			}
            			var offlineTimeStr = new Date(data).format("yyyy-MM-dd");
            			return offlineTimeStr;
                    }  
                },
                {"data": 'userName'},
                {
                	"width": "30px",
        			"title": "流程",
                	defaultContent: 
                	"<button id='mpersonBt' class='btn btn-primary btn-sm' type='button'><i class='fa fa-user'></i></button>"
                },
                {
                	"width": "30px",
        			"title": "附件",
                	defaultContent: 
                	"<button id='mattachBt' class='btn btn-primary btn-sm' type='button'><i class='fa fa-file'></i></button>"
                },
                {"data":'columnDefs'}
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
       /* 初始添加人员选择表 */
        var tablesUser = $("#dataTable_user").dataTable({
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
				data: function(){
					
                }
                
            },
             "createdRow": function (row, data, index) {
                // 设置表格中的内容居中 
                $('td', row).attr("class", "text-center");
            },
			columns : [ //对应上面thead里面的序列
				{
					defaultContent : "<input type='checkbox' id='checkboxedUser' onclick='onClickHander(this)'  name='checkListUser'>"
				},
				{
					"data" : 'id'
				},
				{
					"data" : 'name'
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
        
        
		//查询按钮事件
		$("#btn-query").on("click", function() {
			/* var data = $("#keyword").val();
			if(data==""){
				data="kong";
			} */
			var querystring = $("#keyword").val();
			if(querystring==""){
				querystring="kong";
			}else{
				querystrdata.querystring = querystring;
			}
			
			
			tables.fnClearTable(); //清空数据
			tables.fnDestroy(); //销毁datatable
			$("#dataTable").dataTable({
				serverSide : true, //分页，取数据等等的都放到服务端去
				pageLength : 10, //首次加载的数据条数
				ordering : false, //排序操作在服务端进行，所以可以关了。
				pagingType : "full_numbers",
				autoWidth : false,
				stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
				searching : false, //禁用datatables搜索
				ajax : {
					type : "post",
					url : "<%=request.getContextPath()%>/rest/message/getMessageInfoByTitle/" + querystring,
					dataSrc : "data",
					dataType : 'json',
					data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;
						param.length = d.length;
						var formData = $("#queryForm").serializeArray(); //把form里面的数据序列化成数组
						formData.forEach(function(e) {
							param[e.title] = e.value;
						});
						return param; //自定义需要传递的参数。
					}
				},
				 "createdRow": function (row, data, index) {
                // 设置表格中的内容居中 
               	 $('td', row).attr("class", "text-center");
           		 },
                columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": 'messagetypename'},
                {"data": 'title'},
                {"data": 'content'},
                {
                	"data": 'createtime',
                	"render": function (data, type, full, callback) {
                        if (data == null) {
                			return "";
            			}
            			var offlineTimeStr = new Date(data).format("yyyy-MM-dd");
            			return offlineTimeStr;
                    }  
                    
                },
                {"data": 'userName'},
                //{"data": 'remark'},//https://blog.csdn.net/zxf1242652895/article/details/78802495
                {
                	/* "width": "60px", */
        			"title": "接收人员",
                	defaultContent: 
                	"<button id='mpersonBt' class='btn btn-primary btn-sm' type='button'><i class='fa fa-user'></i></button>"
                },
                {
                	/* "width": "60px", */
        			"title": "附件",
                	defaultContent: 
                	"<button id='mattachBt' class='btn btn-primary btn-sm' type='button'><i class='fa fa-file'></i></button>"
                },
                {"data":'columnDefs'}
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
				fnDrawCallback : function() {
					var api = this.api();
					//获取到本页开始的条数
					var startIndex = api.context[0]._iDisplayStart;
					api.column(1).nodes().each(function(cell, i) {
						cell.innerHTML = startIndex + i + 1;
					});
				}
			})
			localStorage.clear();
		});
		/* end 用户查询完毕  */  
		
		//添加
        $("#btn-add").on("click", function () {
        	/* 清空一下下拉框 */
        	$("#aceiveUserid").empty();
            $("#messageid").val("");
            //从数据库直接选择
            sel.bindUnselect('messagetypeId', "<%=request.getContextPath()%>/rest/dic/getMessagetypeList", 'id', 'name');	
            $("input[name=title]").val("");
            $("textarea[name=content]").val("");
			$("textarea[name=remark]").val("");
            //初始化上传控件             
            filelist=[];
            pathArr=[];
            nameArr=[];
            
            initFileInput(); 
            $("#btn-add-submit").show();
            $("#btn-add-cancel").show();
            $("#addModal").modal("show");
        });
        //添加消息时，保存按钮的事件 saveMessageInfor
        $("#btn-add-submit").on("click", function () {
 				var dataform=$('#addForm').form();
 				var params = dataform.getFormSimpleData();
 				console.log(params);
 				params.level = 0;
 				params.fileliststr=JSON.stringify(filelist);
 				params.receiveuserId =String($("#aceiveUserid").val());
 				/* alert($("#aceiveUserid").val()); */
 				$.ajax({
 				url : "<%=request.getContextPath()%>/rest/message/addMessageInfo", 
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
 		//查看消息
        $("#dataTable tbody").on("click", "#detailRow", function () {
        	var data = tables.api().row($(this).parents("tr")).data();
			querystrdata.querystring = $("#keyword").val();
			 var preurl = "<%=request.getContextPath()%>/rest/message/sendView?querystr="+querystrdata.querystring;
            window.location.href="<%=request.getContextPath()%>/rest/message/SendMessageDetail?messageid="+data.id+"&preurl="+preurl;
			<%-- window.location.href="<%=request.getContextPath()%>/rest/message/SendMessageDetail?messageid="+data.id; --%>
        });
        
 		/* 该段代码为信息附件的相关代码*/       
		var oFileInput = new DSFileInput();
		var filelist=[];     
		var pathArr = new Array();//文件网络地址 集合
		var nameArr = new Array();//文件信息集合
		var filepath="upload/message";
		var selectmessage = new Object();
		
		var uploadUrl="<%=request.getContextPath()%>/rest/FileUpload/springUpload";
		var deleteUrl="<%=request.getContextPath()%>/rest/FileUpload/springDelete";
		/* $(function () { 
		    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);  
		}); */
		//添加附件
		function initFileInput()
		{
			$("#add_messageattach_form").empty();
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Init("uploadfile", uploadUrl,deleteUrl,true,pathArr,nameArr,filepath,uploadcallback,deletecallback);
		};
		//展示附件
		function initFileInputdata()
		{
			$("#add_messageattach_form").empty();
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Initdata("uploadfile", pathArr,nameArr);
		};
		function uploadcallback(url,previewId,filetype) {
				var attach = new Object();
				attach.id = null
				attach.url = url;
				attach.type=filetype;
				attach.name="附件";
				/* +document.getElementById(uploadfile).value */
				attach.messageId = selectmessage.id;
				filelist.push(attach);
				var deleteaction = deleteUrl + "?fileurl=" +url;
				$("#" + previewId).find(".kv-file-remove").click(function() {
					$.ajax({
						url : deleteaction,
						type : "post",
						dataType : "json",
						success : function(result) {
							//删除文件成功
							//alert(filelist.length+result.url);
							filelist.removebyurl(result.url);
							//alert(filelist.length);
						},
						error : function(result) {
							//异常操作
						}
					});
				});
		}
		/* 在发送消息的时候，没有提供修改的功能，所以此处在修改附件时的删除功能并没有调用。 */
		//这个函数在初始化植入的删除按钮事件调用，这意味着有了数据库，需要删除数据库
		function deletecallback(key)
		{	
			/* alert(key); */
			var data = new Object();
			
			data.id = key;
			if(key>0){
				$.ajax({
					url: "<%=request.getContextPath()%>/rest/message/deleteMessageAttachById",
					type: 'post',
					dataType: "json",
					cache: "false",
					data:data,
					success: function (data) {
						if (data.success) {
							toastr.success("删除数据库成功！");
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
			//删除filelist
			filelist.removebyid(key);
		};	
		
			//批量删除
		$("#btn-delAll").on("click", function() {
			var checkList_id = new Array();
			var checkList = $("input[name='checkList']:checked");
			for (var i = 0; i < checkList.length; i++) {
				var data = tables.api().row($(checkList.eq(i)).parents("tr")).data();
				checkList_id[i] = parseInt(data.id);
				/* console.log(checkList_id[i]); */
			}
			if (confirm("是否确认删除这些信息?")) {
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/rest/message/delectMessage',
					data : {
						message_id : checkList_id
					},
					traditional : true,
					success : function(result) {
						if (result.msg == "删除成功") {
							alert(result.msg);
							localStorage.clear();
							history.go(0);
						} else {
							alert(result.msg);
						}
					}
				});
			}
		});
		//刷新
        $("#btn-re").on("click", function () {
        	querystrdata.querystring = $("#keyword").val();
			window.location.href="<%=request.getContextPath()%>/rest/message/sendView?querystr="+querystrdata.querystring;
            tables.fnDraw(false);//刷新保持分页状态
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

		//删除     发送发可以删除所有的信息
		$("#dataTable tbody").on("click", "#delRow", function() {

			var data = tables.api().row($(this).parents("tr")).data();
			if (confirm("是否确认删除这条信息?")) {
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/rest/message/delectMessage',
					data : {
						message_id : [ parseInt(data.id) ]
					},
					traditional : true,
					success : function(result) {
						if (result.msg == "删除成功") {
							localStorage.clear();
							history.go(0);
						} else {
							alert(result.msg);
						}
					}
				});
			}
		});
		//流程，显示发送给了那些人
        $("#dataTable tbody").on("click", "#mpersonBt", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            //alert(JSON.stringify(data));
            //alert(JSON.stringify(data.dispatchList));
            $("#mpersonTab").empty();
            for(var p in data.dispatchList){
            	var item = data.dispatchList[p];
            	console.log(item);
            	var trstr = "<tr style='text-align: center;'>";
            	trstr += "<td  class='col-sm-1'>";
            	trstr = trstr+p+"</td>";
            	
            	trstr += "<td class='col-sm-1'>";
            	trstr = trstr+item.userName+"</td>";
            	
            	trstr += "<td class='col-sm-1'>";
            	trstr = trstr+item.depName+"</td>";
            	
            	trstr += "<td class='col-sm-1'>";
            	if(item.state==0){
            		trstr = trstr+'未处理'+"</td>";
            	}else if(item.state==1){
            		trstr = trstr+'已处理'+"</td>";
            	}
            	trstr += "/<tr>";
            	$("#mpersonTab").append(trstr);
            	
        	}
            $("#mpersonModal").modal("show");
        });

        //附件
        $("#dataTable tbody").on("click", "#mattachBt", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            $("#mattachTab").empty();
            for(var k in data.attachList){
            	var itemFile = data.attachList[k];
            	console.log(itemFile.url);
            	var trstring = "<tr style='text-align: center;'>";
            	trstring += "<td class='col-sm-1'>";
            	trstring = trstring+k+"</td>";
            	
            	trstring += "<td class='col-sm-1'>";
            	trstring = trstring+"<a href='"+itemFile.url+"' target='_blank' > <i class='fa fa-book'>"+itemFile.name+"</i></a>"+"</td>";
            	
            	
            	trstring += "<td class='col-sm-1'>";
            	trstring = trstring+itemFile.remark+"</td>";
            	
            	
            	trstring += "/<tr>";
            	$("#mattachTab").append(trstring);
        	}
            $("#mattachModal").modal("show");
        });
		/* 点击添加按钮，跳转到联系人tablesUser */
		 $("#receiveuser_id").on("click", function () {           
            $("#addpersonModal").modal("show");
        });
		/* 由于bootstrap不支持多层modal弹出框，当关闭其中一个modal是，会把所有modal-open给关闭，需要人工指定打开新的modal */
		$("#addpersonModal").on("hidden.bs.modal",function(){
			  $(document.body).addClass("modal-open");
		});             
		//初始化左边树
		initTree(0);
		bindEvent();
		
		//checkbox全选
        $("#checkAllUser").on("click", function () {
            if ($(this).prop("checked") === true) {
                $("input[name='checkListUser']").prop("checked", $(this).prop("checked"));
                $("#dataTable_user tbody tr").addClass('selected');
                $(this).hasClass('selected'); 
               /* 如果是全选，则遍历选中的列表，依次添加 */
               	var tablesUser = $("#dataTable_user").dataTable();
	        	var checkList_id = new Array();
	        	var checkList_name = null;
				var checkListUser = $("input[name='checkListUser']:checked");
				for (var i = 0; i < checkListUser.length; i++) {
					var data = tablesUser.api().row($(checkListUser.eq(i)).parents("tr")).data();
					checkList_id[i] = parseInt(data.id);
					var checkList_name = data.name;
					/* console.log(data);
					console.log(checkList_name); */
					var opts = document.getElementById("aceiveUserid");
					/* 在添加过程中，如果为空则直接添加，如果不为空，则遍历已有的option，如果存在，什么都不做，如果不存在，则添加(添加前先先匹配清除一次) */
					if(opts.options.length==0){
						$("#aceiveUserid").append('<option value='+checkList_id[i]+'>'+checkList_name+'</option>');
					}else{
						for(var j=0;j<opts.options.length;j++){
					        if(opts.options[j].text==checkList_name){
					        	
					        }else{
					        		for(var n=0;n<opts.options.length;n++){
							        if(checkList_name==opts.options[n].text){
							           opts.options[n].remove();
									   /* alert("已清除"); */
							            }
							    	 }
						        	$("#aceiveUserid").append('<option value='+checkList_id[i]+'>'+checkList_name+'</option>');
					        	}
		    			}
					}
				}
				
				/* 设置为默认选中状态 */
				 var opts = document.getElementById("aceiveUserid");
	             for(var j=0;j<opts.options.length;j++){
	                  opts.options[j].selected = 'selected';
	          }    
            } else {
                $("input[name='checkListUser']").prop("checked", false);
                $("#dataTable_user tbody tr").removeClass('selected');         
            }
        });
        /* select2的样式说明 */
		$("#aceiveUserid").select2({
					tags:true,
					createTag:function (decorated, params) {
						return null;
					},
					width:'270px',
					color0: "blue"
	 			});	
    	});  
//为树绑定一个事件，通过点击不同的部门查询相应的人员表
	function bindEvent() {
		$('#tree').on('nodeSelected', function(event, data) {
			var str = "";
			var tablesUser = $("#dataTable_user").dataTable();
			//获取部门id 方便添加信息时使用
			var departmentId = data.id;
			$("#departmentId").val(departmentId);
			//点击节点时  获取该节点下所有子节点的id传给后端 
			console.log(data);
			var data = departmentId;
			console.log(data);
			tablesUser.fnClearTable(); //清空数据
			tablesUser.fnDestroy(); //销毁datatable
			$("#dataTable_user").dataTable({
				serverSide : true, //分页，取数据等等的都放到服务端去
				pageLength : 10, //首次加载的数据条数
				ordering : false, //排序操作在服务端进行，所以可以关了。
				pagingType : "full_numbers",
				autoWidth : false,
				stateSave : true, //保持翻页状态，和comTable.fnDraw(false);结合使用
				searching : false, //禁用datatables搜索
				ajax : {
					type : "post",
					url : "<%=request.getContextPath()%>/rest/user/getAllStafferInfo/" + data,
					dataSrc : "data",
					dataType : 'json',
					data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;
						param.length = d.length;
						return param; //自定义需要传递的参数。
					}
				},
				 "createdRow": function (row, data, index) {
               	 // 设置表格中的内容居中 
             	   $('td', row).attr("class", "text-center");
           		 },
				columns : [ //对应上面thead里面的序列
					{
					defaultContent : "<input type='checkbox' id='checkboxedUser' onclick='onClickHander(this)'  name='checkListUser'>"
					},
					{
						"data" : 'id'
					},
					{
						"data" : 'name'
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
			})

			localStorage.clear();
			tablesUser.fnDraw(); //查询后不需要保持分页状态，回首页 
		});
	}
	function initTree(selectNodeId) {
		var treeData = null;
		ajaxPost("<%=request.getContextPath()%>/rest/department/activetreeDatabydep", null, function(data) {
			treeData = data;
		});
		$("#tree").treeview({
			data : treeData,
			showBorder : true,
			expandIcon : "glyphicon glyphicon-stop",
			collapseIcon : "glyphicon glyphicon-unchecked",
			levels : 0,
		});
		if (treeData.length == 0)
			return;
		//默认选中第一个节点
		selectNodeId = selectNodeId || 0;
		$("#tree").data('treeview').selectNode(selectNodeId);
		$("#tree").data('treeview').expandNode(selectNodeId);
		$("#tree").data('treeview').revealNode(selectNodeId);
	}
	/* 单选checkbox监听事件响应部分 */
	function onClickHander(obj){
			var tablesUser = $("#dataTable_user").dataTable();
			var data = tablesUser.api().row($(obj).parents("tr")).data();
			console.log(data)
			var templatedata = data.name;
	        var value = data.id;
	        var opts = document.getElementById("aceiveUserid");
	        /* 首先判断选择项是否选中状 */      
           if(obj.checked){
           		/* 在判断是否已经添加值 ，如果为空直接添加，如果不为空则判断是否已经存在，如果存在，不添加；如果不存在直接添加(由于for循环的原因，添加的时候要先清除)*/
             	if(opts.options.length==0){
             		$("#aceiveUserid").append('<option value='+value+'>'+templatedata+'</option>');
             	}else{
             		for(var i=0;i<opts.options.length;i++){
				        if(opts.options[i].text==templatedata){
				        }else{
				        	for(var i=0;i<opts.options.length;i++){
						        if(templatedata==opts.options[i].text){
						           opts.options[i].remove();
						            }
						     }
				        	/* console.log("bbbbb"); */
				        	$("#aceiveUserid").append('<option value='+value+'>'+templatedata+'</option>');
				        }
			    	}
             	}
            }else{
            	/* 未被选中，清除已选中 */
				for(var i=0;i<opts.options.length;i++){
			        if(templatedata==opts.options[i].text){
			           opts.options[i].remove();
			            }
			     }
            }
            /* 设置为默认选中状态 */
             for(var i=0;i<opts.options.length;i++){
                  opts.options[i].selected = 'selected';
          }
  
        }       
</script>
</body>
</html>

