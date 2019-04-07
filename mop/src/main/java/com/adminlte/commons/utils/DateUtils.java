package com.adminlte.commons.utils;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * @author yh
 *
 */
public class DateUtils{
	
	/**
	 * 计算两个时间yyyy-MM-dd HH:mm:ss字符串天数差
	 * @param date1 yyyy-MM-dd HH:mm:ss
	 * @param date2 yyyy-MM-dd HH:mm:ss
	 * @return int
	 * @throws ParseException
	 */
	public static int getDayDifference(String dateBegin,String dateEnd) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginTime,endTime;
		beginTime=sdf.parse(dateBegin);
		endTime=sdf.parse(dateEnd);
		return endTime.getDay()-beginTime.getDay();
	}
	
	/**
	 * 计算两个时间yyyy-MM-dd HH:mm:ss字符串分钟差
	 * @param date1 yyyy-MM-dd HH:mm:ss
	 * @param date2 yyyy-MM-dd HH:mm:ss
	 * @return float
	 * @throws ParseException
	 */
	public static float getMinuteDifference(String dateBegin,String dateEnd) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginTime,endTime;
		//开始时间
		beginTime=sdf.parse(dateBegin);
		Calendar begin=Calendar.getInstance();
		begin.setTime(beginTime);
		//结束时间
		endTime=sdf.parse(dateEnd);
		Calendar end=Calendar.getInstance();
		end.setTime(endTime);
		//返回时间差
		return (end.getTimeInMillis()-begin.getTimeInMillis())/(1000*60);
	}
	
	/**
	 * 计算两个时间yyyy-MM-dd HH:mm:ss字符串小时差
	 * @param date1 yyyy-MM-dd HH:mm:ss
	 * @param date2 yyyy-MM-dd HH:mm:ss
	 * @return float
	 * @throws ParseException
	 */
	public static float getHourDifference(String dateBegin,String dateEnd) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginTime,endTime;
		//开始时间
		beginTime=sdf.parse(dateBegin);
		Calendar begin=Calendar.getInstance();
		begin.setTime(beginTime);
		//结束时间
		endTime=sdf.parse(dateEnd);
		Calendar end=Calendar.getInstance();
		end.setTime(endTime);
		//返回时间差
		float hour=(end.getTimeInMillis()-begin.getTimeInMillis())/(1000*60*60);
		float minute=((end.getTimeInMillis()-begin.getTimeInMillis())%(1000*60*60))/(1000*60);
		double difference=(double) (hour+(minute/300.0)*5.0);
		//保留两位小数
		DecimalFormat df=new DecimalFormat("#.00");
		float result=Float.parseFloat(df.format(difference));
		return result;
	}
	
	
	/**
	 * 通过某日时间戳yyyy-MM-dd HH:mm:ss字符串获取当日凌晨时间
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @return Date型 yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getStartTimeOnDayByDate(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayStart = Calendar.getInstance();
		oneDayStart.setTime(oneDay);
		oneDayStart.set(Calendar.HOUR_OF_DAY, 0);
		oneDayStart.set(Calendar.MINUTE, 0);
		oneDayStart.set(Calendar.SECOND, 0);
		oneDayStart.set(Calendar.MILLISECOND, 0);
		return oneDayStart.getTime();
	}
	
	/**
	 * 通过某日时间戳yyyy-MM-dd HH:mm:ss字符串获取当日午夜时间戳
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @return Date型 yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getEndTimeOnDayByDate(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayEnd = Calendar.getInstance();
		oneDayEnd.setTime(oneDay);
		oneDayEnd.set(Calendar.HOUR_OF_DAY, 23);
		oneDayEnd.set(Calendar.MINUTE, 59);
		oneDayEnd.set(Calendar.SECOND, 59);
		oneDayEnd.set(Calendar.MILLISECOND, 999);
		return oneDayEnd.getTime();
	}
	
	/**
	 * 通过某时间戳yyyy-MM-dd HH:mm:ss字符串获取该日期几天后的同时间戳
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param day int
	 * @return Date型  yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateAfer(String dateStr,int day) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayAfter = Calendar.getInstance();
		oneDayAfter.setTime(oneDay);
		oneDayAfter.set(Calendar.DATE, oneDayAfter.get(Calendar.DATE)+day);
		return oneDayAfter.getTime();
	}
	
	/**
	 * 通过某时间戳yyyy-MM-dd HH:mm:ss字符串获取该日期几天前的同时间戳
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param day int
	 * @return Date型  yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateBefore(String dateStr,int day) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayAfter = Calendar.getInstance();
		oneDayAfter.setTime(oneDay);
		oneDayAfter.set(Calendar.DATE, oneDayAfter.get(Calendar.DATE)-day);
		return oneDayAfter.getTime();
	}
	
	/**
	 * 通过某时间戳yyyy-MM-dd HH:mm:ss字符串获取该日期前几个月的同时间戳
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param day int
	 * @return Date型  yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateBeforeSomeMonth(String dateStr,int num) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayAfter = Calendar.getInstance();
		oneDayAfter.setTime(oneDay);
		oneDayAfter.set(Calendar.MONTH, oneDayAfter.get(Calendar.MONTH)-num);
		return oneDayAfter.getTime();
	}
	
	/**
	 * 通过某日期yyyy-MM-dd字符串获取当日凌晨时间
	 * @param dateStr yyyy-MM-dd
	 * @return Date型 yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getStartTimeOnDayByDateTypeYMD(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayStart = Calendar.getInstance();
		oneDayStart.setTime(oneDay);
		oneDayStart.set(Calendar.HOUR_OF_DAY, 0);
		oneDayStart.set(Calendar.MINUTE, 0);
		oneDayStart.set(Calendar.SECOND, 0);
		oneDayStart.set(Calendar.MILLISECOND, 0);
		return oneDayStart.getTime();
	}
	
	/**
	 * 通过某日期yyyy-MM-dd字符串获取当日午夜时间戳
	 * @param dateStr yyyy-MM-dd
	 * @return Date型 yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getEndTimeOnDayByDateTypeYMD(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayEnd = Calendar.getInstance();
		oneDayEnd.setTime(oneDay);
		oneDayEnd.set(Calendar.HOUR_OF_DAY, 23);
		oneDayEnd.set(Calendar.MINUTE, 59);
		oneDayEnd.set(Calendar.SECOND, 59);
		oneDayEnd.set(Calendar.MILLISECOND, 999);
		return oneDayEnd.getTime();
	}
	
	
	/**
	 * 通过某年月时间yyyy-MM获取当月第一天凌晨时间戳
	 * @param dateStr yyyy-MM
	 * @return	Date yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getStartTimeInMonthByDate(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayStart = Calendar.getInstance();
		oneDayStart.setTime(oneDay);
		oneDayStart.set(Calendar.DATE,1);
		oneDayStart.set(Calendar.HOUR_OF_DAY, 0);
		oneDayStart.set(Calendar.MINUTE, 0);
		oneDayStart.set(Calendar.SECOND, 0);
		oneDayStart.set(Calendar.MILLISECOND, 0);
		return oneDayStart.getTime();
	}
	
	/**
	 * 通过某年月时间yyyy-MM获取获取当月最后一天午夜时间戳
	 * @param dateStr yyyy-MM
	 * @return Date yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getEndTimeInMonthByDate(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayEnd = Calendar.getInstance();
		oneDayEnd.setTime(oneDay);
		int lastDay=oneDayEnd.getActualMaximum(Calendar.DAY_OF_MONTH);
		oneDayEnd.set(Calendar.DATE, lastDay);
		oneDayEnd.set(Calendar.HOUR_OF_DAY, 23);
		oneDayEnd.set(Calendar.MINUTE, 59);
		oneDayEnd.set(Calendar.SECOND, 59);
		oneDayEnd.set(Calendar.MILLISECOND, 999);
		return oneDayEnd.getTime();
	}
	
	
	/**
	 * 通过某年时间yyyy获取当年第一天凌晨时间戳
	 * @param dateStr yyyy
	 * @return Date yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getStartTimeInYearByDate(String dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayStart = Calendar.getInstance();
		oneDayStart.setTime(oneDay);
		oneDayStart.set(Calendar.MONTH,1);
		oneDayStart.set(Calendar.DATE,1);
		oneDayStart.set(Calendar.HOUR_OF_DAY, 0);
		oneDayStart.set(Calendar.MINUTE, 0);
		oneDayStart.set(Calendar.SECOND, 0);
		oneDayStart.set(Calendar.MILLISECOND, 0);
		return oneDayStart.getTime();
	}
	
	/**
	 * 通过某年时间yyyy获取当年后最一天午夜时间戳
	 * @param dateStr yyyy
	 * @return Date yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getEndTimeInYearByDate(String  dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		Date oneDay =sdf.parse(dateStr);
		Calendar oneDayEnd = Calendar.getInstance();
		oneDayEnd.setTime(oneDay);
		oneDayEnd.set(Calendar.MONTH, 12);
		oneDayEnd.set(Calendar.DATE, 31);
		oneDayEnd.set(Calendar.HOUR_OF_DAY, 23);
		oneDayEnd.set(Calendar.MINUTE, 59);
		oneDayEnd.set(Calendar.SECOND, 59);
		oneDayEnd.set(Calendar.MILLISECOND, 999);
		return oneDayEnd.getTime();
	}
	
	/**
	 * 返回时间戳的最小单位
	 * @param dateStr
	 * @return year,month,day,hour,minute,second
	 */
	public static String getMinDateTypeByDate(String dateStr){
		String Type=null;
		String[] dateType1,dateType2,dateType;
		if(dateStr==null||dateStr.equals("")){
			return null;
		}
		dateType=dateStr.split(" ");
		dateType1=dateType[0].split("-");
		if(dateType.length>1){
			dateType2=dateType[1].split(":");
			if(dateType2.length>0){
				int i=0;
				for(String d:dateType2){
					i++;
				}
				switch(i){
					case 1:Type="hour";break;
					case 2:Type="minute";break;
					case 3:Type="second";break;
				}
			}
		}
		else{
			if(dateType1.length>0){
				int i=0;
				for(String d:dateType1){
					i++;
				}
				switch(i){
					case 1:Type="year";break;
					case 2:Type="month";break;
					case 3:Type="day";break;
				}
			}
		}
		return Type;
	}
	
	/**
	 * 根据当前时间戳返回今日星期几
	 * @author yh
	 * @param dateStr  yyyy-MM-dd HH:mm:ss
	 * @return int
	 * @throws ParseException
	 */
	public static int getDayForWeek(String dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date day =sdf.parse(dateStr);
		Calendar toDay = Calendar.getInstance();
		toDay.setTime(day);
		int dayForWeek = 0;
		if(toDay.get(Calendar.DAY_OF_WEEK)==1){
			dayForWeek=7;
		}
		else{
			dayForWeek=toDay.get(Calendar.DAY_OF_WEEK)-1;
		}
		return dayForWeek;
	}
	
	/**
	 * 获取输入时间相应分钟相应秒后的时间
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param min int
	 * @return Date yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateAfterMinutesAndSeconds(String dateStr,int min,int second) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =sdf.parse(dateStr);
		Calendar After = Calendar.getInstance();
		After.setTime(date);
		After.set(Calendar.MINUTE, After.get(Calendar.MINUTE)+min);
		After.set(Calendar.SECOND, After.get(Calendar.SECOND)+second);
		return After.getTime();
	}
	
	/**
	 * 获取输入时间相应分钟后的时间
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param min int
	 * @return Date yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateAfterMinutes(String dateStr,int min) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =sdf.parse(dateStr);
		Calendar After = Calendar.getInstance();
		After.setTime(date);
		After.set(Calendar.MINUTE, After.get(Calendar.MINUTE)+min);
		return After.getTime();
	}
	
	/**
	 * 获取输入时间相应秒后时间
	 * @author yh
	 * @param dateStr
	 * @param second
	 * @return
	 * @throws ParseException
	 */
	public static Date getDateAfterSeconds(String dateStr,int second) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =sdf.parse(dateStr);
		Calendar After = Calendar.getInstance();
		After.setTime(date);
		After.set(Calendar.SECOND, After.get(Calendar.SECOND)+second);
		return After.getTime();
	}
	
	/**
	 * 根据时间戳和给定小时与分钟获取时间
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param hourASndMinute
	 * @return yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateByDateAndHourAndMinute(String dateStr,String hourASndMinute) throws ParseException{
		String[] times=hourASndMinute.split(":");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =sdf.parse(dateStr);
		Calendar day = Calendar.getInstance();
		day.setTime(date);
		day.set(Calendar.HOUR_OF_DAY, Integer.parseInt(times[0]));
		day.set(Calendar.MINUTE, Integer.parseInt(times[1]));
		day.set(Calendar.SECOND, 00);
		day.set(Calendar.MILLISECOND, 000);
		return day.getTime();
	}
	
	/**
	 * 根据时间戳和给定小时与分钟获取相应分钟后时间
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param hourASndMinute
	 * @return yyyy-MM-dd HH:mm:ss
	 * @throws ParseException
	 */
	public static Date getDateAfterMinutesByDateAndHourAndMinute(String dateStr,String hourASndMinute,int min) throws ParseException{
		String[] times=hourASndMinute.split(":");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =sdf.parse(dateStr);
		Calendar day = Calendar.getInstance();
		day.setTime(date);
		day.set(Calendar.HOUR_OF_DAY, Integer.parseInt(times[0]));
		day.set(Calendar.MINUTE, Integer.parseInt(times[1]));
		day.set(Calendar.MINUTE, day.get(Calendar.MINUTE)+min);
		day.set(Calendar.SECOND, 00);
		day.set(Calendar.MILLISECOND, 000);
		return day.getTime();
	}
	
	/**
	 * 根据时间戳返回小时和分钟
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @return String HH:mm
	 * @throws ParseException
	 */
	public static String getHourAndMinuteByDate(String dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=sdf.parse(dateStr);
		Calendar now = Calendar.getInstance();
		now.setTime(date);
		/*SimpleDateFormat sdf1=new SimpleDateFormat("HH:mm");*/
		/*String date1=date.getHours()+":"+date.getMinutes();*/
		/*Date date2=sdf1.parse(date1);*/
		String date1=now.get(Calendar.HOUR_OF_DAY)+":"+now.get(Calendar.MINUTE)+":"+now.get(Calendar.MILLISECOND);
		sdf=new SimpleDateFormat("HH:mm:ss");
		Date date2=sdf.parse(date1);
		String date3=sdf.format(date2);
		return date3;
	}
	
	/**
	 * 根据时间戳获取相应分钟后的小时和分钟
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @param min int
	 * @return String HH:mm
	 * @throws ParseException
	 */
	public static String getHourAndMinuteAfterMinutesByDate(String dateStr,int min) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=sdf.parse(dateStr);
		Calendar After = Calendar.getInstance();
		After.setTime(date);
		After.set(Calendar.MINUTE, After.get(Calendar.MINUTE)+min);
		/*SimpleDateFormat sdf1=new SimpleDateFormat("HH:mm");
		Date date1=sdf1.parse();*/
		String date1=After.get(Calendar.HOUR_OF_DAY)+":"+After.get(Calendar.MINUTE);
		return date1;
	}
	
	/**
	 * 获取当前时间戳的年份
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @return YEAR int 
	 * @throws ParseException
	 */
	public static Integer getYearByDate(String dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=sdf.parse(dateStr);
		Calendar nowdate = Calendar.getInstance();
		nowdate.setTime(date);
		return nowdate.get(Calendar.YEAR);
	}
	
	/**
	 * 获取当前时间戳的月份
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @return MONTH int 
	 * @throws ParseException
	 */
	public static Integer getMonthByDate(String dateStr) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=sdf.parse(dateStr);
		Calendar nowdate = Calendar.getInstance();
		nowdate.setTime(date);
		return nowdate.get(Calendar.MONTH)+1;
	}

	/**
	 * 获取当前时间戳的日期
	 * @author yh
	 * @param dateStr yyyy-MM-dd HH:mm:ss
	 * @return String yyyy-MM-dd
	 * @throws ParseException
	 */
	public static String getToDayByDate(String dateStr) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=sdf.parse(dateStr);
		Calendar toDay = Calendar.getInstance();
		toDay.setTime(date);
		return toDay.get(Calendar.YEAR)+"-"+(toDay.get(Calendar.MONTH)+1)+"-"+toDay.get(Calendar.DAY_OF_MONTH);
	}
	
}
