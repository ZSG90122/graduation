<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/baidu/baidumapv2/baidumap_offline_v2_load.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/baidu/baidumapv2/tools/headmap_baidu.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/baidu/map_demo/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/baidu/my_js/randpoints.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/baidu/baidumapv2/css/baidu_map_v2.css" />
    <script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>

     <style type="text/css">
    body,
    html,
    #map_View,
    #tab,
    #mapfrm {
        width: 100%;
        height: 100%;
        overflow: hidden;
        margin: 0;
        font-family: "微软雅黑";
    }
    
    #menu {
        height: 100%;
        overflow-y: auto
    }
    
    td {
        font-size: 14px
    }
    
    h4 {
        margin: 0;
    }
    </style>
   
    
    <title>鼠标绘制工具</title>
</head>
<body>

<div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>



<script type="text/javascript">

    // 百度地图API功能
    var map = new BMap.Map('map'); //创建地图
    var poi = new BMap.Point(104.072, 30.673894); //创建中心坐标点
    map.centerAndZoom(poi, 15);     // 初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom();    //启用滚轮缩小放大
    map.addControl(new BMap.NavigationControl()); //缩放按钮
    
    var cr = new BMap.CopyrightControl({
        anchor: BMAP_ANCHOR_TOP_RIGHT
    }); //设置版权控件位置
    
    map.addControl(cr); //添加版权控件
    var bs = map.getBounds(); //返回地图可视区域
    cr.addCopyright({
        id: 1,
        content: "<p><b>无线电管理-MOP</b></p>",
        bounds: bs
    });


</script>
</body>
</html>

