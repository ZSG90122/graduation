<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>区组管理</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
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
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>片区/分组管理</h1>

			</section>

			<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-md-3">

						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<div id="tree"></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="box box-primary">
							<div class="box-header with-border">
								<div class="btn-group">
									<button type="button" class="btn btn-default"
										data-btn-type="addRoot">
										<li class="fa fa-plus">&nbsp;新增片区</li>
									</button>
									<button type="button" class="btn btn-default"
										data-btn-type="add">
										<li class="fa fa-plus">&nbsp;新增分组</li>
									</button>
									<button type="button" class="btn btn-default"
										data-btn-type="edit">
										<li class="fa fa-edit">&nbsp;编辑当前</li>
									</button>
									<button type="button" class="btn btn-default"
										data-btn-type="delete">
										<li class="fa fa-remove">&nbsp;删除当前</li>
									</button>
								</div>
								<!-- /.box-tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<form class="form-horizontal" id="function-form">
									<input type="hidden" name="parentId" />
									<div class="form-group">
										<label for="parentName" class="col-sm-2 control-label">上级</label>

										<div class="col-sm-9">
											<input type="text" class="form-control" disabled="disabled"
												id="parentName" name="parentName" placeholder="上级">
										</div>
									</div>
									<div class="form-group">
										<label for="levelcode" class="col-sm-2 control-label">层级编码</label>

										<div class="col-sm-9">
											<input type="text" class="form-control" id="levelcode" disabled="disabled"
												name="levelcode" placeholder="层级编码">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-sm-2 control-label">名称</label>

										<div class="col-sm-9">
											<input type="text" class="form-control" id="name" name="name"
												placeholder="名称">
										</div>
									</div>
									<div class="form-group">
										<label for="code" class="col-sm-2 control-label">编码</label>

										<div class="col-sm-9">
											<input type="text" class="form-control" id="code" name="code"
												placeholder="编码">
										</div>
									</div>

									<div class="form-group">
										<label for="remark" class="col-sm-2 control-label">说明</label>
										<div class="col-sm-9">
											<textarea class="form-control" id="remark" name="remark"
												placeholder="说明"></textarea>
										</div>
									</div>
									<div class="box-footer" style="display:none">
										<div class="text-center">
											<button type="button" class="btn btn-default"
												data-btn-type="cancel">
												<i class="fa fa-reply">&nbsp;取消</i>
											</button>
											<button type="submit" class="btn btn-primary">
												<i class="fa fa-save">&nbsp;保存</i>
											</button>
										</div>
									</div>
								</form>
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
</body>
</html>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery.form.js"></script>

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
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/iCheck/icheck.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>
<!-- 从admineap拷贝过来的 -->
<script 
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/dist/js/base-form.js"></script>
<script>
	       //初始化form表单
	       var modals = {
　　　　			name: "这个ds没有从admineap复用",
　　　　			info: function(msg){ alert(msg); }
　　			}; 

			var form = null;
			var winId='iconWin';
			$(function() {
				form=$('#function-form').form();
				console.log(form);
				initTree(0);
				//初始化校验
				$('#function-form').bootstrapValidator({
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
									message : '请输入编码'
								},
								stringLength: {
                          			min: 3,
                          			max: 3,
                          			message: '必须为3位'
                      			},
                      			threshold: 3,
						        remote:{
						        	url:'<%=request.getContextPath()%>/rest/AreaGroupManager/checkCodeUnique',
						        	data: function(validator) {
			                            return {
			                                //className:'com.cnpc.framework.base.entity.Function',
			                                //fieldName:'code',
			                                fieldValue:$('#code').val(),
			                                id:$('#id').val()
			                            };
			                        },
						        	message:'该编码已被使用'
						        }
							}
						}
						
					}
				}).on("success.form.bv",function(e){					
					if(confirm("确定提交么？")){
						var params = form.getFormSimpleData();
						//alert(JSON.stringify(params));
						ajaxPost('<%=request.getContextPath()%>/rest/AreaGroupManager/save', params, function(data, status) {
							if (data.success) {
								//var id=$("input[name='id']").val();
								var selectedArr=$("#tree").data("treeview").getSelected();
								var selectedNodeId=selectedArr.length>0?selectedArr[0].nodeId:0;
								   initTree(selectedNodeId);
							}
						});
					}
					e.preventDefault(); //防止重复提交
							
				});
				
				form.initComponent();
				//按钮事件
				var btntype=null;
				$('button[data-btn-type]').click(function() {
					var action = $(this).attr('data-btn-type');
					var selectedArr=$("#tree").data("treeview").getSelected();
					var selectedNode=selectedArr.length>0?selectedArr[0]:null;
					switch (action) {
					case 'addRoot':
						formWritable(action);
						form.clearForm();
						$("#icon_i").removeClass();
						//填充上级菜单和层级编码
						fillParentAndlevelcode(null);
						btntype='add';
						break;
					case 'add':
						if(!selectedNode){
							modals.info('请先选择上级菜单');
							return false;
						}
						if(selectedNode.levelcode > 0){
							alert("请选择区域，然后添加分组！");
							return false;
						}
						formWritable(action);
						form.clearForm();
						$("#icon_i").removeClass();
						//填充上级菜单和层级编码
						fillParentAndlevelcode(selectedNode);
						btntype='add';
						break;
					case 'edit':
						if(!selectedNode){
							modals.info('请先选择要编辑的节点');
							return false;
						}
						if(btntype=='add'){
							fillDictForm(selectedNode);
						}
						formWritable(action);
						btntype='edit';
						break;
					case 'delete':
						if(!selectedNode){
							modals.info('请先选择要删除的节点');
							return false;
						}
						if(btntype=='add')
							fillDictForm(selectedNode);
							formReadonly();
							$(".box-header button[data-btn-type='delete']").removeClass("btn-default").addClass("btn-primary");
					    	if(selectedNode.nodes){
					    		modals.info('该节点含有子节点，请先删除子节点');
					    		return false;
					    }
					    if(confirm("确定提交么？")){
							ajaxPost("<%=request.getContextPath()%>/rest/AreaGroupManager/delete/"+selectedNode.id,null,function(data){
					    		if(data.success){
					    		   modals.info('删除成功');
					    		}else{
					    		   modals.info(data.message);
					    		}
					    		//定位
					    		var brothers=$("#tree").data("treeview").getSiblings(selectedNode);
					    		if(brothers.length>0)
					    		   initTree(brothers[brothers.length-1].nodeId);
					    		else{
					    		   var parent=$("#tree").data("treeview").getParent(selectedNode);
					    		   initTree(parent?parent.nodeId:0);
					    		}
					    	});
						}
					    <%-- modals.confirm('是否删除该节点',function(){
					    	ajaxPost("<%=request.getContextPath()%>/rest/function/delete/"+selectedNode.id,null,function(data){
					    		if(data.success){
					    		   modals.correct('删除成功');
					    		}else{
					    			modals.info(data.message);
					    		}
					    		//定位
					    		var brothers=$("#tree").data("treeview").getSiblings(selectedNode);
					    		if(brothers.length>0)
					    		   initTree(brothers[brothers.length-1].nodeId);
					    		else{
					    		   var parent=$("#tree").data("treeview").getParent(selectedNode);
					    		   initTree(parent?parent.nodeId:0);
					    		}
					    	});
					    }); --%>
						break;
					case 'cancel':
						if(btntype=='add')
							fillDictForm(selectedNode);
						formReadonly();
						break;
					case 'selectIcon':
						var disabled=$(this).hasClass("disabled");
				        if(disabled)
				        	break;
						var iconName;
						if($("#icon").val())
						   iconName=encodeURIComponent($("#icon").val());
						modals.openWin({
                        	winId:winId,
                        	title:'图标选择器（双击选择）',
                        	width:'1000px',
                        	url:basePath+"/icon/nodecorator/select?iconName="+iconName
                        });
						break;
					}
				});
			})

			function initTree(selectNodeId){
				var treeData = null;
				ajaxPost("<%=request.getContextPath()%>/rest/AreaGroupManager/treeData", null, function(data) {
					treeData = data;
					//console.log(JSON.stringify(treeData));
					//alert(JSON.stringify(treeData));
				});
				
				$("#tree").treeview({
					data : treeData,
					showBorder : true,
					expandIcon : "glyphicon glyphicon-stop",
					collapseIcon : "glyphicon glyphicon-unchecked",
					levels : 1,
					onNodeSelected : function(event, data) { 
						fillDictForm(data);
						formReadonly();
						//console.log(JSON.stringify(data));
					}
				});
				if(treeData.length==0)
					return;
				//默认选中第一个节点
				selectNodeId=selectNodeId||0;
				$("#tree").data('treeview').selectNode(selectNodeId);
				$("#tree").data('treeview').expandNode(selectNodeId);
				$("#tree").data('treeview').revealNode(selectNodeId);
			}

			//新增时，带入父级菜单名称id,自动生成levelcode
			function fillParentAndlevelcode(selectedNode){
				$("input[name='parentName']").val(selectedNode?selectedNode.text:'系统平台');
			    $("input[name='deleted'][value='0']").prop("checked","checked");
			    if(selectedNode){
			    	$("input[name='parentId']").val(selectedNode.id);
					$("input[name='levelcode']").val(parseInt(selectedNode.levelcode)+1);
			    } else{
			    	$("input[name='parentId']").val(null);
					$("input[name='levelcode']").val(0);
			    }
			}

			//填充form
			function fillDictForm(node){
				form.clearForm();
				ajaxPost("<%=request.getContextPath()%>/rest/AreaGroupManager/get/"+node.id,null,function(data){
					//alert(JSON.stringify(data));
					form.initFormData(data);
					fillBackIconName(data.icon);
				})
			}

			//设置form为只读
			function formReadonly(){
				//所有文本框只读
				$("input[name],textarea[name]").attr("readonly","readonly");
				//隐藏取消、保存按钮
				$("#function-form .box-footer").hide();
				//还原新增、编辑、删除按钮样式
				$(".box-header button").removeClass("btn-primary").addClass("btn-default");
				//选择图标按钮只读
				$("#selectIcon").addClass("disabled");
				//还原校验框
				if($("function-form").data('bootstrapValidator'))
					$("function-form").data('bootstrapValidator').resetForm();
			}

			function formWritable(action){
				$("input[name],textarea[name]").removeAttr("readonly");
				$("#function-form .box-footer").show();
				$(".box-header button").removeClass("btn-primary").addClass("btn-default");
				$("#selectIcon").removeClass("disabled");
				if(action)
					$(".box-header button[data-btn-type='"+action+"']").removeClass("btn-default").addClass("btn-primary");
			}

			//回填图标
			function fillBackIconName(icon_name){
				$("#icon").val(icon_name);
				$("#icon_i").removeClass().addClass("form-control-feedback").addClass(icon_name);
			}

		</script>
