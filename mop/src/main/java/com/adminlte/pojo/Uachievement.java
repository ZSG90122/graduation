package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Uachievement implements Serializable{
	
	@TableId(type = IdType.AUTO)
	private Long id;
	
	@TableField(value = "user_id")
	private Long userId;
	
	private Integer logtime;
	
	private Integer newproject;
	
	private Integer updateproject;
	
	private Integer newbids;
	
	private Integer updatebids;
	
	private Integer newprogress;
	
	private Integer deleteprogress;
	
	private Integer newmilestone;
	
	private Integer deletemilestone;
	
	private Integer updatemilestone;
	
	private Integer newdocument;
	
	private Integer deletedocument;
	
	private Integer newmessage;
	
	private Integer deletemessage;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getLogtime() {
		return logtime;
	}

	public void setLogtime(Integer logtime) {
		this.logtime = logtime;
	}

	public Integer getNewproject() {
		return newproject;
	}

	public void setNewproject(Integer newproject) {
		this.newproject = newproject;
	}

	public Integer getUpdateproject() {
		return updateproject;
	}

	public void setUpdateproject(Integer updateproject) {
		this.updateproject = updateproject;
	}

	public Integer getNewbids() {
		return newbids;
	}

	public void setNewbids(Integer newbids) {
		this.newbids = newbids;
	}

	public Integer getUpdatebids() {
		return updatebids;
	}

	public void setUpdatebids(Integer updatebids) {
		this.updatebids = updatebids;
	}

	public Integer getNewprogress() {
		return newprogress;
	}

	public void setNewprogress(Integer newprogress) {
		this.newprogress = newprogress;
	}

	public Integer getDeleteprogress() {
		return deleteprogress;
	}

	public void setDeleteprogress(Integer deleteprogress) {
		this.deleteprogress = deleteprogress;
	}

	public Integer getNewmilestone() {
		return newmilestone;
	}

	public void setNewmilestone(Integer newmilestone) {
		this.newmilestone = newmilestone;
	}

	public Integer getDeletemilestone() {
		return deletemilestone;
	}

	public void setDeletemilestone(Integer deletemilestone) {
		this.deletemilestone = deletemilestone;
	}

	public Integer getUpdatemilestone() {
		return updatemilestone;
	}

	public void setUpdatemilestone(Integer updatemilestone) {
		this.updatemilestone = updatemilestone;
	}

	public Integer getNewdocument() {
		return newdocument;
	}

	public void setNewdocument(Integer newdocument) {
		this.newdocument = newdocument;
	}

	public Integer getDeletedocument() {
		return deletedocument;
	}

	public void setDeletedocument(Integer deletedocument) {
		this.deletedocument = deletedocument;
	}

	public Integer getNewmessage() {
		return newmessage;
	}

	public void setNewmessage(Integer newmessage) {
		this.newmessage = newmessage;
	}

	public Integer getDeletemessage() {
		return deletemessage;
	}

	public void setDeletemessage(Integer deletemessage) {
		this.deletemessage = deletemessage;
	}
	
	
}
