package com.adminlte.commons.utils;


/**
 * 
 * @author luo
 * 人才角色占比工具类
 *
 */
public class talentPieUtil{
	
	 
	 private String name;	// 人才角色或资历名称
	 private Long num;	//	占比
	 private double lang;
	 private double lat;
	 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public double getLang() {
		return lang;
	}
	public void setLang(double lang) {
		this.lang = lang;
	}
	public double getLet() {
		return lat;
	}
	public void setLet(double let) {
		this.lat = let;
	}
 
	@Override
	public String toString() {
		return "{name:'" + name + "', value:" + num + ", lang:" + lang + ", lat:" + lat + "}";
	}
	
}