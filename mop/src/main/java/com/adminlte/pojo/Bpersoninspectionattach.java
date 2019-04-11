package com.adminlte.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bpersoninspectionattach")
public class Bpersoninspectionattach implements Serializable{
	@TableId(type = IdType.AUTO)
    private Long id;

    private Long inpectid;

    private String title;

    private String url;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInpectid() {
        return inpectid;
    }

    public void setInpectid(Long inpectid) {
        this.inpectid = inpectid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "Bpersoninspectionattach [id=" + id + ", inpectid=" + inpectid + ", title=" + title + ", url=" + url
				+ ", remark=" + remark + "]";
	}
    
}