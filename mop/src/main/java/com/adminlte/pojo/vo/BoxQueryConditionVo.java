package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//查询条件
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class BoxQueryConditionVo implements Serializable{
   
	private Long boxAreaId;//
    private String boxAreaName;//

    private Long boxGroupId;//
    private String boxGroupName; //
	
    private String boxIp;  
    private String boxName;
    
    private Timestamp beginTime;
    
    private Timestamp endTime;

    private Integer groupby; //3天 4小时

	public Long getBoxAreaId() {
		return boxAreaId;
	}

	public void setBoxAreaId(Long boxAreaId) {
		this.boxAreaId = boxAreaId;
	}

	public String getBoxAreaName() {
		return boxAreaName;
	}

	public void setBoxAreaName(String boxAreaName) {
		this.boxAreaName = boxAreaName;
	}

	public Long getBoxGroupId() {
		return boxGroupId;
	}

	public void setBoxGroupId(Long boxGroupId) {
		this.boxGroupId = boxGroupId;
	}

	public String getBoxGroupName() {
		return boxGroupName;
	}

	public void setBoxGroupName(String boxGroupName) {
		this.boxGroupName = boxGroupName;
	}

	public String getBoxIp() {
		return boxIp;
	}

	public void setBoxIp(String boxIp) {
		this.boxIp = boxIp;
	}

	public String getBoxName() {
		return boxName;
	}

	public void setBoxName(String boxName) {
		this.boxName = boxName;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Integer getGroupby() {
		return groupby;
	}

	public void setGroupby(Integer groupby) {
		this.groupby = groupby;
	}

	@Override
	public String toString() {
		return "BoxQueryConditionVo [boxAreaId=" + boxAreaId + ", boxAreaName=" + boxAreaName + ", boxGroupId="
				+ boxGroupId + ", boxGroupName=" + boxGroupName + ", boxIp=" + boxIp + ", boxName=" + boxName
				+ ", beginTime=" + beginTime + ", endTime=" + endTime + ", groupby=" + groupby + "]";
	}
	
}