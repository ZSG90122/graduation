<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>站点管理</title>
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
                <button type="button" class="btn btn-primary btn-sm" id="btn-export">
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
                    <input type="text" id="keyword" name="keyword" class="form-control input-sm"
                           placeholder="搜索"/>
                </div>
                <button type="button" class="btn btn-primary btn-sm" id="btn-query">
                    <i class="fa fa-search"></i> 查询
                </button>
            </form>
        </div>
    </div>

    <!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed" align="center">
        <thead>
        <tr class="info">
            <td><input type="checkbox" id="checkAll"></td>
           <!--  <th></th> -->
            <th>序号</th>
            <th>IP</th>
            <th>站名</th>
            <th>状态</th>
            <!-- <th>区域</th> -->
            <th>城市</th>
            <th>街道名</th>
            <th>建设时间</th>
            <th>配置说明</th>
            <th>备注</th>
            <th>操作</th>
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
                    <h4 class="modal-title" id="myModalLabel">信息修改</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal"  id="editForm" action="" method="post">
                        <input type="hidden" class="form-control" name="tbId" id='tbId'>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">IP</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxIp" id="boxIp">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">MAC</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxMac">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">名字</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">经度</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxLng">
                            </div>                     
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">纬度</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxLat">
                            </div>                     
                        </div>
                        <div class="form-group" style="display:none"> <!-- 隐藏，以后要恢复多级也简单 -->
							<label class="col-sm-3 control-label" for="inputArea" >区域</label>
							<div class="col-sm-9">
								<select class="form-control select2" style="width: 100%;" id="boxAreaId" name="boxAreaId">	
								<select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inputGroup">分组</label>
							<div class="col-sm-9">
								<select class="form-control select2" style="width: 100%;" id="boxGroupId" name="boxGroupId">	
								<select>
							</div>
						</div> 
						<div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">详细地址</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxStreetname">
                            </div>
                        </div>
						<div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">当前配置</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="boxCurConfig">
                            </div>                     
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">备注</label>
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
</script>
<script>
	
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
                url: "<%=request.getContextPath()%>/rest/SiteManager/dataGrid",
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
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "tbId"},
                {"data": 'boxIp'},
                {"data": 'boxName'},
                {"data": 'ctlBoxStateName'},
                /* {"data": 'boxAreaName'}, */
                {"data": 'boxGroupName'},
                {"data": 'boxStreetname'},
                {
                	"data": 'boxDate',
                	"render": function (data, type, full, callback) {
                        //类型：0导航菜单；1操作按钮。
                        //switch (data) {
                            //case 0: return "导航菜单"; break;
                            //case 1: return "操作按钮 "; break;
                        //}
                        if (data == null) {
                			return "";
            			}
            			var offlineTimeStr = new Date(data).format("yyyy-MM-dd");
            			return offlineTimeStr;
                    }  
                    
                },
                {"data": 'boxCurConfig'},
                {"data": 'remark'},
                {"data":'columnDefs'}
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

		//查询按钮
        $("#btn-query").on("click", function () {
            tables.fnDraw();//查询后不需要保持分页状态，回首页
        });
		$('#boxAreaId').on("change", function(){
            //alert("ddd"); //http://blog.csdn.net/yin767833376/article/details/52035656
            var parentId = $("#boxAreaId").val();
            sel.bindUnselect('boxGroupId', 
                 "<%=request.getContextPath()%>/rest/AreaGroupManager/areaGroupData?levelcode=1&parentId="+parentId, 'id', 'name');
         });  
      
		//添加
        $("#btn-add").on("click", function () {
        	//初始化区域数据
        	sel.bindselectfirst('boxAreaId', "<%=request.getContextPath()%>/rest/AreaGroupManager/areaGroupData?levelcode=0", 'id', 'name');       	
                                   
            url = "<%=request.getContextPath()%>/rest/SiteManager/saveCtlBoxInfor";
            $("input[name=tbId]").val(0);
            $("input[name=boxIp]").val("");
            $("input[name=boxName]").val("");
            $("#editModal").modal("show");
        });

		//批量删除
        $("#btn-delAll").on("click", function () {
			obj = $("input[name='checkList']");
			var check_val = [];
			for(k in obj){
				if(obj[k].checked){
					var data = tables.api().row(k).data();
					var oneBox = new Object();
					oneBox.tbId = data.tbId;
					oneBox.boxIp = data.boxIp;
					check_val.push(oneBox);
				}
					
			}
			tbIds = JSON.stringify(check_val);
			alert(tbIds);
			url = "<%=request.getContextPath()%>/rest/SiteManager/deleteBatch";
			
			//
			$.ajax({
                    url: url,
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:tbIds,
                    //contentType : 'application/json', //设置这个接收端就可以用链表 这里其实画蛇添足，前面stringify这个将对象转换为了字符串，不转换就可以不用这个了
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
					
        });

		//导出
        $("#btn-export").on("click", function () {
        });

		//刷新
        $("#btn-re").on("click", function () {
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
            sel.bindselectfirst('boxAreaId', "<%=request.getContextPath()%>/rest/AreaGroupManager/areaGroupData?levelcode=0", 'id', 'name',data.boxAreaId); 
            
            var parentId = data.boxAreaId;
            sel.binddata('boxGroupId', 
                 "<%=request.getContextPath()%>/rest/AreaGroupManager/areaGroupData?levelcode=1&parentId="+parentId, 'id', 'name',data.boxGroupId);
            
            //alert(JSON.stringify(data));
            $("input[name=tbId]").val(data.tbId);
            $("input[name=boxIp]").val(data.boxIp);
            $("input[name=boxIp").attr("readonly","readonly");
            $("input[name=boxName]").val(data.boxName);
            $("input[name=boxLng]").val(data.boxLng);
            $("input[name=boxLat]").val(data.boxLat);
            //$("select[name=boxAreaId]").val(data.boxAreaId);
            //$("select[name=boxGroupId]").val(data.boxGroupId);
            $("input[name=boxStreetname]").val(data.boxStreetname);
            $("input[name=boxCurConfig]").val(data.boxCurConfig);
            $("input[name=remark]").val(data.remark);
                        
			
            url = "<%=request.getContextPath()%>/rest/SiteManager/saveCtlBoxInfor";

            $("#editModal").modal("show");
        });
		
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
						boxIp : {
							validators : {
								notEmpty : {
									message : 'IP地址'
								},
								stringLength: {
                          			min: 7,
                          			max: 15,
                          			message: '必须为7-15位'
                      			},
                      			threshold: 7,
						        remote:{
						        	url:'<%=request.getContextPath()%>/rest/SiteManager/checkIpUnique',
						        	data: function(validator) {
			                            return {
			                                //className:'com.cnpc.framework.base.entity.Function',
			                                //fieldName:'code',
			                                fieldValue:$('#boxIp').val(),
			                                id:$('#tbId').val()
			                            };
			                        },
						        	message:'该IP地址已被使用'
						        }
							}
						},
						boxName : {
							validators : {
								notEmpty : {
									message : '请输入名称'
								}
							}
						},
						boxAreaId : {
							validators : {
								notEmpty : {
									message : '请选择区域'
								}
							}
						},
						boxGroupId : {
							validators : {
								notEmpty : {
									message : '请选择分组'
								}
							}
						}
						
					}/* end field */
				}).on("success.form.bv",function(e){					
					if(confirm("确定提交么？")){
						var params = form.getFormSimpleData();
						//alert(JSON.stringify(params));
						ajaxPost(url, params, function(data, status) {
							if (data.success) {
								tables.fnDraw(false);//刷新保持分页状态 false重新加载当前页，true重新加载初始状态
								$("#editModal").modal("hide");	
								toastr.success("保存成功！");
							}else{
								toastr.error("保存失败");
							};
							
						});						
					}
					e.preventDefault(); //防止重复提交						
				}); /* end $('#editForm').bootstrapValidator */
		
        $("#btn-submit").on("click", function () {
            <%-- $.ajax({
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
                    if (data.status == 1) {
                        $("#editModal").modal("hide");
                        showSuccess("");
                        tables.fnDraw();
                    } 
                    else {
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
                
            }); --%>
            
            
				
            
        });
        $("#btn-cancel").on("click", function () {
			$("#editModal").modal("hide");
		});
		//删除
        $("#dataTable tbody").on("click", "#delRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
                      
            if (confirm("是否确认删除这条信息?")) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/rest/SiteManager/delete",
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
