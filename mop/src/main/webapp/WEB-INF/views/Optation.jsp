<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<ul class=" nav nav-tabs myTab1">
	<li class="active"><a data-toggle="tab" href="#sectionB"
		class="SiteInfo_char">站点监督</a></li>
	<li><a data-toggle="tab" href="#sectionC">参数配置</a></li>
	<li><a data-toggle="tab" href="#sectionA">基本信息</a></li>
	<li><a data-toggle="tab" href="#sectionD">报警信息</a></li>
</ul>
<div class="tab-content" style="margin-top: 20px;">
	<div id="sectionB" class="tab-pane  fade in active">
		<section class="content-header siteInfo_input ">
			<div class="row">
				<div class="col-md-12"  style="height: 130px;">
					<div class="col-md-3 col-sm-3">
						<div class="form-group">
							<ul>
								<li id="stationArge"></li>
								<li id="stationGroue"></li>
								<li id="stationStreet"></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
							<div class="form-group timeFormGroup">
								<span>当前时间:&nbsp;&nbsp;&nbsp;</span><div id="retroclockbox1"></div>
							</div>
							<div class="form-group timeFormGroup">
								<span>站点时间:&nbsp;&nbsp;&nbsp;</span><div id="retroclockbox2"></div>
							</div>
					</div>
					<div class="col-md-1 col-sm-1 text-center" style="padding: 0px;">
						<span>&nbsp;&nbsp;光强</span>
						 <div class="tempGauge0"></div>
					</div>
					<div class="col-md-1 col-sm-1 text-center">
						<span>&nbsp;&nbsp;温度</span>
						<div class="tempGauge1"></div>
					</div>
					<div class="col-md-1 col-sm-1 text-center">
						<span>&nbsp;&nbsp;湿度</span>
						 <div class="tempGauge2"></div>
					</div>
					<div class="col-md-2 col-sm-2 text-center">
						 <button type="button" class="btn btn-sm btn-primary"
						 id="littleArgeRefresh_1" >实时刷新</button>
					</div>
			    </div>
				<div class="col-md-12">
					<div class="col-md-7">
						<div class="box box-primary">
							<div class="box-header with-border">
								<span style="line-height:30px;font-size: 20px;">电流信息</span>
								<span id="sumVoltInfo" style="line-height:30px;font-size: 16px;margin-left: 40px;"></span>
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="box-body">
								<div class="chart" id="mybarChart"
									style="width: 400px;height:260px;margin: 0 auto;"></div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="box box-primary">
							<div class="box-header with-border">
								<form class="form-inline">
									<span>&nbsp;&nbsp;最近连续:</span>
									<div class="form-group">
										<select class="form-control" id="optionRoultval">
											<option value="1">第1路</option>
											<option value="2">第2路</option>
											<option value="3">第3路</option>
											<option value="4">第4路</option>
											<option value="5">第5路</option>
											<option value="6">第6路</option>
											<option value="7">总电压</option>
											<option value="8">总电流</option>
										</select>
									</div>
									<a href="#" type="button" class="btn btn-primary"
										id="showOptionRoul_x" style="margin-left: 20px">显示</a>
									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
								</form>

							</div>
							<div class="box-body">
								<div class="chart" id="barChart"
									style="width: 300px;height:258px;margin: 0 auto;"></div>
								<!-- /.box-body -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<span style="line-height:30px;font-size: 20px;">控制信息</span>
								<div class="checkbox pull-right checkbox-slider--a" style="margin-right: 30px;">
									 <label > <input type="checkbox" value="1" id="contralAllInfo"><span style="font-size: 16px;" 
									 class="contral_checkbox">总开关</span> </label>
								</div>
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								
							</div>
							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-hover Site_table text-center"
										id="TorFClass">
										<tr id="inputOnline_ControlInfoTh">
											<th></th>
											<th>1路</th>
											<th>2路</th>
											<th>3路</th>
											<th>4路</th>
											<th>5路</th>
											<th>6路</th>
										</tr>
									</table>
								</div>
								<div class="text-center">
									烟雾<a href="#" class="btn  ctl_smoke"
										style="margin:auto 10px; cursor:auto;" disabled></a> 门磁<a
										href="#" class="btn ctl_door"
										style="margin:auto 10px;cursor:auto;" disabled></a> 漏水<a
										href="#" class="btn  ctrl_water"
										style="margin:auto 10px;cursor:auto;" disabled></a>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>
	<div id="sectionC" class="tab-pane">
		<section class="content-header ">
			<div class="row">
				<div class="col-md-offset-1 col-md-10">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;自动开灯设置:</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<form class="form-inline" id="autoOpenLightInfo" action="#"
								method="post">
								<div class="form-group">
									<label for="checkbox ">开启自动开灯: <input type="checkbox"
										id="checkbox" name="autoOpen" value="1"
										style="margin-left:10px;"></label> <label
										style="margin-left: 60px;">光照阀值:&nbsp;&nbsp; <input
										type="text" id="light_range" class="form-control"
										placeholder="23~68流明">
									</label>
								</div>
								<button type="button" class="btn btn-default pull-right"
									id="autoOpenLight">配置</button>
							</form>
						</div>
						<!-- /.box-body-->
					</div>
				</div>
				<div class="col-md-offset-1 col-md-10">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;开关灯时间设置:</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<form class="form-inline" id="OpenLightTimeInfo" action="#"
								method="post">
								<div class="form-group form_input">
									<div class="bootstrap-timepicker"
										style="display: inline-block;">
										<div class="form-group">
											<label>开灯时间:</label> <input type="text"
												class="form-control timepicker" id="openStartTime"
												readonly="readonly">
										</div>
									</div>
									<div class="bootstrap-timepicker"
										style="display: inline-block;margin-left: 20px;">
										<div class="form-group">
											<label>关灯时间:</label> <input type="text" id="openEndTime"
												class="form-control timepicker" readonly="readonly">
											<!-- /.input group -->
										</div>
										<!-- /.form group -->
									</div>
								</div>
								<button type="button" class="btn btn-default pull-right"
									id="openLightTime">配置</button>
							</form>
						</div>
					</div>
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;定时发送数据:</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<form class="form-inline" method="post">
								<div class="form-group form_input" id="checkbox4">
									<label for="checkbox4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="checkbox4name" value="1">&nbsp;&nbsp;发送间隔:
										<input type="text" id="time" class="form-control"
										placeholder="时间">
									</label>
								</div>
								<button type="button" class="btn btn-default pull-right"
									id="regularsend">配置</button>
							</form>
						</div>
						<!-- /.box-body-->
					</div>
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;开启模式配置:</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<form id="openStateForm" target="nm_iframe" method="post">
								<table class="ParaConfigur_input model_th">
									<tr>
										<th style="width: 60px;"></th>
										<th>1</th>
										<th>2</th>
										<th>3</th>
										<th>4</th>
										<th>5</th>
										<th>6</th>
									</tr>
									<tr id="openState_input">
										<td>开启模式</td>
										<td><input name="swt1" value="1" type="checkbox"></td>
										<td><input name="swt2" value="1" type="checkbox"></td>
										<td><input name="swt3" value="1" type="checkbox"></td>
										<td><input name="swt4" value="1" type="checkbox"></td>
										<td><input name="swt5" value="1" type="checkbox"></td>
										<td><input name="swt6" value="1" type="checkbox"></td>
									</tr>
								</table>
								<button type="button" class="btn btn-default pull-right"
									id="openState">配置</button>
							</form>
							<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
						</div>
						<!-- /.box-body-->
					</div>
					<div class="box box-primary collapsed-box">
						<div class="box-header with-border">
							<h3 class="box-title">&nbsp;&nbsp;专业配置:</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<div class="box-body" style="display: none;">
							<form class="form-inline" action="#" method="post">
								<div class="col-md-7">
									<label>参考电流电压设置</label>
									<hr>
									<table class="ParaConfigur_input">
										<tr>
											<th style="width: 30px;">说明</th>
											<th>参考值</th>
											<th>修正值a</th>
											<th>修正值b</th>
										</tr>
										<tr>
											<td>支路1：</td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
										</tr>
										<tr>
											<td>支路2：</td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
										</tr>
										<tr>
											<td>支路3：</td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
										</tr>
										<tr>
											<td>支路4：</td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
											<td><input type="text" class="ParaCo_input"
												placeholder="19:00"></td>
										</tr>
									</table>
								</div>
								<div class="col-md-5">
									<div class="form-group ParaConfigur_input">
										<label>波动范围:&nbsp; <input type="text"
											style="width: 40px;">&nbsp;%
										</label>
										<hr>
										<p class="text-center">
											<label>参考值</label>
										</p>
										<label>电压1:&nbsp;&nbsp; <input type="text"
											class="ParaCo_input" placeholder="19:00">
										</label> <label>电压2:&nbsp;&nbsp; <input type="text"
											class="ParaCo_input" placeholder="19:00">
										</label> <label>电压3:&nbsp;&nbsp; <input type="text"
											class="ParaCo_input" placeholder="19:00">
										</label> <label>电压4:&nbsp;&nbsp; <input type="text"
											class="ParaCo_input" placeholder="19:00">
										</label> <label>电压5:&nbsp;&nbsp; <input type="text"
											class="ParaCo_input" placeholder="19:00">
										</label> <label>电压6:&nbsp;&nbsp; <input type="text"
											class="ParaCo_input" placeholder="19:00">
										</label>
									</div>
								</div>
								<button type="submit" class="btn btn-default pull-right">配置</button>
							</form>
							<div class="col-md-12">
								<hr>
								<label>数据读取设置</label>
								<form class="form-inline" action="#" method="post">
									<div class="form-group">
										<label for="checkbox1"> <input type="checkbox"
											id="checkbox1">存储格式化
										</label> <label for="checkbox2" style="margin-left: 30px;"> <input
											id="checkbox2" type="checkbox">开启记录有效
										</label> <label for="checkbox3" style="margin-left: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;校准时间:
											<input type="text" class="form-control" placeholder="时间">
										</label>
									</div>
									<button type="submit" class="btn btn-default pull-right">配置</button>
								</form>
							</div>
						</div>
						<!-- /.box-body-->
					</div>
					<button class="btn">保存为模板</button>
				</div>
			</div>
		</section>
	</div>
	<div id="sectionA" class="tab-pane">
		<section class="content-header row">
			<div class="form-inline sectionA_boderStyle">
				<input style="display: none;" type="text" id="inputTbId" />
				<div class="form-group">
					<label for="inputarge" class="control-label ">城市：</label> <input
						type="text" class="form-control" id="inputcity"
						readonly="readonly"> <label for="inputground"
						class="control-label">站名：</label> <input type="text"
						class="form-control" id="inputstation" readonly="readonly">
				</div>
				<div class="form-group" style="margin-top: 20px;">
					<label for="inputline" class="control-label ">经度：</label> <input
						type="text" class="form-control" id="inputline"
						readonly="readonly"> <label for="inputrow"
						class="control-label ">纬度：</label> <input type="text"
						class="form-control" id="inputrow" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="inputLocal" class="control-label">位置：</label> <input
						type="text" class="form-control" id="inputLocal"
						readonly="readonly"> <label for="inputIP4"
						class="control-label">IP：</label> <input type="text"
						class="form-control" id="inputIP" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="inputIP2" class="control-label col-md-1"
					style="padding-right: 8px;">说明：</label>
				<div class="col-md-10">
					<textarea class="form-control" rows="6" style="max-width:90%;"
						placeholder="读取时间范围最新记录信息" id="inputTextarea" readonly="readonly"></textarea>
				</div>
			</div>
		</section>
	</div>
	<div id="sectionD" class="tab-pane">
		<section class="content-header row">
			<div class="col-md-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span>&nbsp;&nbsp;报警信息</span>
					</div>
					<div class="table-responsive">
						<table class="table table-hover getOnlineWarn_table"
							id="WaringTable">
							<tr>
								<th>序号</th>
								<th>类型</th>
								<th>状态</th>
								<th>时间</th>
								<th>说明</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span style="font-size: 15px; font-weight: bold;">&nbsp;&nbsp;RFID:</span>
					</div>
					<div class="panel-body">
						<textarea class="form-control" rows="3" style="max-width:270px;"
							placeholder="读取当前最新信息"></textarea>
					</div>
				</div>
				<div class="panel panel-default">
					<span style="font-size: 15px; font-weight: bold;line-height: 40px;">&nbsp;&nbsp;最新信息:</span>
					<ul class="nav nav-tabs NewInfo_nav">
						<li class="active"><a data-toggle="tab" href="#InfosectionA">读取最近</a></li>
						<li><a data-toggle="tab" href="#InfosectionB">读取全部</a></li>
						<li><a data-toggle="tab" href="#InfosectionC">读取时间范围</a></li>
					</ul>
					<div class="tab-content">
						<div id="InfosectionA" class="tab-pane fade in active">
							<div class="box-body">
								<textarea class="form-control" rows="3" style="max-width:270px;"
									placeholder="读取当前最新记录信息"></textarea>
							</div>
						</div>
						<div id="InfosectionB" class="tab-pane fade">
							<div class="box-body">
								<textarea class="form-control" rows="3" style="max-width:270px;"
									placeholder="读取全部最新记录信息"></textarea>
							</div>
						</div>
						<div id="InfosectionC" class="tab-pane fade">
							<div class="box-body">
								<textarea class="form-control" rows="3" style="max-width:270px;"
									placeholder="读取时间范围最新记录信息"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
