/**
 *cookie的处理类
 */
var cookie = {
	set : function(key, val, time) { //设置cookie方法
		var date = new Date(); //获取当前时间
		var expiresDays = time; //将date设置为n天以后的时间
		date.setTime(date.getTime() + expiresDays * 24 * 3600 * 1000); //格式化为cookie识别的时间
		document.cookie = key + "=" + val + ";expires=" + date.toGMTString(); //设置cookie
	},
	get : function(key) { //获取cookie方法
		/*获取cookie参数*/
		var getCookie = document.cookie.replace(/[ ]/g, ""); //获取cookie，并且将获得的cookie格式化，去掉空格字符
		var arrCookie = getCookie.split(";") //将获得的cookie以"分号"为标识 将cookie保存到arrCookie的数组中
		var tips = null; //声明变量tips
		for (var i = 0; i < arrCookie.length; i++) { //使用for循环查找cookie中的tips变量
			var arr = arrCookie[i].split("="); //将单条cookie用"等号"为标识，将单条cookie保存为arr数组
			if (key == arr[0]) { //匹配变量名称，其中arr[0]是指的cookie名称，如果该条变量为tips则执行判断语句中的赋值操作
				tips = arr[1]; //将cookie的值赋给变量tips
				break; //终止for循环遍历
			}
		}
		return tips;
	},
	delete : function(key) { //删除cookie方法
		var date = new Date(); //获取当前时间
		date.setTime(date.getTime() - 10000); //将date设置为过去的时间
		document.cookie = key + "=v; expires =" + date.toGMTString(); //设置cookie
	}
}

//select2拓展
var sel = {
	add : function(father_id, val, text) {
		var control = $('#' + father_id);
		control.append("<option selected='selected' value='" + val + "'>&nbsp;" + text + "</option>");
	},
	addUnselect : function(father_id, val, text) {
		var control = $('#' + father_id);
		control.append("<option value='" + val + "'>&nbsp;" + text + "</option>");
	},
	select : function(op_id) {
		$('#' + op_id).attr('selected', 'selected');
		$('#' + op_id).trigger('change');
	},
	//绑定数据不选中
	bindUnselect : function(ctrlName, url, val, text) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			//control.append("<option value='" + data[i][val] + "' title = '" + data[i][text] + "'>&nbsp;" + data[i][val] + "</option>");
			});
			//$('#' + ctrlName).val(data[0][val]); //选中第1个
			$('#' + ctrlName).val(null); //不选
		});
		control.removeAttr("disabled");
	},
	//绑定数据不选中,增加全部选项
	bindselectTheAll : function(ctrlName, url, val, text) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.ajaxSettings.async = false;
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			control.append("<option selected value='" + "-1" + "'>&nbsp;" + "全部" + "</option>");
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			//control.append("<option value='" + data[i][val] + "' title = '" + data[i][text] + "'>&nbsp;" + data[i][val] + "</option>");
			});
		//$('#' + ctrlName).val(data[0][val]); //选中第1个
		//$('#' + ctrlName).val(null); //不选
		});
		control.removeAttr("disabled");

		$.ajaxSettings.async = true;
	},
	//绑定数据不选中
	bindselectfirst : function(ctrlName, url, val, text) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			//control.append("<option value='" + data[i][val] + "' title = '" + data[i][text] + "'>&nbsp;" + data[i][val] + "</option>");
			});
			$('#' + ctrlName).val(data[0][val]); //选中第1个
		//$('#' + ctrlName).val(null); //不选
		});
		control.removeAttr("disabled");
	},
	bindUnselect_manager : function(ctrlName, url, val, text) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			//control.append("<option value='" + data[i][val] + "' title = '" + data[i][text] + "'>&nbsp;" + data[i][val] + "</option>");
			});
			$("#" + ctrlName).select2("val", [ data[0][text] ]);
		});
		control.removeAttr("disabled");
	},
	//绑定数据并且所有选中
	bindSelect : function(ctrlName, url, val, text) {
		if (ctrlName == null)
			return;
		$("#" + ctrlName).select2("val", -1);
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			//alert(data)
			control.empty(); //清空下拉框
			var fff = new Array();
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
				fff[i] = data[i][val];
			});

			$("#" + ctrlName).select2("val", [ fff ]);
		});
		control.removeAttr("disabled");
	},
	//绑定数据并且所有选中多选
	bindSelectMulti : function(ctrlName, url, val, text, arrydata) {
		if (ctrlName == null)
			return;
		$("#" + ctrlName).select2("val", -1);
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			//alert(data)
			control.empty(); //清空下拉框        
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			});
			var fff = new Array();
			$.each(arrydata, function(i, item) {
				fff[i] = item;
			});
			$("#" + ctrlName).select2("val", [ fff ]);
		});
		control.removeAttr("disabled");
	},
	bindSelect_device : function(ctrlName, url, val, text, ip) {
		if (ctrlName == null)
			return;
		$("#" + ctrlName).select2("val", -1);
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			//alert(data)
			control.empty(); //清空下拉框
			var fff = new Array();
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'title = '" + data[i][ip] + "'>&nbsp;" + data[i][text] + "</option>");
				fff[i] = data[i][val];
			});

			$("#" + ctrlName).select2("val", [ fff ]);
		});
		control.removeAttr("disabled");
	},
	bindFun : function(ctrlName, url, val, text, fun) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			});
			fun();
			control.removeAttr("disabled");
		});
	},
	binddata : function(ctrlName, url, val, text, selectval) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			$.each(data, function(i, item) {
				//if (selectval.indexOf(data[i][val]) >= 0) //google浏览器indexOf不能用 gzsds
				if (selectval == data[i][val])
					control.append("<option selected='selected' value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
				else
					control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			});
		});
	},
	//将绑定数据同步出去(效果类似于bindselectfirst)
	syndata : function(ctrlName, url, val, text, fun) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			//console.log(data)
			if (data.length!=0) {
				control.empty(); //清空下拉框
				$.each(data, function(i, item) {
					control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
				});
				fun(data);
				$("#" + ctrlName).select2("val", [ data[0][val] ]);
			}else{
				control.empty(); //清空下拉框
				control.append("<option value='" + "-1" + "'>&nbsp;" + "无" + "</option>");
				$("#" + ctrlName).select2("val", [ -1 ]);
			}
		});
	},
	// 效果类似于binddata，只是会在改变下拉列表值的时候会监
	// 听到该变化，以便执行相应的操作
	synbinddata : function(ctrlName, url, val, text, selectval, fun) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		var flag; // 用于记录要被回显的标号
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			$.each(data, function(i, item) {
				if (selectval == data[i][val]) {
					control.append("<option selected='selected' value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
					flag = i;
				}
				else
					control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			});
			fun(data);
			// 选中传进来的那个参数所代表的值
			$("#" + ctrlName).select2("val", [ data[flag][val] ]);
		});
	},
	// 首先选中第一项无
	bindselectNonefirst : function(ctrlName, url, val, text) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.ajaxSettings.async = false;
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			control.append("<option selected value='" + "-1" + "'>&nbsp;" + "无" + "</option>");
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			});
		});
		control.removeAttr("disabled");
		$.ajaxSettings.async = true;
	},
	//同步选中第一个"无"选项
	synfirstdata : function(ctrlName, url, val, text) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			control.append("<option value='" + "-1" + "'>&nbsp;" + "无" + "</option>");
			$.each(data, function(i, item) {
				control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			    console.log("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>")
			});
			//选中第一个无
			$("#" + ctrlName).select2("val", [ -1 ]);
		});
	},
	// 附带"无"选项，同时同步数据出去
	synNonebinddata : function(ctrlName, url, val, text, selectval) {
		var control = $('#' + ctrlName);
		//绑定Ajax的内容
		var flag = -1; // 用于记录要被回显的标号,若返回的数据长度为0，那就选择"无"
		$.getJSON(url, function(data) {
			control.empty(); //清空下拉框
			control.append("<option selected value='" + "-1" + "'>&nbsp;" + "无" + "</option>");
			$.each(data, function(i, item) {
				if (selectval == data[i][val]) {
					control.append("<option selected='selected' value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
					flag = i;
				}
				else
					control.append("<option value='" + data[i][val] + "'>&nbsp;" + data[i][text] + "</option>");
			});
			// 选中传进来的那个参数所代表的值
			if (flag != -1)
				$("#" + ctrlName).select2("val", [ data[flag][val] ]);
			else
				$("#" + ctrlName).select2("val", [ flag ]);

		});
	}
}

//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.format = function(fmt) { //author: meizz  
	var o = {
		"M+" : this.getMonth() + 1, //月份   
		"d+" : this.getDate(), //日   
		"h+" : this.getHours(), //小时   
		"m+" : this.getMinutes(), //分   
		"s+" : this.getSeconds(), //秒   
		"q+" : Math.floor((this.getMonth() + 3) / 3), //季度   
		"S" : this.getMilliseconds() //毫秒   
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

var initwebsocket = {
	initSocket : function(host, toastr) {
		var websocket;
		if ('WebSocket' in window) {
			websocket = new ReconnectingWebSocket("ws://" + host + "/mop/rest/webSocketServer", null, {
				debug : true,
				maxReconnectAttempts : 3000
			});

		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket("ws://" + host + "/mop/rest/webSocketServer");

		} else {
			websocket = new SockJS("http://" + host + "/mop/rest/sockjs/webSocketServer");

		}
		//var websocket = new WebSocket(url);

		//连接发生错误的回调方法
		websocket.onerror = function() {
			window.parent.messagebox('success', '提示', "websocket.error", 'mid-center');
			console.log("websocket.error");
		};
		//连接成功建立的回调方法
		websocket.onopen = function(event) {
			window.parent.messagebox('success', '提示', "onopen", 'mid-center');
			console.log("onopen");
		}
		//接收到消息的回调方法
		websocket.onmessage = function(event) {
			//**接收到消息后需要将接受到的消息解析、然后根据前后端协商的code来处理下一步动作。

			AnalyticData.analysis(event.data); //这个函数在other/analyticWebsocketDatas.js中
		//		        alert("websocket  : "+event.data);
		}
		//连接关闭的回调方法
		websocket.onclose = function() {
			websocket.close();
			console.log("websocket.onclose");
		}
		//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		window.onbeforeunload = function() {
			websocket.close();
		}
		return websocket;
	}
}

function Dictionary() {
	this.data = new Array();

	this.put = function(key, value) {
		this.data[key] = value;
	};

	this.get = function(key) {
		return this.data[key];
	};

	this.remove = function(key) {
		this.data[key] = null;
	};

	this.isEmpty = function() {
		return this.data.length == 0;
	};

	this.size = function() {
		return this.data.length;
	};
}