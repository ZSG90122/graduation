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
            <th>名字</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>地址</th>
            <th>状态</th>
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
                        <input type="hidden" class="form-control" name="id" id='idid'>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">商家名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" id="nameid">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">营业执照</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="encode" placeholder="营业执照号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">地址</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="address">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">联系人</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="contactperson">
                            </div>                     
                        </div>
                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="contactphone">
                            </div>                     
                        </div>
                        <div class="form-group">
							<label for="contacts" class="col-sm-3 control-label">当前状态</label>
							<div class="col-sm-9">
								<select class="form-control" name="isactive" id="isactiveid">
									<option value="0">未激活</option>
									<option value="1">激活</option>
								</select>
							</div>
						</div>
						<div class="form-group">
								<label for="introduce" class="col-sm-3 control-label">商家简介</label>
								<div class="col-sm-9">
									<textarea class="form-control" id="introductionid" name="introduction" placeholder="商家服务能力等"></textarea>
								</div>
						</div>
						<div class="form-group">
								<label for="introduce" class="col-sm-3 control-label">商家资质</label>
								<div class="col-sm-9">
									<textarea class="form-control" id="qualifyid" name="qualify"></textarea>
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
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/xlsx.core.min.js"></script>	
		
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
	var querydata=[];
	var restr =$('#querystr').val(); 
	querydata.querystring = "";
	if(null != restr){
		querydata.querystring = restr;
		//解析restr 
		//alert(restr);
		
		var name = "";
		var qarr = restr.split(",");
		for ( var i = 0; i <qarr.length; i++){
    		var item = qarr[i];
    		var itemarra = item.split(":");
    		switch(itemarra[0]){    			
  				case "name":
  					name=itemarra[1];
  					break;
				default:
  					;
    		}
		}
	}
	//页面加载完成后根据查询语句设置查询框中的选项
	window.onload = function(){ 　　		
		 if(null!=name){
		 	$('#keyword').val(name);
		 }
	} 	
	
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
                url: "<%=request.getContextPath()%>/rest/department/enterprisedataGrid",
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
               /*  data: function(){
					
                } */
                data:querydata  //似乎querydata必须是对象，draw等参数才会被带过去
            },
            columns: [//对应上面thead里面的序列
                {"data": "null"},
                {"data": "id"},
                {"data": "name"},
                {"data": 'contactperson'},
                {"data": 'contactphone'},
                {"data": 'address'},
                {
                	"data": 'isactive',
                	"render": function (data, type, full, callback) {
                        //类型：0未激活；1激活。
                        switch (data) {
                            case 0: return "未激活"; break;
                            case 1: return "激活 "; break;
                        }
                       
                    }  
                    
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

		//查询按钮
        $("#btn-query").on("click", function () {        	
        	var name = $("#keyword").val();
			querydata.querystring = "name:"+name;			
			var oSettings = tables.fnSettings();
			oSettings.ajax.data = querydata;			
			tables.api().ajax.reload();
            tables.fnDraw();//查询后不需要保持分页状态，回首页
        });
	
      	inputvalidator();
		//添加
        $("#btn-add").on("click", function () {
                   
            url = "<%=request.getContextPath()%>/rest/department/insertEnterpriseInfor";
            $("input[name=name]").val("");
            $("input[name=encode]").val("");
            $("input[name=address]").val("");
            
            $("#myModalLabel").html("<b>增加新商家信息</b>");
            
            $("#editModal").modal("show");
             //下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
        });

		//批量删除
        $("#btn-delAll").on("click", function () {
			obj = $("input[name='checkList']");
			var check_val = [];
			for(k in obj){
				if(obj[k].checked){
					var data = tables.api().row(k).data();
					var oneEnterprice = new Object();
					oneEnterprice.id = data.id;
					oneEnterprice.name = data.name;
					check_val.push(oneEnterprice);
				}
					
			}
			enterprisesIds = JSON.stringify(check_val);
			//enterprisesIds = check_val;
			url = "<%=request.getContextPath()%>/rest/department/deleteEnterpriseBatch";
			//alert(JSON.stringify(check_val));
			//
			$.ajax({
                    url: url,
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:enterprisesIds,
                    contentType: "application/json;charset=UTF-8",
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
		
		//报表打印打印
		function openDownloadDialog(url, saveName)
		    {
		        if(typeof url == 'object' && url instanceof Blob)
		        {
		            url = URL.createObjectURL(url); // 创建blob地址
		        }
		        var aLink = document.createElement('a');
		        aLink.href = url;
		        aLink.download = saveName || ''; // HTML5新增的属性，指定保存文件名，可以不要后缀，注意，file:///模式下不会生效
		        var event;
		        if(window.MouseEvent) event = new MouseEvent('click');
		        else
		        {
		            event = document.createEvent('MouseEvents');
		            event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
		        }
		        aLink.dispatchEvent(event);
		    }
		 
		function sheet2blob(sheet, sheetName) {
		    sheetName = sheetName || 'sheet1';
		    var workbook = {
		        SheetNames: [sheetName],
		        Sheets: {}
		    };
		    workbook.Sheets[sheetName] = sheet;
		    // 生成excel的配置项
		    var wopts = {
		        bookType: 'xlsx', // 要生成的文件类型
		        bookSST: false, // 是否生成Shared String Table，官方解释是，如果开启生成速度会下降，但在低版本IOS设备上有更好的兼容性
		        type: 'binary'
		    };
		    var wbout = XLSX.write(workbook, wopts);
		    var blob = new Blob([s2ab(wbout)], {type:"application/octet-stream"});
		    // 字符串转ArrayBuffer
		    function s2ab(s) {
		        var buf = new ArrayBuffer(s.length);
		        var view = new Uint8Array(buf);
		        for (var i=0; i!=s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
		        return buf;
		    }
		    return blob;
		}
		
		//导出
        $("#btn-export").on("click", function () {
        	$("#btn-export").attr("disabled",true);
		    var tableDom = document.getElementById("dataTable"); //只能导出当前分页，以后最好是由后台直接返回json
		    var sheet = XLSX.utils.table_to_sheet(tableDom);
		    var titlte ="商家清单"+".xlsx";
		    openDownloadDialog(sheet2blob(sheet), titlte);
		    setInterval(function(){
		    	$("#btn-export").attr("disabled",false);           
		    },2000);
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
 
            //alert(JSON.stringify(data));
            $("input[name=id]").val(data.id);
            $("input[name=name]").val(data.name);
            $("input[name=encode]").val(data.encode);
            //$("input[name=boxIp").attr("readonly","readonly");
            $("input[name=address]").val(data.address);
            $("input[name=contactperson]").val(data.contactperson);
            $("input[name=contactphone]").val(data.contactphone);
            $("textarea[name=introduction]").val(data.introduction);
            $("textarea[name=qualify]").val(data.qualify);
            $("select[name=isactive]").val(data.isactive);
            
                        
			
            url = "<%=request.getContextPath()%>/rest/department/saveEnterpriseInfor";

			$("#myModalLabel").html("<b>修改商家信息</b>");
            $("#editModal").modal("show");
            
            //下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
            
        });
	function inputvalidator()
	{		
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
						<%-- boxIp : {
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
						}, --%>
						name : {
							validators : {
								notEmpty : {
									message : '请输入名称'
								}
							}
						},
						encode : {
							validators : {
								notEmpty : {
									message : '请输入执照号'
								}
							}
						}
						
					}/* end field */
				}).on("success.form.bv",function(e){					
					
					e.preventDefault(); //防止重复提交						
				}); /* end $('#editForm').bootstrapValidator */
		}
		
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
            
           	$("#editForm").bootstrapValidator('validate'); //提交验证
			if ($("#editForm").data('bootstrapValidator').isValid()) { //获取验证结果，如果成功，执行下面代码
				//alert("yes"); //验证成功后的操作，如ajax
				if(confirm("确定提交么？")){
					var params = form.getFormSimpleData();
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
			}
           
			//下边2行清除上次验证结果
			$("#editForm").data('bootstrapValidator').destroy();
			$("#editForm").data('bootstrapValidator', null);
			inputvalidator();
            
        });
        $("#btn-cancel").on("click", function () {
			$("#editModal").modal("hide");
		});
		//删除
        $("#dataTable tbody").on("click", "#delRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
                      
            if (confirm("是否确认删除这条信息?")) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/rest/department/deleteEnterprise",
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
