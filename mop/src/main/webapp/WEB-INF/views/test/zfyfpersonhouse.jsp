<%@ page language="java" pageEncoding="UTF-8"%>
<head>
<!-- The jQuery library is a prerequisite for all jqSuite products -->
<!--  <script type="text/ecmascript" src="js/jquery.min.js"></script>  -->
<script type="text/ecmascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jqgrid/js/jquery-3.3.1-min.js"></script>
<%--  	<script type="text/javascript" src="<%=request.getContextPath()%>/js/browser.js"></script> --%>
<!-- This is the Javascript file of jqGrid -->
<script type="text/ecmascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jqgrid/js/jquery.jqGrid.min.js"></script>
<!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- We support more than 40 localizations -->
<script type="text/ecmascript"
	src="<%=request.getContextPath()%>/AdminLTE/plugins/jqgrid/js/grid.locale-en.js"></script>
<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/jqgrid/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=request.getContextPath()%>/AdminLTE/plugins/jqgrid/css/trirand/ui.jqgrid.css" />
	<!--bootstrap相关配置  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> 
    <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/AdminLTE/plugins/jqgrid/css/trirand/ui.jqgrid-bootstrap.css" />
	<script>
		$.jgrid.defaults.width = 780;
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';
	</script>
<meta charset="utf-8" />
<title>单位房源信息</title>
</head>
<body>
	<!-- <p>hello</p>
<script type="text/javascript" src="js/jquery-3.3.1-min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script> -->
<body>
	<table id="jqGrid" style="margin:auto;"></table>
	<div id="jqGridPager"></div>
	<script type="text/javascript">
		var rownum;
		$(document).ready(function() {
			$("#jqGrid").jqGrid({
				url : '<%=request.getContextPath()%>/rest/zfyp/zfyfpersonhouseload',
				editurl : 'clientArray',
				datatype : "json",
				colModel : [
					{
						label : 'ID编号',
						name : 'id',
						width : 150,
						key : true,
						align:'center',
					
					},
					{
						label : '姓名',
						name : 'name',
						width : 140,
						editable : true, // must set editable to true if you want to make the field editable
						align:'center'
					},
					{
						label : '职级',
						name : 'rank',
						width : 120,
						editable : true,
						align:'center'
					},
					{
						label : '部队职级',
						name : 'arrank',
						width : 140,
						editable : true,
						align:'center'
					},
					{
						label : '地址',
						name : 'address',
						width : 210,
						key : true,
						editable : true,
						align:'center'
					},
					{
						label : '建筑面积',
						name : 'coverarea',
						width : 90,
						editable : true, // must set editable to true if you want to make the field editable
						align:'center'
					},
					{
						label : '房屋类型',
						name : 'houstype',
						width : 120,
						editable : true,
						align:'center'
					},
					{
						label : '住房管理单位',
						name : 'housdep',
						width : 120,
						editable : true,
						align:'center'
					},
					{
						label : '备注',
						name : 'remark',
						width : 225,
						key : true,
						editable : true,
						align:'center'
					}
				],
				sortname : 'id',
				loadonce : true,
				width : 900,
				height : 300,
				//rowNum表示一页条数据
				rowNum : 10,
				pager : "#jqGridPager",
				//shrinkToFit自动缩放true打开
				shrinkToFit:false,   
				//autoScroll滚动条false关闭
				autoScroll: true, 
				onSelectRow:function(id){
				//返回数据的条数rownum
				rownum=$('#jqGrid').jqGrid('getGridParam', 'records');
				/* jQuery(this).editRow(id, true); */
				}
			});
	
			$('#jqGrid').navGrid("#jqGridPager", {
				edit : false,
				add : false,
				del : false,
				refresh : false,
				view : false
			});
			$('#jqGrid').inlineNav('#jqGridPager',
				// the buttons to appear on the toolbar of the grid
				{
					edit : true,
					add : true,
					del : true,
					cancel : true,
					editParams : {
						keys : true,
						url:"clientArray",
						aftersavefunc:function(editedid){
						var rowid=editedid;
						var jsdata=JSON.stringify($("#jqGrid").getRowData(rowid));
						$.ajax({
							url:"<%=request.getContextPath()%>/rest/zfyp/zfyfpersonhouseupdate",
							data:{jsdata:jsdata},
							dataType:"json",
							type:"POST",
							});
						}
					},
					addParams : {
						<%-- url:"<%=request.getContextPath()%>/rest/addrowjg", --%>
						keys : true,
						addRowParams :{
						aftersavefunc: function(result) {
						 var rowid =$("#jqGrid").jqGrid('getGridParam', "selrow");;
						/*  var jsdata = JSON.stringify($("#jqGrid").getRowData(rowid)); */
						var jsondata=$("#jqGrid").getRowData(rowid);
						jsondata.id=rownum;
						var jsdata=JSON.stringify(jsondata);
						alert(jsdata);
							$.ajax({
							url:"<%=request.getContextPath()%>/rest/zfyp/zfyfpersonhouseupdate",
							data:{jsdata:jsdata},
							dataType:"json",
							type:"POST",
							});
						}
						
						}
					}
				});
		});
	</script>
</body>
</body>