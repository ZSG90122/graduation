package com.adminlte.quartz;

import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.springframework.stereotype.Service;

@Service
public class DSScheduleQtz {
	
	//每隔1分钟执行一次,测试定时器
	protected void execute() throws ParseException{
		try{
			System.out.println("DSScheduleQtz  定时器自动执行！");
			////备份数据库
			//MySQLDatabaseBackup mb = new MySQLDatabaseBackup();
			//System.out.println(mb.getExportCommand());
			//mb.export();
			
			///备份上传文件
			/*
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
			 */
			
			
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
}
