package com.adminlte.pojo;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonProperty;


//单位和企业，组织机构管理模块，用于独立单位级别，
public class Udepartment {
	@TableId(type = IdType.AUTO)
	private Long id;
	
	private Long parentid;
	
	private String depcode;

	private String name;
	
	private String rename;
	
	@TableField(value = "deptype_id")
	private Integer deptypeId;
	
	private String contacts;
	
	private String telphone;

	private Integer bolruin;
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepcode() {
		return depcode;
	}

	public void setDepcode(String depcode) {
		this.depcode = depcode;
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

	@Override
	public String toString() {
		return "Udepartment [id=" + id + ", parentid=" + parentid + ", depcode=" + depcode + ", name=" + name
				+ ", deptypeId=" + deptypeId + ", contacts=" + contacts + ", telphone=" + telphone + ", address="
				+ address + ", introduce=" + introduce + ", remark=" + remark + "]";
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
