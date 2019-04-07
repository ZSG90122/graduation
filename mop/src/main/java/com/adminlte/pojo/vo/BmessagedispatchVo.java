package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.util.List;

import com.adminlte.pojo.Bmessageinfor;
import com.adminlte.pojo.Bmessageinforattach;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

public class BmessagedispatchVo implements Serializable{

    private Long id;

    private Long messageId;

    private Long receiveuserId;

    private Integer state;

    private String remark;
    
    private String userName;//
    private String depName;//
    private List<Bmessageinfor> messageList;//

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMessageId() {
        return messageId;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public Long getReceiveuserId() {
        return receiveuserId;
    }

    public void setReceiveuserId(Long receiveuserId) {
        this.receiveuserId = receiveuserId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public List<Bmessageinfor> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Bmessageinfor> messageList) {
		this.messageList = messageList;
	}
    
    
}