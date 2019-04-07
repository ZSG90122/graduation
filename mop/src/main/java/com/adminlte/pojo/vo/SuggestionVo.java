package com.adminlte.pojo.vo;

import java.sql.Timestamp;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;


@TableName("usuggestion") 
public class SuggestionVo {
	@TableId(type = IdType.AUTO)
	private Integer id;
	
	private String message;
	
	@TableField(value = "user_id")
	private Long userId;
	
	private Integer messagestatus=1;
	
	private Integer resultstatus=1;
	
	@TableField(value = "project_id")
	private Long projectId;
	
	@TableField(value = "creat_time")
	private Timestamp creatTime;
	
	@TableField(value = "deal_time")
	private Timestamp dealTime;
	
	private String dealresult;
	
	private String userName;
	
	private String projectName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getMessagestatus() {
		return messagestatus;
	}

	public void setMessagestatus(Integer messagestatus) {
		this.messagestatus = messagestatus;
	}

	public Integer getResultstatus() {
		return resultstatus;
	}

	public void setResultstatus(Integer resultstatus) {
		this.resultstatus = resultstatus;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public Timestamp getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Timestamp creatTime) {
		this.creatTime = creatTime;
	}

	public Timestamp getDealTime() {
		return dealTime;
	}

	public void setDealTime(Timestamp dealTime) {
		this.dealTime = dealTime;
	}

	public String getDealresult() {
		return dealresult;
	}

	public void setDealresult(String dealresult) {
		this.dealresult = dealresult;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Override
	public String toString() {
		return "SuggestionVo [id=" + id + ", message=" + message + ", userId=" + userId + ", messagestatus="
				+ messagestatus + ", resultstatus=" + resultstatus + ", projectId=" + projectId + ", creatTime="
				+ creatTime + ", dealTime=" + dealTime + ", dealresult=" + dealresult + ", userName=" + userName
				+ ", projectName=" + projectName + "]";
	}
}
