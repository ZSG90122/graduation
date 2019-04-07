

//收到服务器端的websocke消息后，刷新相应的数据,在common.js中调用
var AnalyticData={
		analysis:function(msg)
		{
			entity = JSON.parse(msg);
			//alert('websocketnews'+msg);
			//调用地图上清清同学的站的信息刷新
			if(1==entity.isData && ("D0"==entity.code || "D2"==entity.code || "D3" == entity.code)){
				$(window.parent.document).contents().find("#iframe_10008")[0].contentWindow.webSocketMessage(entity); 
			}
			
			if("AF"==entity.code){
				messagebox('success', '提示', "开灯"+entity.messageText, 'mid-center');
			}
			
			
			/*console.log(data+"==============================");
			entity = JSON.parse(data);
			if("D0"==entity.code)
			{
				//10条数据的局部刷新
				var box_ip=$("#inputIP").val();
//				$.post('<%=request.getContextPath()%>/rest/MainPage/get_current_condition_refresh',box_ip,function(result){
//					SHowPageBaseInfo_two(result,false);
//					console.log("10条数据的局部刷新     "+result);
//				})
				console.log("box_ip  : "+box_ip);
				$.post('/lmpds/rest/MainPage/get_current_condition_refresh',{box_ip},function(result){
					if(null==result){
						
					}
					console.log(result);
					SHowPageBaseInfo_two(result,false);
				})
				console.log("得到服务器的电流刷新命令"+"D0"+data+"开始进行局部刷新。。。。。。。。");
			}else if("D2"==entity.code){
				//刷新采集光强信息
				var Box_Ip=$("#inputIP").val();

				console.log("box_ip  : "+Box_Ip);
				$.post('/lmpds/rest/MainPage/get_condition_intensity_refresh',{Box_Ip},function(result){
					ShowPageBaseTwo_top(result);
				})
				
			}else if("D3" == entity.code){
				//采集所有控制状态返回信息
				var Box_Ip=$("#inputIP").val();
				console.log("box_ip  : "+Box_Ip);
				$.post('/lmpds/rest/MainPage/get_condition_controll_refresh',{Box_Ip},function(result){
					console.log(result);
					ShowControlBaseInfo(result);
				})
				
			}else{
				
			}*/
			
			
		}
}