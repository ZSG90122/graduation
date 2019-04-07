<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- 这里是首页右边的操作栏 -->
<ul class="nav nav-tabs nav-justified control-sidebar-tabs ss"
			style="background:#333; margin-top:10px;margin-left: 10px;display:inline-block;width: 40px;">
			<li><a href="#" data-toggle="control-sidebar"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Create the tabs -->
		<!-- <h2 style="color:#fff;">&nbsp;&nbsp;便捷操作</h2>

		<ul class="nav nav-tabs nav-justified control-sidebar-tabs"
			style="margin-bottom: 10px;margin-left: 10px;">
			<li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
		</ul> -->

		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<ul class="control-sidebar-menu">
					<li>
						<div class="right_body">
							<div style="margin-left: 50px">
								<a href="#" class="btn btn-primary btn-lg" role="button">统计分析</a>
								<a href="#" class="btn btn-primary btn-lg" role="button">报警分析</a>
								<a href="#" class="btn btn-primary btn-lg" role="button">帮助
									<span class="glyphicon glyphicon glyphicon-question-sign"
									aria-hidden="true"></span>
								</a>
							</div>
							<form class="form-inline" style="margin: 30px 0 30px 0;">
								<div class="form-group">
									<label for="exampleInputName2">片区</label> <select
										class="form-control" id="exampleInputName2"
										style="width: 150px;">
										<option>1</option>
										<option>2</option>
										<option>3</option>
									</select>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail2">分组</label> <select
										class="form-control" id="exampleInputEmail2"
										style="width: 150px;">
										<option>1</option>
										<option>2</option>
										<option>3</option>
									</select>
								</div>
								<div class="btn-group " role="group">
									<a href="#" data-toggle="tooltip" data-placement="left"
										title="开灯" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/light_off.png"></a>
									<a href="#" data-toggle="tooltip" data-placement="top"
										title="关灯" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/light_on.svg"></a>
									<a href="#" data-toggle="tooltip" data-placement="bottom"
										title="查询" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/u112.png"></a>
									<a href="#" data-toggle="tooltip" data-placement="right"
										title="设置" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/u110.png"></a>
								</div>
							</form>
							<table id="convenient_OptainTable" class="table  table-bordered bg-teal-active">
								<thead>
									<tr>
										<th>状态</th>
										<th>站号</th>
										<th>名称</th>
										<th>状态</th>
										<th>告警</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/AdminLTE/dist/img/u99.png"
											style="display: inline-block;width: 40px;height: 40px;border-radius: 5px;">
										</td>
										<td>John</td>
										<td>Carter</td>
										<td><a>johncarter</a></td>
										<td>johncarter</td>
									</tr>
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/AdminLTE/dist/img/u101.png"
											style="display: inline-block;width: 40px;height: 40px;border-radius: 5px;">
										</td>
										<td>John</td>
										<td>Carter</td>
										<td><a>johncarter</a></td>
										<td>johncarter</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div>
		</div>