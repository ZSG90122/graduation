package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.adminlte.commons.utils.scoreRuleEnum;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonProperty;

public class UachievementVo implements Serializable, Comparable<UachievementVo>{
	
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
	
	private String username;
	
	private String userImgUrl;
	
	private Integer sex;
	
	private String depname; //用户所在部门，这个需要查询从顶到用户所在的部门，如难以实现在程序端实现

	private double score;  // 该用户的的得分
	
	

	public UachievementVo(Long id, Long userId, Integer logtime, Integer newproject, Integer updateproject,
			Integer newbids, Integer updatebids, Integer newprogress, Integer deleteprogress, Integer newmilestone,
			Integer deletemilestone, Integer updatemilestone, Integer newdocument, Integer deletedocument,
			Integer newmessage, Integer deletemessage, String username,String userImgUrl,Integer sex, String depname) {
		super();
		this.id = id;
		this.userId = userId;
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
		this.username = username;
		this.userImgUrl = userImgUrl;
		this.sex = sex;
		this.depname = depname;
	}

	// 总分之星析构函数
	public UachievementVo(String username,String depname,String userImgUrl,Integer sex,Integer logtime, Integer newproject, Integer updateproject, Integer newbids,
			Integer updatebids, Integer newprogress, Integer deleteprogress, Integer newmilestone,
			Integer deletemilestone, Integer updatemilestone, Integer newdocument, Integer deletedocument,
			Integer newmessage, Integer deletemessage) {
			this.username =username;
			this.depname = depname;
			this.userImgUrl = userImgUrl;
			this.sex = sex;
			this.score = logtime * scoreRuleEnum.stateOf(1)+ newproject *scoreRuleEnum.stateOf(2)+ updateproject *scoreRuleEnum.stateOf(3)
			+ newbids *scoreRuleEnum.stateOf(4)+ updatebids *scoreRuleEnum.stateOf(5)+ newprogress *scoreRuleEnum.stateOf(6)
			+ deleteprogress *scoreRuleEnum.stateOf(7)+ newmilestone *scoreRuleEnum.stateOf(8)+ deletemilestone *scoreRuleEnum.stateOf(9)+ updatemilestone *scoreRuleEnum.stateOf(10)
			+ newdocument *scoreRuleEnum.stateOf(11)+ deletedocument *scoreRuleEnum.stateOf(12)+ newmessage *scoreRuleEnum.stateOf(13)
			+ deletemessage *scoreRuleEnum.stateOf(14);
	}

	// 信息完善之星
	public UachievementVo(String username,String depname,String userImgUrl,Integer sex,Integer updateproject, Integer updatebids, Integer updatemilestone) {
		this.username =username;
		this.depname = depname;
		this.userImgUrl = userImgUrl;
		this.sex = sex;
		this.score =  updateproject * scoreRuleEnum.stateOf(3)+updatebids*scoreRuleEnum.stateOf(5)+updatemilestone*scoreRuleEnum.stateOf(10);
	}
	
	// 贡献之星
	public UachievementVo(String username,String depname,String userImgUrl,Integer sex,Integer newproject, Integer updateproject, Integer newbids, Integer updatebids,
			Integer newprogress, Integer deleteprogress, Integer newmilestone, Integer deletemilestone,
			Integer updatemilestone, Integer newdocument, Integer deletedocument, Integer newmessage,
			Integer deletemessage) {
		this.username =username;
		this.depname = depname;
		this.userImgUrl = userImgUrl;
		this.sex = sex;
		this.score = newproject *scoreRuleEnum.stateOf(2)+ updateproject *scoreRuleEnum.stateOf(3)
		+ newbids *scoreRuleEnum.stateOf(4)+ updatebids *scoreRuleEnum.stateOf(5)+ newprogress *scoreRuleEnum.stateOf(6)
		+ deleteprogress *scoreRuleEnum.stateOf(7)+ newmilestone *scoreRuleEnum.stateOf(8)+ deletemilestone *scoreRuleEnum.stateOf(9)+ updatemilestone *scoreRuleEnum.stateOf(10)
		+ newdocument *scoreRuleEnum.stateOf(11)+ deletedocument *scoreRuleEnum.stateOf(12)+ newmessage *scoreRuleEnum.stateOf(13)
		+ deletemessage *scoreRuleEnum.stateOf(14);
	}

	// 活跃之星
	public UachievementVo(String username,String depname,String userImgUrl,Integer sex,Integer logtime) {
		this.username =username;
		this.depname = depname;
		this.userImgUrl = userImgUrl;
		this.sex = sex;
		this.score = logtime * scoreRuleEnum.stateOf(1);
	}
	
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDepname() {
		return depname;
	}

	public void setDepname(String depname) {
		this.depname = depname;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getUserImgUrl() {
		return userImgUrl;
	}

	public void setUserImgUrl(String userImgUrl) {
		this.userImgUrl = userImgUrl;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "UachievementVo [id=" + id + ", userId=" + userId + ", logtime=" + logtime + ", newproject=" + newproject
				+ ", updateproject=" + updateproject + ", newbids=" + newbids + ", updatebids=" + updatebids
				+ ", newprogress=" + newprogress + ", deleteprogress=" + deleteprogress + ", newmilestone="
				+ newmilestone + ", deletemilestone=" + deletemilestone + ", updatemilestone=" + updatemilestone
				+ ", newdocument=" + newdocument + ", deletedocument=" + deletedocument + ", newmessage=" + newmessage
				+ ", deletemessage=" + deletemessage + ", username=" + username + ", userImgUrl=" + userImgUrl
				+ ", sex=" + sex + ", depname=" + depname + ", score=" + score + "]";
	}

	@Override
	public int compareTo(UachievementVo o) {
		if(this.score <= o.getScore()){
			return 1;
		}
		return -1;
	}

}
