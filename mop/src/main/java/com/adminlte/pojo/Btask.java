package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableName;

@TableName("btask")
public class Btask implements Serializable{
    private Long id;

    private Long type;

    private String taskcontent;

    private Byte state;

    private String transperson;

    private Date transtime;

    private Long fillperson;

    private Date filltime;

    private String finishcontent;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getType() {
        return type;
    }

    public void setType(Long type) {
        this.type = type;
    }

    public String getTaskcontent() {
        return taskcontent;
    }

    public void setTaskcontent(String taskcontent) {
        this.taskcontent = taskcontent == null ? null : taskcontent.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public String getTransperson() {
        return transperson;
    }

    public void setTransperson(String transperson) {
        this.transperson = transperson == null ? null : transperson.trim();
    }

    public Date getTranstime() {
        return transtime;
    }

    public void setTranstime(Date transtime) {
        this.transtime = transtime;
    }

    public Long getFillperson() {
        return fillperson;
    }

    public void setFillperson(Long fillperson) {
        this.fillperson = fillperson;
    }

    public Date getFilltime() {
        return filltime;
    }

    public void setFilltime(Date filltime) {
        this.filltime = filltime;
    }

    public String getFinishcontent() {
        return finishcontent;
    }

    public void setFinishcontent(String finishcontent) {
        this.finishcontent = finishcontent == null ? null : finishcontent.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}