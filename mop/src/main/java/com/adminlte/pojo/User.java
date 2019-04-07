package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

public class User implements Serializable {

	@TableId(type = IdType.AUTO)
	private Long id;

	@TableField(value = "login_name")
	private String loginName;

	private String name;
	
	private String passWord;

	private Long level;
	
	@TableField(value = "user_type")
	private Integer userType;

	private Integer status;

	@TableField(value = "department_id")
	private Integer departmentId;

	@TableField(value = "create_time")
	private Date createTime;
	
	@TableField(exist = false)  //@TableField(exist = false)是Mybatis-Plus的注解，它用在属性上，表示该属性不为数据库表字段，但又是必须使用的
	private String validCode;


	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getdepartmentId() {
		return this.departmentId;
	}

	public void setdepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getValidCode() {
		return validCode;
	}

	public void setValidCode(String validCode) {
		this.validCode = validCode;
	}

	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", name=" + name + ", passWord=" + passWord + ", level="
				+ level + ", userType=" + userType + ", status=" + status + ", departmentId=" + departmentId
				+ ", createTime=" + createTime + ", validCode=" + validCode + "]";
	}
}
