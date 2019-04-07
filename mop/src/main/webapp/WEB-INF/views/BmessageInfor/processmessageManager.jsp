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
                <button type="button" class="btn btn-primary btn-sm" id="btn-delAll">
                    <i class="fa fa-remove"></i> 删除
                </button>
                <button type="button" class="btn btn-primary btn-sm" id="btn-re">
                    <i class="fa fa-refresh"></i> 刷新
                </button>
            </div>
        </div>

        <div class="row">
            <form id="queryForm" action="" method="post">
                <div class="col-xs-2">
                    <input type="text" id="keyword" name="keyword" class="form-control input-sm"
                           placeholder="输入发送人"/>
                </div>
                <button type="button" class="btn btn-primary btn-sm" id="btn-query">
                    <i class="fa fa-search"></i> 查询
                </button>
            </form>
        </div>
    </div>

    <!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="info">
            <td width="2%" style="text-align: center;"><input type="checkbox" id="checkAll"></td>
           <!--  <th></th> -->
            <th width="2%" style="text-align: center;">序号</th>
            <th width="2%" style="text-align: center;">类型</th>
            <th width="9%" style="text-align: center;">消息标题</th>
            <th width="15%" style="text-align: center;">消息内容</th>
            <th width="5%" style="text-align: center;">状态</th>
            <th width="8%" style="text-align: center;">发送人</th>
            <th width="8%" style="text-align: center;">时间</th>
            <th width="13%" style="text-align: center;">附件备注</th>
            <th width="10%" style="text-align: center;">操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
	<!-- 处理消息  -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
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
                    <form class="form-horizontal"  id="editForm" action="" method="post">
                        <input type="hidden" class="form-control" name="id" id='messageid'>
                        <input type="hidden" class="form-control" name="userName" id='userId'>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">发送人</label>
                           	<div class="col-md-6">
                           		<input  type="text" readonly="readonly" class="form-control" name="userName" id="userId">
				             </div>
				            
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">消息类型</label>
                            <div class="col-sm-6">
                            	<input  readonly="readonly" type="text" class="form-control" name="messagetypeName" id="messagetypeName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">消息标题</label>
                            <div class="col-sm-6">
                                <input readonly="readonly"  type="text" class="form-control" name="title" id="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">消息内容</label>
                            <div class="col-sm-6">
                                <textarea readonly="readonly"  class="form-control" type="text" name="content" id="content" rows="5" cols="34.5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">消息状态</label>
							<div class="col-sm-2">
								<label class="radio-inline"> <input type="radio"
									value="0" name="state" id="messagestateid0">未处理
								</label>
							</div>
							<div class="col-sm-2">
								<label class="radio-inline"> <input type="radio"
									value="1" name="state" id="messagestateid1">已处理
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">附件备注</label>
							<div class="col-sm-7">
								<textarea readonly="readonly" class="form-control" rows="3" placeholder="Enter"
									name="remark" id="remark"></textarea>
							</div>
						</div>
					</form>
						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">附件预览</label>
							<div class="col-sm-9" >
							<form id="add_messageattach_form" method="post" enctype="multipart/form-data">
								<input id="uploadfile" type="file" name="uploadfile" data-ref="url2" class="file-loading" value="test" multiple/>
								<input type="hidden" id="attachurl" name="url" >
								<!-- <input type="hidden" id="path" name="path" value="upload/message" > -->
							</form>
							</div>
						</div>
						
						<div class="modal-footer">
                			<button type="button" id="btn-cancel" class="btn btn-default"
								data-btn-type="cancel" data-dismiss="modal">
								<i class="fa fa-reply">&nbsp;取消</i>
							</button>
							<button type="submit" id="btn-edit-submit" class="btn btn-primary" data-dismiss="modal">
												<i class="fa fa-paper-plane">&nbsp;保存</i>
							</button>
                		</div>                                              
                </div>
                <!-- modal-body END -->
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
    var editForm = null;
    $(function () {
    	/* form=$('#editForm').form(); */
		//添加、修改异步提交地址
		var str = "";
    	<shiro:hasAnyRoles name = "admin">
    	 str+= "<div class='btn-group'>" +
    	 "<button id='detailRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-eye'></i></button>" +
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
                url: "<%=request.getContextPath()%>/rest/message/dataMessageGrid",
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
                /* {"data": 'state'}, */
                {
                	"data":'state',
                	"render": function (data, type, full, callback) {
                        //状态：0:未处理    1:已处理。
                        switch (data) {
                            case 0: return "未处理"; break;
                            case 1: return "已处理";break;
                        }
                    }  
                },
                {"data": 'userName'},
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
                {"data": 'remark'},
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

		//查询按钮事件
		$("#btn-query").on("click", function() {
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
					url : "<%=request.getContextPath()%>/rest/message/getDealMessageInfoByuserName/" + querystring,
					dataSrc : "data",
					dataType : 'json',
					data : function(d) {
						var param = {};
						param.draw = d.draw;
						param.start = d.start;
						param.length = d.length;
						var formData = $("#queryForm").serializeArray(); //把form里面的数据序列化成数组
						formData.forEach(function(e) {
							param[e.userName] = e.value;
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
                /* {"data": 'state'}, */
                 {
                	"data":'state',
                	"render": function (data, type, full, callback) {
                        switch (data) {
                            case 0: return "未处理"; break;
                            case 1: return "已处理";break;
                        }
                       
                    }  
                },
                {"data": 'userName'},
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
                {"data": 'remark'},
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
		});
		/* end 用户查询完毕  */  
		//删除的时候，接收方只删除dispath
        $("#dataTable tbody").on("click", "#delRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            console.log(data);
            if (confirm("是否确认删除这条信息?")) {
                $.ajax({
                	type : 'POST',
                    url: "<%=request.getContextPath()%>/rest/message/deleteDealMessage",
                    data : {
						id : [ parseInt(data.id) ]
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
					url : '<%=request.getContextPath()%>/rest/message/deleteDealMessage',
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
			window.location.href="<%=request.getContextPath()%>/rest/message/delView?querystr="+querystrdata.querystring;
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

		//修改
        $("#dataTable tbody").on("click", "#editRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
			querystrdata.querystring = $("#keyword").val();
			var preurl = "<%=request.getContextPath()%>/rest/message/delView?querystr="+querystrdata.querystring;
            window.location.href="<%=request.getContextPath()%>/rest/message/DealMessageEdit?messageid="+data.id+"&preurl="+preurl;
			<%-- window.location.href="<%=request.getContextPath()%>/rest/message/DealMessageEdit?messageid="+data.id; --%>
        });
         //编辑消息时，保存按钮的事件 ，保存消息的处理状态
        $("#btn-edit-submit").on("click", function () {
 				var dataform=$('#editForm').form();
 				var params = dataform.getFormSimpleData();
 				console.log(params);
 				/* alert($("#aceiveUserid").val()); */
 				$.ajax({
 				url : "<%=request.getContextPath()%>/rest/message/addDealMessageInfo", 
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
 		});

        //查看
        $("#dataTable tbody").on("click", "#detailRow", function () {
        	var data = tables.api().row($(this).parents("tr")).data();
			querystrdata.querystring = $("#keyword").val();
			var preurl = "<%=request.getContextPath()%>/rest/message/delView?querystr="+querystrdata.querystring;
            window.location.href="<%=request.getContextPath()%>/rest/message/DealMessageDetail?messageid="+data.id+"&preurl="+preurl;
			<%-- window.location.href="<%=request.getContextPath()%>/rest/message/DealMessageDetail?messageid="+data.id; --%>
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
		function initFileInputdata()
		{
			$("#add_messageattach_form").empty();
			/* console.log("AAAAA"); */
		    $("#add_messageattach_form").append("<input id='uploadfile' type='file' name='uploadfile' data-ref='url2' class='file-loading' value='test' multiple/>");
		    oFileInput.Initdata("uploadfile", pathArr,nameArr);
		
		};

    });
</script>
</body>
</html>

