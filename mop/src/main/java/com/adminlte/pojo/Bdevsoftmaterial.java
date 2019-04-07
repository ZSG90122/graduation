package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bdevsoftmaterial")
public class Bdevsoftmaterial implements Serializable{
    
	@TableId(type = IdType.AUTO)
    private Long id;

    private Long devsoftid;

    private String title;

    private String content;

    private Byte type;

    private String url;

    private Date uptime;

    private Long uppersonid;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDevsoftid() {
        return devsoftid;
    }

    public void setDevsoftid(Long devsoftid) {
        this.devsoftid = devsoftid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }

    public Long getUppersonid() {
        return uppersonid;
    }

    public void setUppersonid(Long uppersonid) {
        this.uppersonid = uppersonid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}