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
    oFile.Init = function(ctrlName, uploadUrl,deleteUrl,shwoKey,imgPathArray,imgNameArray,filepath,uploadcallback,deletecallback) {
        var control = $('#' + ctrlName);
        
    	control.fileinput({
                uploadUrl:uploadUrl,//上传的地址
                uploadAsync:true, //默认异步上传
                showUpload: true, //是否显示上传按钮,跟随文本框的那个
                showRemove : false, //显示移除按钮,跟随文本框的那个
                showCaption: shwoKey,//是否显示标题,就是那个文本框
                showPreview : true, //是否显示预览,不写默认为true
                dropZoneEnabled: false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                maxFileSize: 10240,// 10m； 单位为kb，如果为0表示不限制文件大小,默认为0
                //minFileCount: 0,
                maxFileCount: 5, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
                allowedFileTypes: ['image','video','doc','pdf','docx','xls'],//配置允许文件上传的类型
                allowedPreviewTypes : [ 'image','video'],//配置所有的被预览文件类型
                allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
                language : 'zh',
                uploadExtraData:function (previewId, index){//向后台传递参数
            	 	var data={
                		path:filepath/*,
                 		fileinfor:$("#fileinfor").val(),
                		description:$("#path").val() */
                	};
                    return data; 
               },
               initialPreviewAsData: true,
               initialPreview:imgPathArray,
               initialPreviewConfig: imgNameArray,
            });
            //异步上传返回结果处理
            control.on('fileerror', function(event, data, msg) {
                console.log("fileerror");
                console.log(data);
            });
            //异步上传返回结果处理
            control.on("fileuploaded", function (event, data, previewId, index) {
                console.log("fileuploaded");
                //alert(JSON.stringify(data));
                //alert(index);
                //alert(previewId);
                //var ref=$(this).attr("data-ref");
                //$("input[name='"+ref+"']").val(data.response.url);
                //alert(data.jqXHR.status);
                var url = "url" + index;                
                //alert(data.response[url]);
                uploadcallback(data.response[url],previewId,data.response["filetype"]);
                //var deleteUrl="<%=request.getContextPath()%>/rest/FileUpload/springDelete"+"?fileurl="+data.response[url];
                
                
            });

            //同步上传错误处理
            control.on('filebatchuploaderror', function(event, data, msg) {
                console.log("filebatchuploaderror");
                console.log(data);
            });
            
            //同步上传返回结果处理
            control.on("filebatchuploadsuccess", function (event, data, previewId, index) {
                console.log("filebatchuploadsuccess");
                console.log(data);
            });

            //上传前
            control.on('filepreupload', function(event, data, previewId, index) {
                console.log("filepreupload");
                //alert("begin");
            });
            //filedelete事件：预览时点击缩略图上的删除按钮才能触发的 
            control.on('filepredelete', function(event, key) {   //删除加载的图调用
    			//alert("dete"+key); 
    			deletecallback(key);
            });
            //filesuccessremove事件：图片上传成功后，点击删除按钮的回调函数
            control.on('filesuccessremove', function(event, id) {
	    			//alert("删除"+id); //可以根据这个进行编程实现服务器文件的删除，因为文件已经上传，但也可以不用删废文件可以后续清理，跟随文本框那个移除按钮不能调用原因代分析，
            	//$('#uploadfile').show();
			});
		};
		oFile.Initdata = function(ctrlName, imgPathArray,imgNameArray) {
	        var control = $('#' + ctrlName);
	        //alert(imgPathArray.length);
	    	control.fileinput({
	    			//uploadUrl:uploadUrl,//上传的地址
	    			uploadAsync:true, //默认异步上传
	    			showUpload: false, //是否显示上传按钮,跟随文本框的那个
	    			showRemove : false, //显示移除按钮,跟随文本框的那个
	    			showCaption: false,//是否显示标题,就是那个文本框
	    			showPreview : true, //是否显示预览,不写默认为true
	    			dropZoneEnabled: false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
	    			showUploadedThumbs:false,
	    			showCancel: false, //取消按钮是否显示
	    			showBrowse:false,
	    			layoutTemplates:{
	    				actionDelete:'',
	    				actionUpload:'',
	    			},
	                initialPreviewAsData: true,
	                initialPreview:imgPathArray,
	                initialPreviewConfig: imgNameArray,
	            });
		}
        return oFile;
    };	