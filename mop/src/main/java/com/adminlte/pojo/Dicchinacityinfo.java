package com.adminlte.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("dicchinacityinfo") //项目的类型
public class Dicchinacityinfo implements Serializable{
	
	@TableId(type = IdType.AUTO)
	private Long id;
	private String cityid;
	private String cityname;
	private String parentcityid;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public String getCityid() {
		return cityid;
	}
	public void setCityid(String cityid) {
		this.cityid = cityid;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public String getParentcityid() {
		return parentcityid;
	}
	public void setParentcityid(String parentcityid) {
		this.parentcityid = parentcityid;
	}
	
	
	
	
	
}
