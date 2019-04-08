package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bfault")
public class Bfault implements Serializable {
	@TableId(type = IdType.AUTO)
	private Long id;

	private Long typeid;

	private Long souce;

	private Long inpectid;

	private Long redevid;

	private Long systemid;

	private String faultdes;

	private Byte state;

	private String solution;

	private String solutionresult;

	private Date findtime;

	private Date veriytime;

	private Date soluttime;

	private String findperson;

	private Long fillperson;

	private Long veriyperson;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}

	public Long getSouce() {
		return souce;
	}

	public void setSouce(Long souce) {
		this.souce = souce;
	}

	public Long getInpectid() {
		return inpectid;
	}

	public void setInpectid(Long inpectid) {
		this.inpectid = inpectid;
	}

	public Long getRedevid() {
		return redevid;
	}

	public void setRedevid(Long redevid) {
		this.redevid = redevid;
	}

	public Long getSystemid() {
		return systemid;
	}

	public void setSystemid(Long systemid) {
		this.systemid = systemid;
	}

	public String getFaultdes() {
		return faultdes;
	}

	public void setFaultdes(String faultdes) {
		this.faultdes = faultdes == null ? null : faultdes.trim();
	}

	public Byte getState() {
		return state;
	}

	public void setState(Byte state) {
		this.state = state;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution == null ? null : solution.trim();
	}

	public String getSolutionresult() {
		return solutionresult;
	}

	public void setSolutionresult(String solutionresult) {
		this.solutionresult = solutionresult == null ? null : solutionresult.trim();
	}

	public Date getFindtime() {
		return findtime;
	}

	public void setFindtime(Date findtime) {
		this.findtime = findtime;
	}

	public Date getVeriytime() {
		return veriytime;
	}

	public void setVeriytime(Date veriytime) {
		this.veriytime = veriytime;
	}

	public Date getSoluttime() {
		return soluttime;
	}

	public void setSoluttime(Date soluttime) {
		this.soluttime = soluttime;
	}

	public String getFindperson() {
		return findperson;
	}

	public void setFindperson(String findperson) {
		this.findperson = findperson == null ? null : findperson.trim();
	}

	public Long getFillperson() {
		return fillperson;
	}

	public void setFillperson(Long fillperson) {
		this.fillperson = fillperson;
	}

	public Long getVeriyperson() {
		return veriyperson;
	}

	public void setVeriyperson(Long veriyperson) {
		this.veriyperson = veriyperson;
	}
}