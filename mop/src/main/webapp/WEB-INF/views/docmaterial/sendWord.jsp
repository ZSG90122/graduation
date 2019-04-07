<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>文档查询</title>
<%@include file="../common/head.jsp"%>
<script
	src="<%=request.getContextPath()%>/assets/js/jquery-1.11.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.js"></script>
	<style type="text/css">
		#sendWord-modal .form-group{ margin-right: 0px;margin-left: 0px;} 
	</style>
</head>
<body>
	<div style="margin:40px 50px 20px 50px;">
		<div class="row">
			<form class="form-horizontal">
				<div class="form-group">
					<label for="stoneProject" class="col-sm-2 control-label">查询条件</label>
					<div class="col-sm-2">
						<select class="form-control" id="quertyconditon">
							<option value="1">关键词</option>
							<option value="2">文档名称</option>
							<option value="3">文档类别</option>
						</select>
					</div>
					<div class="col-sm-3 quertyinput">
						<input type="text" class="form-control" id="quertyInfo">
					</div>
					<div class="col-sm-1">
						<button type="button"
							class="btn btn-info pull-right projectQuerty">查询</button>
					</div>
				</div>
			</form>
			<div class="box" style="margin-top: 30px;">
				<div class="box-header with-border">
					<h3 class="box-title">文档列表</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th style="width: 4%">序号</th>
								<th style="width: 20%">文档名称</th>
								<th style="width: 30%">文档简介</th>
								<th style="width: 14%">关键词</th>
								<th style="width: 9%">类别</th>
								<th style="width: 8%">上传时间</th>
								<th style="width: 8%">上传用户</th>
								<th style="width: 4%">操作</th>
							</tr>
							<tr>
								<td>1.</td>
								<td>大足机场改扩建批头文件</td>
								<td>大足机场改扩建批头文件包含了该工程的申请批准等信息</td>
								<td>审批 工程立项 资金申请</td>
								<td>专业技术文档</td>
								<td>2017-8-9</td>
								<td>XXXX</td>
								<td><a href="#" class="label btn-success"
									data-toggle="modal" data-target="#sendWord-modal">分发</a></td>
							</tr>
							<tr>
								<td>2.</td>
								<td>大足机场改扩建批头文件</td>
								<td>大足机场改扩建批头文件包含了该工程的申请批准等信息</td>
								<td>审批 工程立项 资金申请</td>
								<td>专业技术文档</td>
								<td>2017-8-9</td>
								<td>XXXX</td>
								<td><a href="#" class="label btn-success"
									data-toggle="modal" data-target="#sendWord-modal">分发</a></td>
							</tr>
							<tr>
								<td>3.</td>
								<td>大足机场改扩建批头文件</td>
								<td>大足机场改扩建批头文件包含了该工程的申请批准等信息</td>
								<td>审批 工程立项 资金申请</td>
								<td>专业技术文档</td>
								<td>2017-8-9</td>
								<td>XXXX</td>
								<td><a href="#" class="label btn-success"
									data-toggle="modal" data-target="#sendWord-modal">分发</a></td>
							</tr>
							<tr>
								<td>4.</td>
								<td>大足机场改扩建批头文件</td>
								<td>大足机场改扩建批头文件包含了该工程的申请批准等信息</td>
								<td>审批 工程立项 资金申请</td>
								<td>专业技术文档</td>
								<td>2017-8-9</td>
								<td>XXXX</td>
								<td><a href="#" class="label btn-success"
									data-toggle="modal" data-target="#sendWord-modal">分发</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="box-footer clearfix">
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">«</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">»</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--  选择用户接口-->
	<div class="modal modal-default fade in" id="sendWord-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">选择文档分发用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="stoneProject" class="col-sm-2 control-label">查询条件</label>
							<div class="col-sm-3">
								<select class="form-control" id="quertyconditon">
									<option value="1">建设单位</option>
									<option value="2">组织部门</option>
									<option value="3">姓名</option>
								</select>
							</div>
							<div class="col-sm-4 quertyinput">
								<input type="text" class="form-control" id="quertyInfo">
							</div>
							<div class="col-sm-2">
								<button type="button"
									class="btn btn-info pull-right projectQuerty">查询</button>
							</div>
						</div>
						<div class="form-group">
							<table class="table table-condensed table-hover table-striped">
								<thead>
									<tr>
										<th>选择</th>
										<th>序号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>工作地点</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" id="inlineCheckbox1"
											value="option1"></td>
										<td>1</td>
										<td>XXX</td>
										<td>男</td>
										<td>华南建设集团</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="inlineCheckbox1"
											value="option1"></td>
										<td>2</td>
										<td>XXX</td>
										<td>男</td>
										<td>华南建设集团</td>
									</tr>
									<tr>
										<td><input type="checkbox" id="inlineCheckbox1"
											value="option1"></td>
										<td>3</td>
										<td>XXX</td>
										<td>男</td>
										<td>华南建设集团</td>
									</tr>

								</tbody>
							</table>
							<ul class="pagination pagination-sm no-margin pull-right">
				                <li><a href="#">«</a></li>
				                <li><a href="#">1</a></li>
				                <li><a href="#">2</a></li>
				                <li><a href="#">3</a></li>
				                <li><a href="#">»</a></li>
				              </ul>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  pull-left btn-danger"
						data-dismiss="modal">取消</button>
					<button id="sendwordtouser" type="button" class="btn  btn-success" data-dismiss="modal">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<script type="text/javascript">
		$(function() {
			$("#sendWord-modal").on('hidden.bs.modal',function(){
				alert("文档分发成功");
			})
			
		})
	</script>
</body>
</html>
