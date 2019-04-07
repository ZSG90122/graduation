package com.adminlte.pojo.vo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

public class BdevsystemVo implements Serializable{
	@TableId(type = IdType.AUTO)
	private Long id;

	private Long depid;

	private Long rchouseid;

	private String name;

	private Byte type;

	private String funlist;

	private Long mainenterpriseid;

	private Long managerid;

	private String descrip;

	private String remark;

	private String enterprisename;

	private String contactperson;

	private String username;

	private String typename;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDepid() {
		return depid;
	}

	public void setDepid(Long depid) {
		this.depid = depid;
	}

	public Long getRchouseid() {
		return rchouseid;
	}

	public void setRchouseid(Long rchouseid) {
		this.rchouseid = rchouseid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public String getFunlist() {
		return funlist;
	}

	public void setFunlist(String funlist) {
		this.funlist = funlist == null ? null : funlist.trim();
	}

	public Long getMainenterpriseid() {
		return mainenterpriseid;
	}

	public void setMainenterpriseid(Long mainenterpriseid) {
		this.mainenterpriseid = mainenterpriseid;
	}

	public Long getManagerid() {
		return managerid;
	}

	public void setManagerid(Long managerid) {
		this.managerid = managerid;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getEnterprisename() {
		return enterprisename;
	}

	public void setEnterprisename(String enterprisename) {
		this.enterprisename = enterprisename == null ? null : enterprisename.trim();
	}

	public String getContactperson() {
		return contactperson;
	}

	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

}
