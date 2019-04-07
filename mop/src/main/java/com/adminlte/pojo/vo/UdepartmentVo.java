package com.adminlte.pojo.vo;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonProperty;

public class UdepartmentVo {
	@TableId(type = IdType.AUTO)
	private Long id;
	
	private Long parentid;
	private String parentname;
	
	private String depcode;

	private String name;
	private String rename;
	
	private Integer deptypeId;
	private String deptypename;
	
	private String contacts;
	
	private Integer bolruin;
	
	private String telphone;

	private String address;

	private String introduce;
	
	private String remark;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getParentid() {
		return parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	public String getDepcode() {
		return depcode;
	}

	public void setDepcode(String depcode) {
		this.depcode = depcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getDeptypeId() {
		return deptypeId;
	}

	public void setDeptypeId(Integer deptypeId) {
		this.deptypeId = deptypeId;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getParentname() {
		return parentname;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
	}

	public String getDeptypename() {
		return deptypename;
	}

	public void setDeptypename(String deptypename) {
		this.deptypename = deptypename;
	}

	public String getRename() {
		return rename;
	}

	public void setRename(String rename) {
		this.rename = rename;
	}

	public Integer getBolruin() {
		return bolruin;
	}

	public void setBolruin(Integer bolruin) {
		this.bolruin = bolruin;
	}

	
}
