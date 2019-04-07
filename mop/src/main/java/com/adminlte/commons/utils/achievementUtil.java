package com.adminlte.commons.utils;

import java.math.BigDecimal;

public class achievementUtil {
	private BigDecimal logtime;
	
	private BigDecimal newproject;
	
	private BigDecimal updateproject;
	
	private BigDecimal newbids;
	
	private BigDecimal updatebids;
	
	private BigDecimal newprogress;
	
	private BigDecimal deleteprogress;
	
	private BigDecimal newmilestone;
	
	private BigDecimal deletemilestone;
	
	private BigDecimal updatemilestone;
	
	private BigDecimal newdocument;
	
	private BigDecimal deletedocument;
	
	private BigDecimal newmessage;
	
	private BigDecimal deletemessage;
	
	public achievementUtil(BigDecimal logtime, BigDecimal newproject, BigDecimal updateproject, BigDecimal newbids,
			BigDecimal updatebids, BigDecimal newprogress, BigDecimal deleteprogress, BigDecimal newmilestone,
			BigDecimal deletemilestone, BigDecimal updatemilestone, BigDecimal newdocument, BigDecimal deletedocument,
			BigDecimal newmessage, BigDecimal deletemessage) {
		super();
		this.logtime = logtime;
		this.newproject = newproject;
		this.updateproject = updateproject;
		this.newbids = newbids;
		this.updatebids = updatebids;
		this.newprogress = newprogress;
		this.deleteprogress = deleteprogress;
		this.newmilestone = newmilestone;
		this.deletemilestone = deletemilestone;
		this.updatemilestone = updatemilestone;
		this.newdocument = newdocument;
		this.deletedocument = deletedocument;
		this.newmessage = newmessage;
		this.deletemessage = deletemessage;
	}

	public BigDecimal getLogtime() {
		return logtime;
	}

	public void setLogtime(BigDecimal logtime) {
		this.logtime = logtime;
	}

	public BigDecimal getNewproject() {
		return newproject;
	}

	public void setNewproject(BigDecimal newproject) {
		this.newproject = newproject;
	}

	public BigDecimal getUpdateproject() {
		return updateproject;
	}

	public void setUpdateproject(BigDecimal updateproject) {
		this.updateproject = updateproject;
	}

	public BigDecimal getNewbids() {
		return newbids;
	}

	public void setNewbids(BigDecimal newbids) {
		this.newbids = newbids;
	}

	public BigDecimal getUpdatebids() {
		return updatebids;
	}

	public void setUpdatebids(BigDecimal updatebids) {
		this.updatebids = updatebids;
	}

	public BigDecimal getNewprogress() {
		return newprogress;
	}

	public void setNewprogress(BigDecimal newprogress) {
		this.newprogress = newprogress;
	}

	public BigDecimal getDeleteprogress() {
		return deleteprogress;
	}

	public void setDeleteprogress(BigDecimal deleteprogress) {
		this.deleteprogress = deleteprogress;
	}

	public BigDecimal getNewmilestone() {
		return newmilestone;
	}

	public void setNewmilestone(BigDecimal newmilestone) {
		this.newmilestone = newmilestone;
	}

	public BigDecimal getDeletemilestone() {
		return deletemilestone;
	}

	public void setDeletemilestone(BigDecimal deletemilestone) {
		this.deletemilestone = deletemilestone;
	}

	public BigDecimal getUpdatemilestone() {
		return updatemilestone;
	}

	public void setUpdatemilestone(BigDecimal updatemilestone) {
		this.updatemilestone = updatemilestone;
	}

	public BigDecimal getNewdocument() {
		return newdocument;
	}

	public void setNewdocument(BigDecimal newdocument) {
		this.newdocument = newdocument;
	}

	public BigDecimal getDeletedocument() {
		return deletedocument;
	}

	public void setDeletedocument(BigDecimal deletedocument) {
		this.deletedocument = deletedocument;
	}

	public BigDecimal getNewmessage() {
		return newmessage;
	}

	public void setNewmessage(BigDecimal newmessage) {
		this.newmessage = newmessage;
	}

	public BigDecimal getDeletemessage() {
		return deletemessage;
	}

	public void setDeletemessage(BigDecimal deletemessage) {
		this.deletemessage = deletemessage;
	}

	@Override
	public String toString() {
		return "achievementUtil [logtime=" + logtime + ", newproject=" + newproject + ", updateproject=" + updateproject
				+ ", newbids=" + newbids + ", updatebids=" + updatebids + ", newprogress=" + newprogress
				+ ", deleteprogress=" + deleteprogress + ", newmilestone=" + newmilestone + ", deletemilestone="
				+ deletemilestone + ", updatemilestone=" + updatemilestone + ", newdocument=" + newdocument
				+ ", deletedocument=" + deletedocument + ", newmessage=" + newmessage + ", deletemessage="
				+ deletemessage + "]";
	}
}
