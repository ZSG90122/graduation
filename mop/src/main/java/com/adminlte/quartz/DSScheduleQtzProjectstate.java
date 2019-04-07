package com.adminlte.quartz;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.CacheEnumerationCollect;


@Service
public class DSScheduleQtzProjectstate {
	@Autowired
	//private IBprojectService projectService;
	//调用存储过程自动计算工程状态
	protected void execute() throws ParseException{
		try{
			System.out.println("DSScheduleQtzProjectstate 定时器自动执行");
			//projectService.checkprojectstate();
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
}
