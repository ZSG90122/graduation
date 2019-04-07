package com.adminlte.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.adminlte.pojo.vo.Result;

/**
 * 主页交互控制器
 * @author 李谣顺
 */

@Controller
@RequestMapping("/FileUpload")
public class FileUploadController extends BaseController{
	
	//采用spring自带的上传，https://blog.csdn.net/wangh92/article/details/77767871  https://blog.csdn.net/github_36086968/article/details/72822041
	//https://blog.csdn.net/rolandcoder/article/details/79354630  https://www.cnblogs.com/flyins/p/6701826.html
	@RequestMapping(value = "/springUpload", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>>  springUpload(HttpServletRequest request) 
    {
		//需要在前端限定文件大小，否则要报错，我这里没有解决这个问题
		Map<String, Object> result = new HashMap<String, Object>();
		
		try{
			long  startTime=System.currentTimeMillis();
			//将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
			CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
			//检查form中是否有enctype="multipart/form-data"
			//System.out.println(request.getParameter("fileinfor"));
			if(multipartResolver.isMultipart(request))
			{
				//将request变成多部分request
				MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
				//获取multiRequest 中所有的文件名
				Iterator iter=multiRequest.getFileNames();
				
				//String[] paths = (String[])multiRequest.getParameterMap().get("path");
				//System.out.println("ddddddddddddddddddddddd:"+paths[0]);
				String[] fileids = (String[])multiRequest.getParameterMap().get("file_id");
				System.out.println("ddddddddddddddddddddddd:"+fileids); //自带的字段
				int findex = 0;
				while(iter.hasNext())
				{
					//一次遍历所有文件
					MultipartFile file=multiRequest.getFile(iter.next().toString());
					System.out.println("file    :"+file); //自带的字段
					if(file!=null)
					{
						//System.out.println(request.getSession().getServletContext().getRealPath("/"));
						//System.out.println(request.getParameter("path"));
						Date d = new Date();  
				        System.out.println("=============================");  
				        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");  
				        String dateNowStr = sdf.format(d);  
				        
						String cpath = request.getParameter("path");
						  System.out.println("cpath    "+cpath); 
						  //根据传入的path 创建对应的一级文件夹
						String path_1 = request.getSession().getServletContext().getRealPath("/")+cpath+"/";
						File dir_1 = new File(path_1);
						if (dir_1.exists()) {
							System.out.println("dir exists");
						} else {
							System.out.println("dir not exists, create it ...");
							dir_1.mkdir();
						} 
						System.out.println(path_1); 
						String path = request.getSession().getServletContext().getRealPath("/")+cpath+"/"+dateNowStr+"/";
						System.out.println(path); 
						File dir = new File(path);
						if (dir.exists()) {
							System.out.println("dir exists");
						} else {
							System.out.println("dir not exists, create it ...");
							dir.mkdir();
						}
						String orfilename = file.getOriginalFilename();
						String fullpath=path+orfilename;
						String newfilename = orfilename;
						System.out.println("newfilename  "+newfilename);
						File exfile = new File(fullpath);
						while(exfile.exists()){
							newfilename = UUID.randomUUID()+"."+orfilename.substring(orfilename.lastIndexOf(".") + 1);
							fullpath = path+ newfilename;
							exfile = new File(fullpath);
						}
						
						
						//上传
						file.transferTo(new File(fullpath));
						
						result.put("url"+fileids[findex], cpath+"/"+dateNowStr+"/"+newfilename); //url加上文件的序号
						result.put("filetype",fileType(newfilename));
					}
				}

			}
        	long  endTime=System.currentTimeMillis();
        	System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        	result.put("url", "fileanme");
        	result.put("result", "ok");
        	return ResponseEntity.ok(result);
		}catch(Exception ex){
			System.out.println(ex.toString());
			result.put("result", "error");
			result.put("msg", ex.toString());
			return ResponseEntity.ok(result);
		}
    }
	
	@RequestMapping(value = "/springDelete", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>>  springDelete(HttpServletRequest request) 
    {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String url = request.getParameter("fileurl");
			String path = request.getSession().getServletContext().getRealPath("/");
			String fullpath = path+ url;
			System.out.println(fullpath);
			File file = new File(fullpath);
			if(file.exists() && file.isFile()){
				file.delete();
			}
			result.put("url", url);
			result.put("result", "ok");
		}catch(Exception e){
			System.out.println(e.toString());
			result.put("result", "error");			
			return ResponseEntity.ok(result);
		}
    	return ResponseEntity.ok(result);
    }
	
	public String fileType(String fileName) {
		if (fileName == null) {
			fileName = "null";
			return fileName;

		} else {
			// 获取文件后缀名并转化为写，用于后续比较
			String fileType = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
			// 创建图片类型数组
			String img[] = { "bmp", "jpg", "jpeg", "png", "tiff", "gif", "pcx", "tga", "exif", "fpx", "svg", "psd",
					"cdr", "pcd", "dxf", "ufo", "eps", "ai", "raw", "wmf" };
			for (int i = 0; i < img.length; i++) {
				if (img[i].equals(fileType)) {
					return "image";
				}
			}

			// 创建文档类型数组
			String document[] = { "txt", "doc", "docx", "xls", "htm", "html", "jsp", "rtf", "wpd", "pdf", "ppt" };
			for (int i = 0; i < document.length; i++) {
				if (document[i].equals(fileType)) {
					return fileType;
				}
			}
			// 创建视频类型数组
			String video[] = { "mp4", "avi", "mov", "wmv", "asf", "navi", "3gp", "mkv", "f4v", "rmvb", "webm" };
			for (int i = 0; i < video.length; i++) {
				if (video[i].equals(fileType)) {
					return "video";
				}
			}
			// 创建音乐类型数组
			String music[] = { "mp3", "wma", "wav", "mod", "ra", "cd", "md", "asf", "aac", "vqf", "ape", "mid", "ogg",
					"m4a", "vqf" };
			for (int i = 0; i < music.length; i++) {
				if (music[i].equals(fileType)) {
					return "audio";
				}
			}

		}
		return "other";
	}


	
}
