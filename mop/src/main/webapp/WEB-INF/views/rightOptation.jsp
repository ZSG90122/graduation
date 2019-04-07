<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 

<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.css">

<style type="text/css">
  table,tr
  {
  	font-size:16px;color:black;
  }
  
</style>

	<!-- 这里是首页右边的操作栏 -->
<ul class="nav nav-tabs nav-justified control-sidebar-tabs ss"
			style=" margin-top:1px;margin-left: 1px;display:inline-block;width: 80px;">
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
					<div class="row-fluid">
        				
						<form class="form-inline" action="" id="queryForm"  name="query_form" style="margin: 1px 0 10px 0;">
								<div class="form-group">
									<label for="exampleInputName2">片区</label> <select
										class="form-control" id="boxAreaIdq" name="boxAreaId"
										style="width: 100px;">
										
									</select>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail2">分组</label> <select
										class="form-control" id="boxGroupIdq" name="boxGroupId"
										style="width: 100px;">
										
									</select>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail2"></label> 
									<!-- <button style="color:black;width: 40px;font-size:8px;" id="btn-query">查询</button> -->
									<button type="button" class="btn btn-primary btn-sm" id="btn-query">
                    					<i class="fa fa-search"></i> 查询
                					</button>	
								</div>
						</form>
						<div class="pull-right">
        					<div class="btn-group " role="group">
									<a href="#" data-toggle="tooltip" data-placement="left" id="indexOpenLights"
										title="开灯" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/light_off.png" style="display: inline-block;width: 20px;height: 20px;border-radius: 2px;"></a>
									<a href="#" data-toggle="tooltip" data-placement="top" id="indexCloseLights"
										title="关灯" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/light_on.svg" style="display: inline-block;width: 20px;height: 20px;border-radius: 2px;"></a>
									<%-- <a href="#" data-toggle="tooltip" data-placement="bottom"
										title="查询" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/u112.png" style="display: inline-block;width: 20px;height: 20px;border-radius: 2px;"></a> --%>
									<a href="#" data-toggle="tooltip" data-placement="right" id="indexConfigBoxs"
										title="设置" class="btn btn-default"><img
										src="<%=request.getContextPath()%>/AdminLTE/dist/img/u110.png" style="display: inline-block;width: 20px;height: 20px;border-radius: 2px;"></a>
								</div>
        				</div>	
							
					</div>
						
							
							<!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed " align="center">
       <thead> 
        <tr class="info">
            <!-- <td><input type="checkbox" id="checkAll"></td> -->
            <!-- <th></th>  -->
            <th>序号</th>
            <!-- <th>IP</th> -->
            <th>状态</th>
            <th>名字</th>
            <th>告警</th>
            <th>时间</th>
            <th>配置</th>
        </tr>
        </thead>
        <!-- <tbody></tbody>  -->
    </table>
    
    
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/dataTables.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/datatables/jquery.dataTables.js"></script>		
<script src="<%=request.getContextPath()%>/AdminLTE/conmmon/common.js"></script>
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/select2/select2.full.min.js"></script>		
		
<script type="text/javascript">
	<%-- $(function () {
		sel.bindUnselect('boxAreaIdq', "<%=request.getContextPath()%>/rest/AreaGroupManager/areaGroupData?levelcode=0", 'id', 'name'); 
		
		
          var str = "";
    	<shiro:hasAnyRoles name = "admin">
    	 str+= "<div class='btn-group'>" +
         "<button id='configRow' class='btn btn-primary btn-sm' type='button'><i class='fa  fa-gear'></i></button>" +
         /* "<button id='setRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-gears'></i></button>" +  */
         "</div>"
    	 </shiro:hasAnyRoles>
        var scimage = "<img src='<%=request.getContextPath()%>/AdminLTE/dist/img/u99.png' style='display: inline-block;width: 20px;height: 20px;border-radius: 5px;'>";
        var skimage = "<img src='<%=request.getContextPath()%>/AdminLTE/dist/img/u101.png' style='display: inline-block;width: 20px;height: 20px;border-radius: 5px;'>";
        
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
            paging: false,//是否分页
            scrollY:        "600px", 
        	scrollX:        true,
            scrollCollapse: true,
            columnDefs: [
                { width: '1px', targets: 0 }
            ], 
            fixedColumns: false,
            ajax: {
                type: "post",
                url: "<%=request.getContextPath()%>/rest/statuMonitor/boxStatusDataGrid",
                dataSrc: "data",                
                dataType:'json',
                data: function (d) {
                    var param = {};
                    param.draw = d.draw;
                    param.start = d.start;
                    param.length = d.length;
                    var formData = $("#queryForm").serializeArray();//把form里面的数据序列化成数组
                    formData.forEach(function (e) {
                        param[e.name] = e.value;
                    });
                    //alert(JSON.stringify(param));
                    return param;//自定义需要传递的参数。
                }
                /* ,
                data: function(d){
					var warInforVo = {};
					warInforVo['warnSrc'] = 2;
					return warInforVo;
                } */
            },
            columns: [//对应上面thead里面的序列
               /*  {"data": "null"}, */
                {"data": "tbId","width":'5%'},
                {"data": "tbId","width":'5%'},
                
                {"data": 'boxName',"width":'20%'},
                
                {"data": 'warnName',"width":'30%'},
                {
                	"data": 'warnDatetime',
                	"width":'35%',
                	"render": function (data, type, full, callback) {
                        if (data == null) {
                			return "";
            			}
            			var offlineTimeStr = new Date(data).format("yyyy-MM-dd hh:mm");
            			return offlineTimeStr;
                    }  
                    
                },
                {"data":'columnDefs',"width":'5%'}
            ],    

			//操作按钮
            columnDefs: [
               /*  {
                    targets: 0,
                    defaultContent: "<input type='checkBox' name='checkList'>"
                }, */
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
                api.column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
                api.column(1).nodes().each(function (cell, i) {
                	rdata = api.row(i).data();
                	//alert(JSON.stringify(rdata));
                	if(rdata.ctlBoxState == 0){
                		cell.innerHTML = skimage;
                	}else{
                    	cell.innerHTML = scimage;
                    }
                });
            }
        }); 
        
        $('#boxAreaIdq').on("change", function(){
            //alert("ddd"); //http://blog.csdn.net/yin767833376/article/details/52035656
            var parentId = $("#boxAreaIdq").val();
            sel.bindUnselect('boxGroupIdq', 
                 "<%=request.getContextPath()%>/rest/AreaGroupManager/areaGroupData?levelcode=1&parentId="+parentId, 'id', 'name');
         });  //
        //查询按钮
        $("#btn-query").on("click", function () {
            tables.fnDraw();//查询后不需要保持分页状态，回首页
        });
        
        //修改
        $("#dataTable tbody").on("click", "#configRow", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            alert("设置："+data.boxIp);
        });
        //批量设置选择
        $("#indexConfigBoxs").on("click", function () {
        	var nTrs = tables.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象 
        	var boxsList = []; 
       		for(var i = 0; i < nTrs.length; i++){  
           		//alert(tables.fnGetData(nTrs[i]).boxIp);
           		var oneBox = new Object();
				oneBox.tbId = tables.fnGetData(nTrs[i]).tbId;
				oneBox.boxIp = tables.fnGetData(nTrs[i]).boxIp;
				boxsList.push(oneBox);
       		}
       		alert("批量设置:"+JSON.stringify(boxsList)); 
       		
       	    url = "<%=request.getContextPath()%>/rest/RepairInspect/deleteBatch";
			$.ajax({
                    url: url,
                    type: 'post',
                    dataType: "json",
                    cache: "false",
                    data:boxsList,
                    //contentType : 'application/json', //设置这个接收端就可以用链表
                    success: function (data) {
                        if (data.success) {
                            toastr.success("成功！");
                            tables.api().row().remove().draw(false);
                        } else {
                            toastr.error('失败！'+JSON.stringify(data));
                        }
                    },
                    error: function (err) {
                        toastr.error("Server Connection Error<%=request.getContextPath()%>.");
                    }
                }); 
       		
       		
       		
       		 
            return false;//a标签不跳转
        });
        //批量开灯
        $("#indexOpenLights").on("click", function () {
        	var nTrs = tables.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象 
        	var boxsList = []; 
       		for(var i = 0; i < nTrs.length; i++){  
           		//alert(tables.fnGetData(nTrs[i]).boxIp);
           		var oneBox = new Object();
				oneBox.tbId = tables.fnGetData(nTrs[i]).tbId;
				oneBox.boxIp = tables.fnGetData(nTrs[i]).boxIp;
				boxsList.push(oneBox);
       		}
       		alert("批量开灯:"+JSON.stringify(boxsList));  
            return false;//a标签不跳转
        });
        //批量关灯
        $("#indexCloseLights").on("click", function () {
        	var nTrs = tables.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr对象 
        	var boxsList = []; 
       		for(var i = 0; i < nTrs.length; i++){  
           		//alert(tables.fnGetData(nTrs[i]).boxIp);
           		var oneBox = new Object();
				oneBox.tbId = tables.fnGetData(nTrs[i]).tbId;
				oneBox.boxIp = tables.fnGetData(nTrs[i]).boxIp;
				boxsList.push(oneBox);
       		}
       		alert("批量关灯:"+JSON.stringify(boxsList));  
            return false;//a标签不跳转
        });
         
	}); --%>
</script>		
		