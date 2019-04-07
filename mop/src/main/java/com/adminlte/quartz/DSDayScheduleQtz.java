package com.adminlte.quartz;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.DateUtils;


@Service
public class DSDayScheduleQtz {
//	@Autowired
//	private BusyDaySignInforService daySignInforService;
//	
	private static final Logger log = Logger.getLogger(DSDayScheduleQtz.class);
//	
	protected void execute(){
		try{
			//设置为每个3天备份一次数据库
			try{
				MySQLDatabaseBackup mb = new MySQLDatabaseBackup();
				System.out.println(mb.getExportCommand());
				mb.export();
			}
			catch(Exception e){
				System.out.println(e.getMessage());
			}
			
			System.out.println("DSDayScheduleQtz 定时器自动执行");
		}catch(Exception e)
		{
			log.info(e.getMessage());
			System.out.println(e.getMessage());
		}
//		
	}
}
