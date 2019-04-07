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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/conmmon/css/toastr.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/bootstrap/css/bootstrap-datetimepicker.min.css">
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
            	<div class="col-sm-2" style="width: 60px">
					<label for=owerdep class="control-label">市州</label>
				</div>
				<div class="col-sm-2">
					<select class="form-control select2" id="queryowerdepid" name="owerdep">
					</select>
				</div>
				<div class="col-sm-2" style="width: 60px">
					<label for="leveltype" class="control-label">等级</label>
				</div>
				<div class="col-sm-1" style="width: 130px">
				<!-- 这个部分应该是用于展示所有遥控站的下拉列表的，要去数据库中查询 
				           查询获得数据的工作交给ajax
				-->
					<select class="form-control select2" id="queryleveltypeid" name="leveltype">
						<option value="-1">全部</option>
						<option value="0">A级站</option>
						<option value="1">B级站</option>
						<option value="2">C级站</option>
						<option value="3">D级站</option>
						<option value="4">小型站</option>
					</select>
				</div>
				<div class="col-sm-2" style="width: 60px">
					<label for="funtype" class="control-label">功能</label>
				</div>
				<div class="col-sm-1" style="width: 130px">
					<select class="form-control select2" id="queryfuntypeid" name="funtype">
						<option value="-1">全部</option>
						<option value="0">综合站</option>
						<option value="1">C波段</option>
						<option value="2">短波</option>
						<option value="3">铁路</option>
						<option value="4">航空</option>
					</select>
				</div>
						
						
                <div class="col-xs-2" style="width: 125px">
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
            <th>市州</th>
            <th>等级</th>
            <th>功能类别</th>
            <th>名称</th>
            <th>地址</th>
            <!-- <th>信息管理</th> -->
            <th>供应商</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>



    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-lg">
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
                        <input type="hidden" class="form-control" name="type" id='typeid' value='0'>
                        <div class="row-fluid">
                        <div class="pull-right">
                        <div class="btn-group">
                        	<button type="button" id="btn-loadmodel" class="btn btn-primary" ><i class="fa fa-save">&nbsp;导入模板</i></button>
                        </div>
                        
                        </div>
                        <div class="row" style="margin-left:0px;" >
                        	<h5>基本信息:</h5>
                        </div>
                        
                        </div>
      					<div class="panel panel-default" id="panel1">
						<div class="panel-body" > 
							<div class="form-group">
								<label for="contacts" class="col-sm-2 control-label">业主单位</label>
								<div class="col-sm-6">
									<select class="form-control select2" name="owerdep" id="owerdepid">
										<option value="1">四川省无线电监测站</option>
										<option value="2">自贡无线电监测站</option>
									</select>
								</div>
							</div>
							<div class="form-group" >					
                            	<label for="inputName" class="col-sm-2 control-label">遥控站名称</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="name" id="nameid">
                            	</div>
                            	<label for="inputName" class="col-sm-2 control-label">遥控站编号</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="code" id="codeid" placeholder="填入遥控站的编号">
                            	</div>
                        	</div> 
                        	<div class="form-group">							
                            	<label for="inputName" class="col-sm-2 control-label">建设地址</label>
                            	<div class="col-sm-10">
                                	<input type="text" class="form-control" name="address" id="addressid" placeholder="填入遥控站的地理位置">
                            	</div>                            	
                        	</div>
                        	<div class="form-group" >						
                            	<label for="inputName" class="col-sm-2 control-label">管理科室</label>
                            	<div class="col-sm-4">
                            		<input type="hidden" class="form-control" name="depid" id='depidid'>
                                	<input type="text" class="form-control" name="depidname" id="depidnameid" placeholder="点击选择" onclick="ShowDepart()">
                            	</div>
                            	<label for="inputName" class="col-sm-2 control-label">管理负责人</label>
                            	<div class="col-sm-4">
                            		<!-- <input type="hidden" class="form-control" name="mngpersonid" id='mngpersonidid'>
                                	<input type="text" class="form-control" name="mngpersonidname" id="mngpersonidnameid" placeholder="点击选择"> -->
                                	<select class="form-control select2" name="mngpersonid" id="mngpersonidid">
										<option value="1">张山</option>
										<option value="2">王五</option>
									</select>
                            	</div>                             	
                        	</div>  
                        	
                        	<div class="form-group" style="margin-bottom:-15px;" ><!-- panel的最后一排加入这个style  -->							
                            	<label for="inputName" class="col-sm-2 control-label">备注信息</label>
                            	<div class="col-sm-8">
                                	<textarea class="form-control" rows="3" name="remark" id="remarkid" placeholder="输入遥控站的介绍信息"></textarea>
                            	</div>                            	
                        	</div>                             
						</div>
						</div> <!-- name="panel1" -->
						<h5>类别信息:</h5>
      					<div class="panel panel-default" id="panel2">
						<div class="panel-body" > 
							<div class="form-group">
								<label for="contacts" class="col-sm-2 control-label">等级类别</label>
								<div class="col-sm-10">
									<label class="radio-inline">
										<input type="radio" name="leveltype" id="leveltypeid0" value="0" checked> A级站
									</label>
									<label class="radio-inline">
										<input type="radio" name="leveltype" id="leveltypeid1" value="1" > B级站
									</label>
									<label class="radio-inline">
										<input type="radio" name="leveltype" id="leveltypeid2" value="2" > C级站
									</label>
									<label class=radio-inline>
										<input type="radio" name="leveltype" id="leveltypeid3" value="3" > D级站
									</label>
									<label class="radio-inline">
										<input type="radio" name="leveltype" id="leveltypeid4" value="4" > 小型站
									</label>
								</div>
							</div>
							
                        	
                        	<div class="form-group" style="margin-bottom:-15px;" ><!-- panel的最后一排加入这个style  -->							
                            	<label for="inputName" class="col-sm-2 control-label">功能类别</label>
                            	<div class="col-sm-10">
                                	<label class="radio-inline">
										<input type="radio" name="funtype" id="funtypeid0" value="0" checked> 综合站
									</label>
									<label class="radio-inline">
										<input type="radio" name="funtype" id="funtypeid1" value="1" > C波段
									</label>
									<label class="radio-inline">
										<input type="radio" name="funtype" id="funtypeid2" value="2" > 短波站
									</label>
									<label class="radio-inline">
										<input type="radio" name="funtype" id="funtypeid3" value="3" > 铁路监测
									</label>
									<label class="radio-inline">
										<input type="radio" name="funtype" id="funtypeid4" value="4" > 航空监测
									</label>
                            	</div>                            	
                        	</div>                             
						</div>
						</div> <!-- name="panel2" -->
                        
                        <h5>具备功能:</h5>
      					<div class="panel panel-default" id="panel2">
						<div class="panel-body" > 
							<div class="form-group">
								<label for="contacts" class="col-sm-1 control-label"></label>
								<div class="col-sm-10">
									<label class="checkbox-inline">
										<input type="checkbox" name="funtionlist" id="leveltypeid0" value="0" checked> 测量
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="funtionlist" id="leveltypeid1" value="1" checked> 测向
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="funtionlist" id="leveltypeid2" value="2" checked> 防雷
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="funtionlist" id="leveltypeid3" value="3" checked> 环控
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="funtionlist" id="leveltypeid4" value="4" checked> 短波监测
									</label>
								</div>
							</div>             
						</div>
						</div> <!-- name="panel3" -->
						<h5>配置信息:</h5>
                        <div class="panel panel-default" id="panel4">
						<div class="panel-body" > 							
							<div class="form-group" >					
                            	<label for="inputName" class="col-sm-2 control-label">经度</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="lng" id="lngid">
                            	</div>
                            	<label for="inputName" class="col-sm-2 control-label">纬度</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="lat" id="latid" placeholder="">
                            	</div>
                        	</div> 
                        	<div class="form-group" style="margin-bottom:-15px;">							
                            	<label for="inputName" class="col-sm-2 control-label">主协议</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="mainprotocal" id="mainprotocalid" placeholder="RMTP1.01或原子服务等">
                            	</div>
                            	<label for="inputName" class="col-sm-2 control-label">主IP</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="mainip" id="mainipid" placeholder="000.000.000.000">
                            	</div>                       	
                        	</div>                       	                       
						</div>
						</div> <!-- name="panel5" -->
						<h5>建设信息:</h5>
                        <div class="panel panel-default" id="panel4">
						<div class="panel-body" > 							
							<div class="form-group" >					
                            	<label for="inputName" class="col-sm-2 control-label">建设时间</label>
                            	<div class="col-sm-4">
                                	<!-- <input type="text" class="form-control" name="intalltime" id="intalltimeid"> -->
                                	<div class='input-group date' id='datetimepicker'>
										<input type='text' class="form-control" name='intalltime'
											id="intalltimeid" /> <span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
                            	</div>
                            	<label for="inputName" class="col-sm-2 control-label">质保时间</label>
                            	<div class="col-sm-4">
                                	<!-- <input type="text" class="form-control" name="qualitytime" id="qualitytimeid" placeholder=""> -->
                                	<div class='input-group date' id='datetimepicker'>
										<input type='text' class="form-control" name='qualitytime'
											id="qualitytimeid" /> <span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
                            	</div>
                        	</div> 
                        	<div class="form-group">							
                            	 <label for="inputName" class="col-sm-2 control-label">保修时间</label>
                            	<div class="col-sm-4">
                                	<!-- <input type="text" class="form-control" name="repairtime" id="repairtimeid"> -->
                                	<div class='input-group date' id='datetimepicker'>
										<input type='text' class="form-control" name='repairtime'
											id="repairtimeid" /> <span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
                            	</div>
                            	<label for="inputName" class="col-sm-2 control-label">设备原值(元)</label>
                            	<div class="col-sm-4">
                                	<input type="text" class="form-control" name="revalue" id="revalueid" placeholder="整个系统的采购价格">
                            	</div>                       	
                        	</div>
                        	<div class="form-group" style="margin-bottom:-15px;">							
                            	<label for="inputName" class="col-sm-2 control-label">供应商</label>
                            	<div class="col-sm-4">
                            		<select class="form-control select2" name="supdep" id="supdepid">
										<option value="1">华日</option>
										<option value="2">中星</option>
									</select>
								</div>
                            	<label for="inputName" class="col-sm-2 control-label">施工单位</label>
                            	<div class="col-sm-4">
                            		<select class="form-control select2" name="condep" id="condepid">
										<option value="1">华日</option>
										<option value="2">中星</option>
									</select>
								</div>	                      	
                        	</div>                          	                       
						</div>
						</div> <!-- name="panel5" -->

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
    
    <!--  遥控站科室单位的选择-->
	<div class="modal fade" id="modal-Department">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">管理科室单位</h4>
				</div>
				<div class="modal-body">
					<div id="BuildDepartmenttree"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary suredepart"
						data-dismiss="modal">确定</button>
				</div>
			</div>	<!-- /.modal-content -->		
		</div>	<!-- /.modal-dialog -->	
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
<script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/moment-with-locales.min.js"></script> --%>

		
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
	$.fn.datetimepicker.dates['zh'] = {  
                days:       ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"],  
                daysShort:  ["日", "一", "二", "三", "四", "五", "六","日"],  
                daysMin:    ["日", "一", "二", "三", "四", "五", "六","日"],  
                months:     ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月","十二月"],  
                monthsShort:  ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],  
                meridiem:    ["上午", "下午"],  
                //suffix:      ["st", "nd", "rd", "th"],  
                today:       "今天"  
        };  	
	var date = new Date();
	$('.date').datetimepicker({
		language:'zh-cn',  
		minView: "month",
		format:'yyyy-mm-dd hh:ii:ss', 
		/* format:'yyyy-mm-dd', */
		startDate:date,
		todayBtn:true,
		autoclose: 1
	});
	
	$(".select2").select2({
		tags:true,
		createTag:function (decorated, params) {
			return null;
		},
		width:'100%'
	}); 
	
</script>
<script>
	
	var form = null;
	var querydata=[];
	var restr =$('#querystr').val(); //有跳转，跳转回来的时候用
	querydata.querystring = "type:"+0;	
	if(null != restr){
		querydata.querystring = restr;
		//解析restr 设置查询条件 projecttype_id:1,projectstate:1,name:
		//alert(restr);
				
		var name = "";
		//var type = null;
		var owerdep=null
		var leveltype = null;
		var funtype = null;
		var qarr = restr.split(",");
		for ( var i = 0; i <qarr.length; i++){
    		var item = qarr[i];
    		var itemarra = item.split(":");
    		switch(itemarra[0]){    			
  				case "name":
  					name=itemarra[1];
  					break;
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
    	
    	
    	sel.bindselectTheAll('queryowerdepid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name');  
    	
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
                url: "<%=request.getContextPath()%>/rest/remotestation/rcstationdevhousevodataGrid",
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
                {"data": "ownerdepname"},
                {
                	"data": 'leveltype',
                	"render": function (data, type, full, callback) {
                        //类型：0未激活；1激活。
                        switch (data) {
                            case 0: return "A级站"; break;
                            case 1: return "B级站"; break;
                            case 2: return "C级站"; break;
                            case 3: return "D级站"; break;
                            case 4: return "小型站"; break;
                            default:return "其它";break
                        }
                       
                    }  
                    
                },  
                {
                	"data": 'funtype',
                	"render": function (data, type, full, callback) {
                        //类型：0未激活；1激活。
                        switch (data) {
                            case 0: return "综合站"; break;
                            case 1: return "C波段"; break;
                            case 2: return "短波站"; break;
                            case 3: return "铁路监测"; break;
                            case 4: return "航空监测"; break;
                            case 5: return "水上监测"; break;
                            default:return "其它";break
                        }
                       
                    }  
                    
                },          
                {"data": 'name'},
                {"data": 'address'},
                {"data": 'supdepname'},
                /* {
                	"data": 'isactive',
                	"render": function (data, type, full, callback) {
                        //类型：0未激活；1激活。
                        switch (data) {
                            case 0: return "未激活"; break;
                            case 1: return "激活 "; break;
                        }
                       
                    }  
                    
                },    */           
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
        	var owerdep = $("#queryowerdepid").val(); 
        	querydata.querystring = querydata.querystring+ ",owerdep:"+owerdep;	
        	var leveltype = $("#queryleveltypeid").val(); 
        	querydata.querystring = querydata.querystring+ ",leveltype:"+leveltype;	
        	var funtype = $("#queryfuntypeid").val(); 
        	querydata.querystring = querydata.querystring+ ",funtype:"+funtype;	
        	       	
        	var name = $("#keyword").val();
			querydata.querystring = querydata.querystring+ ",name:"+name;			
			var oSettings = tables.fnSettings();
			oSettings.ajax.data = querydata;			
			tables.api().ajax.reload();
            tables.fnDraw();//查询后不需要保持分页状态，回首页
        });
        initDepartmentTree(0);
        /* 由于bootstrap不支持多层modal弹出框，当关闭其中一个modal是，会把所有modal-open给关闭，需要人工指定打开新的modal */
		$('#modal-Department').on('hidden.bs.modal', function () {
  			$(document.body).addClass("modal-open");
		})
      	inputvalidator();
		//添加
        $("#btn-add").on("click", function () {        
            sel.bindselectfirst('owerdepid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name');  
            sel.bindselectfirst('supdepid', "<%=request.getContextPath()%>/rest/department/enterpriseList/0", 'id', 'name'); 
            sel.bindselectfirst('condepid', "<%=request.getContextPath()%>/rest/department/enterpriseList/0", 'id', 'name'); 

            url = "<%=request.getContextPath()%>/rest/remotestation/insertRcstationdevhouse";
            $("input[name=name]").val("");
            $("input[name=code]").val("");
            $("input[name=address]").val("");
            
            $("#myModalLabel").html("<b>增加遥控站信息</b>");
            
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
			url = "<%=request.getContextPath()%>/rest/remotestation/deleteRcstationdevhouseBatch";
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
		    var titlte ="遥控站清单"+".xlsx";
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
            alert(JSON.stringify(data));
            $("input[name=id]").val(data.id);
            $("input[name=type]").val(data.type);
            $("input[name=name]").val(data.name);
            $("input[name=code]").val(data.code);
            //$("input[name=boxIp").attr("readonly","readonly");
            //$("select[name=owerdep]").val(data.owerdep);
            sel.binddata('owerdepid', "<%=request.getContextPath()%>/rest/department/getdeplist/0", 'id', 'name',data.owerdep);  
            $("input[name=address]").val(data.address);
            $("input[name=depid]").val(data.depid);
            $("input[name=depidname]").val(data.ownerdepname);           
            sel.binddata('mngpersonidid', "<%=request.getContextPath()%>/rest/user/getAllStafferInfobydep/"+data.depid, 'id', 'name',data.mngpersonid);
            $("textarea[name=remark]").val(data.remark);
            
            $("input[type=radio][name=leveltype]").get(data.leveltype).checked =true;
            $("input[type=radio][name=funtype]").get(data.funtype).checked =true;
            
            //$("input[name=funtionlist]").val(data.funtionlist);
            if(data.funtionlist == null){
            	$("input[type=checkbox][name=funtionlist]").each(function (i, e) {           	
	            	$(this).prop("checked",false);	                
	            }); 
            }else{
            	var servicesArray = data.funtionlist.split(",");
	            $("input[type=checkbox][name=funtionlist]").each(function (i, e) {           	
	            	$(this).prop("checked",false);
	                for (var i = 0; i < servicesArray.length; i++) {
	                      if ($(this).val() == servicesArray[i]) {
	                          $(this).prop("checked",true); //$(this).iCheck('check');
	                      }
					}
	            }); 
            }
            $("input[name=lng]").val(data.lng); 
            $("input[name=lat]").val(data.lat); 
            $("input[name=mainprotocal]").val(data.mainprotocal); 
            $("input[name=mainip]").val(data.mainip);   
            
            
            
            var intalltimestr;
    		if (data.intalltime == null) {
				var date = new Date();
           		intalltimestr = new Date(date).format("yyyy-MM-dd hh:mm:ss");
    		}else{
           		intalltimestr = new Date(data.intalltime).format("yyyy-MM-dd hh:mm:ss");
    		}
    		$("#intalltimeid").val(intalltimestr);
    		var qualitytimestr;
    		if (data.qualitytime == null) {
				var date = new Date();
           		qualitytimestr = new Date(date).format("yyyy-MM-dd hh:mm:ss");
    		}else{
           		qualitytimestr = new Date(data.qualitytime).format("yyyy-MM-dd hh:mm:ss");
    		}
    		$("#qualitytimeid").val(qualitytimestr); 
    		var repairtimestr;
    		if (data.repairtime == null) {
				var date = new Date();
           		repairtimestr = new Date(date).format("yyyy-MM-dd hh:mm:ss");
    		}else{
           		repairtimestr = new Date(data.repairtime).format("yyyy-MM-dd hh:mm:ss");
    		}
    		$("#repairtimeid").val(repairtimestr);  
    		$("input[name=revalue]").val(data.revalue);     	      			
			sel.binddata('supdepid', "<%=request.getContextPath()%>/rest/department/enterpriseList/0", 'id', 'name',data.supdep); 
            sel.binddata('condepid', "<%=request.getContextPath()%>/rest/department/enterpriseList/0", 'id', 'name',data.condep); 

			url = "<%=request.getContextPath()%>/rest/remotestation/saveRcstationdevhouse";

			$("#myModalLabel").html("<b>修改遥控站信息</b>");
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
						code : {
							validators : {
								notEmpty : {
									message : '请输入遥控站编号'
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
                    url: "<%=request.getContextPath()%>/rest/remotestation/deleteRcstationdevhouse",
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
    
    function ShowDepart(){
		$("#modal-Department").modal("show");
	}
	/*初始化部门树 */
	function initDepartmentTree(selectNodeId) {
		var treeData = null;
		ajaxPost("<%=request.getContextPath()%>/rest/department/activetreeDatabydep", null, function(data) {
			treeData = data;
		});
		$("#BuildDepartmenttree").treeview({
			data : treeData,
			showBorder : true,
			expandIcon : "glyphicon glyphicon-stop",
			collapseIcon : "glyphicon glyphicon-unchecked",
			levels : 1,
			onNodeSelected : function(event, data) {
				//获取部门id 方便添加信息时使用
				var workdepId = data.id;
				var departmentName = data.text;
				$("#depidid").val(workdepId);
				$("#depidnameid").val(departmentName);
				sel.bindselectfirst('mngpersonidid', "<%=request.getContextPath()%>/rest/user/getAllStafferInfobydep/"+workdepId, 'id', 'name'); 				
			}
		});
		if (treeData.length == 0)
			return;
		//默认选中第一个节点
		selectNodeId = selectNodeId || 0;
		$("#BuildDepartmenttree").data('treeview').selectNode(selectNodeId);
		$("#BuildDepartmenttree").data('treeview').expandNode(selectNodeId);
		$("#BuildDepartmenttree").data('treeview').revealNode(selectNodeId);  
	}
</script>
