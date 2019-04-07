/**
 * Created by denys on 2017、12、18
 */
//web——socket回传信息显示调用
var websocketalert = {
	showError:function(varjson){//显示错误信息
		
	},
	showTip:function(varjson){//显示提示信息
		
	},
	showWarning:function(varjson){//显示警告信息
		
	},
	showAnimation:function(varjson){//展示动画效果
		
	}
}

var baidumapds={
	addmarker:function(varjson){//向地图中添加marker.
		
	},
	clickmarker:function(varjson){//百度地图maker点击事件
		
	},
	modifymakerattrbute:function(varjson){//修改maker属性事件
		
	},
	addmarkerinfor:function(infojson){
		//var txt = "银湖海岸城", mouseoverTxt = txt + " " + parseInt(Math.random() * 1000,10) + "套" ;
		var txt ="站:"+infojson.boxName;
		if(null!=infojson.warnName && ''!= infojson.warnName){
			txt = txt+';  '+"警告:"+infojson.warnName;
		}
		var mouseoverTxt = "";
		var myCompOverlay = new ComplexCustomOverlay(new BMap.Point(infojson.boxLng,infojson.boxLat), txt,mouseoverTxt);
		map.addOverlay(myCompOverlay);
		return myCompOverlay;
	},
	removemarkerinfor:function(overlay){
		map.removeOverlay(overlay);
	}
}

var add_state = {
		AddBase_State:function (lng, lat, monitoring_name) {
		    try {
		        var flag = 0;
		   
		        var pt = new BMap.Point(lng, lat); //创建一个百度点
		        var myIcon = null;
		        if (0==flag)
		            myIcon = new BMap.Icon("<%=basePath%>/baidu/image/red.png", new BMap.Size(50, 50)); 
		        else
		            myIcon = new BMap.Icon("<%=basePath%>/baidu/image/image/green.png", new BMap.Size(50, 50));

		        var marker2 = new BMap.Marker(pt, { icon: myIcon }); // 创建标注

		        marker2.setTitle(monitoring_name);
		        alert(monitoring_name)
		        marker2.enableDragging(); //允许标记拖动
		        map.addOverlay(marker2); // 将标注添加到地图中

		        var opts = {
		            width: 200,     // 信息窗口宽度
		            height: 100,     // 信息窗口高度
		            title: marker2.getTitle(), // 信息窗口标题
		            enableMessage: true,//设置允许信息窗发送短息
		            message: "BOX信息"
		        }
		        var info = "测试向地图中添加信息box"

		        var infoWindow = new BMap.InfoWindow(info, opts);  // 创建信息窗口对象 
				alert("marker2");
		        marker2.addEventListener("click", function () {
		            p = marker2.getPosition();
		            
		            //var pt0 = new BMap.Point(p.lng, p.lat); //创建一个百度点
		            map.openInfoWindow(infoWindow, new BMap.Point(p.lng, p.lat)); //开启信息窗口
		        });
		        alert("addOverlay");
		        //alert(map);
		    } catch (e) {
		        alert("AddBase_State:" + e.message);
		    }
		}
}

function ComplexCustomOverlay(point, text, mouseoverText){
	this._point = point;
	this._text = text;
	this._overText = mouseoverText;
}
ComplexCustomOverlay.prototype = new BMap.Overlay();
ComplexCustomOverlay.prototype.initialize = function(mp){
	this._mp = mp;
	var div = this._div = document.createElement("div");
	div.style.position = "absolute";
	div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
	div.style.backgroundColor = "#EE5D5B";
	div.style.border = "1px solid #BC3B3A";
	div.style.color = "black";
	//div.style.width = "50px";
	div.style.padding = "2px";
	div.style.lineHeight = "18px";
	div.style.word_wrap="break_word"
	div.style.whiteSpace = "nowrap";
	div.style.MozUserSelect = "none";
	div.style.fontSize = "12px"
	var span = this._span = document.createElement("span");
	div.appendChild(span);
	span.appendChild(document.createTextNode(this._text)); 
	var that = this;

	var arrow = this._arrow = document.createElement("div");
	
	 var curWwwPath = window.document.location.href;
	    //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
	 var pathName = window.document.location.pathname;
	 var pos = curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8080
	 var localhostPath = curWwwPath.substring(0, pos);
	    //获取带"/"的项目名，如：/ems
	 var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	    //获取项目的basePath   http://localhost:8080/ems/
	 var basePath=localhostPath+projectName+"/";
	
	var arrowimg = projectName+"/baidu/image/labeltop.png";
	arrow.style.background = "url("+arrowimg+") no-repeat";
	arrow.style.position = "absolute";
	arrow.style.width = "11px";
	arrow.style.backgroundPosition = "0px -20px";
	arrow.style.height = "10px";
	arrow.style.top = "-10px";
	arrow.style.left = "10px";
	arrow.style.overflow = "hidden";
	div.appendChild(arrow);

	/*div.onmouseover = function(){
		this.style.backgroundColor = "#6BADCA";
		this.style.borderColor = "#0000ff";
		this.getElementsByTagName("span")[0].innerHTML = that._overText;
		arrow.style.backgroundPosition = "0px -20px";
	}

	div.onmouseout = function(){
		this.style.backgroundColor = "#EE5D5B";
		this.style.borderColor = "#BC3B3A";
		this.getElementsByTagName("span")[0].innerHTML = that._text;
		arrow.style.backgroundPosition = "0px 0px";
	}*/

	this._mp.getPanes().labelPane.appendChild(div);

	return div;
}
ComplexCustomOverlay.prototype.draw = function(){
	var mp = this._mp;
	var pixel = mp.pointToOverlayPixel(this._point);
	this._div.style.left = pixel.x - 3* parseInt(this._arrow.style.left) + "px";
	this._div.style.top  = pixel.y + 10 + "px";//位置
}