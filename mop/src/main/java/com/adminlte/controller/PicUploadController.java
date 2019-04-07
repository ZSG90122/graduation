package com.adminlte.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.adminlte.result.PicUploadResult;
import com.adminlte.service.IProfileService;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 上传管理
 */
@Controller
@RequestMapping("pic")
public class PicUploadController extends BaseController{
	private static final ObjectMapper mapper = new ObjectMapper();
	
	@Autowired
	private IProfileService profileService;

	// 允许上传的格式
	private static final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg",
			".jpeg", ".gif", ".png" };

	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String upload(@RequestParam("imgUp") MultipartFile uploadFile,
			HttpServletResponse response) throws Exception {

		// 校验图片格式
		boolean isLegal = false;
		for (String type : IMAGE_TYPE) {
			if (StringUtils.endsWithIgnoreCase(
					uploadFile.getOriginalFilename(), type)) {
				isLegal = true;
				break;
			}
		}

		// 封装Result对象，并且将文件的byte数组放置到result对象中
		PicUploadResult fileUploadResult = new PicUploadResult();

		// 状态
		fileUploadResult.setError(isLegal ? 0 : 1);

		// 文件新路径
		String filePath = getFilePath(uploadFile.getOriginalFilename());

		// 生成图片的绝对引用地址
		String picUrl = StringUtils.replace(StringUtils.substringAfter(
				filePath, "D:\\image\\adminlte-upload"), "\\", "/");

		fileUploadResult.setUrl(picUrl);

		File newFile = new File(filePath);

		// 写文件到磁盘
		uploadFile.transferTo(newFile);

		// 校验图片是否合法
		isLegal = false;
		try {
			BufferedImage image = ImageIO.read(newFile);
			if (image != null) {
				fileUploadResult.setWidth(image.getWidth() + "");
				fileUploadResult.setHeight(image.getHeight() + "");
				isLegal = true;
			}
		} catch (IOException e) {
		}

		// 状态
		fileUploadResult.setError(isLegal ? 0 : 1);

		if (!isLegal) {
			// 不合法，将磁盘上的文件删除
			newFile.delete();
		}

		//保存url到数据库
		profileService.updateImgById(getUserId(), filePath);
		
		// 将java对象序列化为json字符串
		return mapper.writeValueAsString(fileUploadResult);
	}

	private String getFilePath(String sourceFileName) {
		String baseFolder = "D:\\image\\adminlte-upload" + File.separator
				+ "images";
		Date nowDate = new Date();
		String fileFolder = baseFolder + File.separator
				+ new DateTime(nowDate).toString("yyyy") + File.separator
				+ new DateTime(nowDate).toString("MM") + File.separator
				+ new DateTime(nowDate).toString("dd");
		File file = new File(fileFolder);
		if (!file.isDirectory()) {
			// 如果目录不存在，则创建目录
			file.mkdirs();
		}
		// 生成新的文件名
		String fileName = new DateTime(nowDate).toString("yyyyMMddhhmmssSSSS")
				+ RandomUtils.nextInt(100, 9999) + "."
				+ StringUtils.substringAfterLast(sourceFileName, ".");
		return fileFolder + File.separator + fileName;
	}
}
