package com.adminlte.pojo.vo;
/**
 * 主页状态信息实例类
 * @author 李谣顺
 *
 */
public class MainPageStateInfoVo {
	private String box_ip;
	private String box_name;
	private String box_streetname;
	private String warn_name;
	private String tb_id;
	private String box_lng;
	private String box_lat;
	private String box_area_id;
	private String box_group_id;
	
	
	public String getBox_area_id() {
		return box_area_id;
	}
	public void setBox_area_id(String box_area_id) {
		this.box_area_id = box_area_id;
	}
	public String getBox_group_id() {
		return box_group_id;
	}
	public void setBox_group_id(String box_group_id) {
		this.box_group_id = box_group_id;
	}
	public String getBox_lng() {
		return box_lng;
	}
	public void setBox_lng(String box_lng) {
		this.box_lng = box_lng;
	}
	public String getBox_lat() {
		return box_lat;
	}
	public void setBox_lat(String box_lat) {
		this.box_lat = box_lat;
	}
	
	public String getBox_ip() {
		return box_ip;
	}
	public void setBox_ip(String box_ip) {
		this.box_ip = box_ip;
	}
	public String getBox_name() {
		return box_name;
	}
	public void setBox_name(String box_name) {
		this.box_name = box_name;
	}
	public String getBox_streetname() {
		return box_streetname;
	}
	public void setBox_streetname(String box_streetname) {
		this.box_streetname = box_streetname;
	}
	public String getWarn_name() {
		return warn_name;
	}
	public void setWarn_name(String warn_name) {
		this.warn_name = warn_name;
	}
	public String getTb_id() {
		return tb_id;
	}
	public void setTb_id(String tb_id) {
		this.tb_id = tb_id;
	}
}
