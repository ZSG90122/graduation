/**
 * https://www.cnblogs.com/dxdmn/p/7230232.html
 * 定制图片下边内容：https://blog.csdn.net/ntotl/article/details/51481942
 */

var DSFileInput = function() {
	var oFile = new Object();
	// 初始化fileinput控件（第一次初始化）
	/**
	 * 入参说明
	 * ctrlName：控件ID值
	 * uploadUrl：上传地址
	 * shwoKey：是否显示上传按钮和上传框 主要用于查看
	 * imgPathArray：初始化数据path数组 主要用于查看和修改
	 * imgNameArray：初始化数据name数组
	 * **/
	oFile.Init = function(ctrlName, uploadUrl, deleteUrl, shwoKey, imgPathArray, imgNameArray, filepath, uploadcallback, deletecallback) {
		var control = $('#' + ctrlName);
		console.log(imgNameArray);
		console.log(uploadUrl);
		console.log(deleteUrl);
		console.log(filepath);
		control.fileinput({
			uploadUrl : uploadUrl, //上传的地址
			uploadAsync : true, //默认异步上传
			showUpload : true, //是否显示上传按钮,跟随文本框的那个
			showRemove : false, //显示移除按钮,跟随文本框的那个
			showCaption : shwoKey, //是否显示标题,就是那个文本框
			showPreview : true, //是否显示预览,不写默认为true
			dropZoneEnabled : false, //是否显示拖拽区域，默认不写为true，但是会占用很大区域
			//minImageWidth: 50, //图片的最小宽度
			//minImageHeight: 50,//图片的最小高度
			//maxImageWidth: 1000,//图片的最大宽度
			//maxImageHeight: 1000,//图片的最大高度
			maxFileSize : 10240, // 10m； 单位为kb，如果为0表示不限制文件大小,默认为0
			//minFileCount: 0,
			maxFileCount : 5, //表示允许同时上传的最大文件个数
			enctype : 'multipart/form-data',
			validateInitialCount : true,
			previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
			msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
			allowedFileTypes : [ 'image', 'video', 'doc', 'pdf', 'docx', 'xls' ], //配置允许文件上传的类型
			allowedPreviewTypes : [ 'image', 'video' ], //配置所有的被预览文件类型
			allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ], //控制被预览的所有mime类型
			language : 'zh',
			uploadExtraData : function(previewId, index) { //向后台传递参数
				var data = {
					path : filepath
				};
				return data;
			},
			initialPreviewAsData : true,
			initialPreview : imgPathArray,
			initialPreviewConfig : imgNameArray,
			layoutTemplates : {
				actionUpload : '', //去除上传的那个控件
				actionZoom : '' // 去除预览控件
			}
		});
		//异步上传返回结果处理
		control.on('fileerror', function(event, data, msg) {
			console.log("fileerror");
			console.log(data);
		});
		//异步上传返回结果处理
		control.on("fileuploaded", function(event, data, previewId, index) {
			// previewId对应的是 filesuccessremove的id ，就是那个删除按钮的id
			console.log("fileuploaded");
			var url = "url" + index;
			uploadcallback(data.response[url], previewId, data.response["filetype"]);
			console.log("第" + index + "个文件fileuploaded");
			console.log("第" + previewId + "个文件fileuploaded");
		});

		//同步上传错误处理
		control.on('filebatchuploaderror', function(event, data, msg) {
			console.log("filebatchuploaderror");
			console.log(data);
		});

		//同步上传返回结果处理
		control.on("filebatchuploadsuccess", function(event, data, previewId, index) {
			console.log("filebatchuploadsuccess");
			console.log(data);
		});

		//上传前
		control.on('filepreupload', function(event, data, previewId, index) {
			console.log("filepreupload");

		});
		//filedelete事件：预览时点击缩略图上的删除按钮才能触发的 
		control.on('filepredelete', function(event, key) { //删除加载的图调用
			//alert("dete"+key); 
			deletecallback(key);
		});
		//filesuccessremove事件：图片上传成功后，点击删除按钮的回调函数
		control.on('filesuccessremove', function(event, id) {
			control.log("filesuccessremove");
		});
	};
	oFile.Initdata = function(ctrlName, imgPathArray, imgNameArray) {
		var control = $('#' + ctrlName);
		//alert(imgPathArray.length);
		control.fileinput({
			//uploadUrl:uploadUrl,//上传的地址
			uploadAsync : true, //默认异步上传
			showUpload : false, //是否显示上传按钮,跟随文本框的那个
			showRemove : false, //显示移除按钮,跟随文本框的那个
			showCaption : false, //是否显示标题,就是那个文本框
			showPreview : true, //是否显示预览,不写默认为true
			dropZoneEnabled : false, //是否显示拖拽区域，默认不写为true，但是会占用很大区域
			showUploadedThumbs : false,
			showCancel : false, //取消按钮是否显示
			showBrowse : false,
			layoutTemplates : {
				actionDelete : '',
				actionUpload : '',
			},
			initialPreviewAsData : true,
			initialPreview : imgPathArray,
			initialPreviewConfig : imgNameArray,
		});
	}
	return oFile;
};