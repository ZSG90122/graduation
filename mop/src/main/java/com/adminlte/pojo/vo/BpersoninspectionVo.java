package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.adminlte.pojo.Bpersoninspectionattach;

public class BpersoninspectionVo implements Serializable {
	private Long id;

	private Long owerdep;

	private Long redevid;

	private Long typeid;

	private Long taskid;

	private String name;

	private String inspectcontent;

	private String inspectresult;

	private Byte state;

	private Byte isfault;

	private Date inspecttime;

	private String inspectperson;

	private Date filltime;

	private Long fillpersonid;

	private Long verifypersonid;

	private String remark;

	private String owerdepname;

	private String redevname;
	
	private String inspecttypename;
	
	private List<Bpersoninspectionattach> bpersoninspectionattachs;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOwerdep() {
		return owerdep;
	}

	public void setOwerdep(Long owerdep) {
		this.owerdep = owerdep;
	}

	public Long getRedevid() {
		return redevid;
	}

	public void setRedevid(Long redevid) {
		this.redevid = redevid;
	}

	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}

	public Long getTaskid() {
		return taskid;
	}

	public void setTaskid(Long taskid) {
		this.taskid = taskid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getInspectcontent() {
		return inspectcontent;
	}

	public void setInspectcontent(String inspectcontent) {
		this.inspectcontent = inspectcontent == null ? null : inspectcontent.trim();
	}

	public String getInspectresult() {
		return inspectresult;
	}

	public void setInspectresult(String inspectresult) {
		this.inspectresult = inspectresult == null ? null : inspectresult.trim();
	}

	public Byte getState() {
		return state;
	}

	public void setState(Byte state) {
		this.state = state;
	}

	public Byte getIsfault() {
		return isfault;
	}

	public void setIsfault(Byte isfault) {
		this.isfault = isfault;
	}

	public Date getInspecttime() {
		return inspecttime;
	}

	public void setInspecttime(Date inspecttime) {
		this.inspecttime = inspecttime;
	}

	public String getInspectperson() {
		return inspectperson;
	}

	public void setInspectperson(String inspectperson) {
		this.inspectperson = inspectperson == null ? null : inspectperson.trim();
	}

	public Date getFilltime() {
		return filltime;
	}

	public void setFilltime(Date filltime) {
		this.filltime = filltime;
	}

	public Long getFillpersonid() {
		return fillpersonid;
	}

	public void setFillpersonid(Long fillpersonid) {
		this.fillpersonid = fillpersonid;
	}

	public Long getVerifypersonid() {
		return verifypersonid;
	}

	public void setVerifypersonid(Long verifypersonid) {
		this.verifypersonid = verifypersonid;
	}

	public String getRemark() {
		return remark;
	}

	public String getOwerdepname() {
		return owerdepname;
	}

	public void setOwerdepname(String owerdepname) {
		this.owerdepname = owerdepname;
	}

	public String getRedevname() {
		return redevname;
	}

	public void setRedevname(String redevname) {
		this.redevname = redevname;
	}

	public String getInspecttypename() {
		return inspecttypename;
	}

	public void setInspecttypename(String inspecttypename) {
		this.inspecttypename = inspecttypename;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public List<Bpersoninspectionattach> getBpersoninspectionattachs() {
		return bpersoninspectionattachs;
	}

	public void setBpersoninspectionattachs(List<Bpersoninspectionattach> bpersoninspectionattachs) {
		this.bpersoninspectionattachs = bpersoninspectionattachs;
	}
	
}
