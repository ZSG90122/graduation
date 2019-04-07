package com.adminlte.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bmessagedispatch") 
public class Bmessagedispatch implements Serializable{

	@TableId(type = IdType.AUTO)
    private Long id;

	@TableField(value = "message_id")
    private Long messageId;

	@TableField(value = "receiveuser_id")
    private Long receiveuserId;

    private Integer state;

    private String remark;

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
}