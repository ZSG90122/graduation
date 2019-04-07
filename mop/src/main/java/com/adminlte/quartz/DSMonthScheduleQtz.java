package com.adminlte.quartz;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.DateUtils;

@Service
public class DSMonthScheduleQtz {
	private static final Logger log = Logger.getLogger(DSMonthScheduleQtz.class);
	//可以注入service，mop这个项目用不到，只是用来每月备份一次上传文件
	//	@Autowired
	//	private BusyStatisticsService statisticsService;
	//	@Autowired
	//	private BusyPayService payService;
	//	@Autowired
	//	private BusyDaySignInforService daySignInforService;
	//
	protected void execute(){
		try{
			//备份上传文件
			String path = this.getClass().getResource("/").getPath() ;
			String spath = path.substring(1, path.length()-16)+"upload";
			spath = spath.replace("%20", " ");
			System.out.println(spath);
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			String backUpName = date.format(new Date());
			InputStream is = this.getClass().getClassLoader().getResourceAsStream("/jdbc.properties");//加载属性配置文件
			Properties properties = new Properties();
			properties.load(is);
			String bakdir = properties.getProperty("jdbc.bakdir");// 使用的端口号
			String dpath = bakdir+"/"+backUpName+".zip";
			System.out.println(dpath);
			ZipCompress zipc = new ZipCompress(dpath,spath);
			zipc.zip();
		}catch(Exception e)
		{
			log.info(e.getMessage());
			System.out.println(e.getMessage());
		}
	}
}
