package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.Bmessageinforattach;
import com.adminlte.pojo.Urole;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

public class BmessageinforVo implements Serializable{

    private Long id;

    private Long messagetypeId;
	private String messagetypename;//

    private String content;

    private Integer state;

    private Date createtime;

    private Long userId;
    private String userName;//

    private String title;

    private String remark;

    private List<Bmessagedispatch> dispatchList;//
    private List<Bmessageinforattach> attachList;//
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
  
    public Long getMessagetypeId() {
		return messagetypeId;
	}

	public void setMessagetypeId(Long messagetypeId) {
		this.messagetypeId = messagetypeId;
	}

	public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getMessagetypename() {
		return messagetypename;
	}

	public void setMessagetypename(String messagetypename) {
		this.messagetypename = messagetypename;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Bmessagedispatch> getDispatchList() {
		return dispatchList;
	}

	public void setDispatchList(List<Bmessagedispatch> dispatchList) {
		this.dispatchList = dispatchList;
	}

	public List<Bmessageinforattach> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<Bmessageinforattach> attachList) {
		this.attachList = attachList;
	}
    
    
}