package com.adminlte.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bdevsystem")
public class Bdevsystem implements Serializable{
    
	@TableId(type = IdType.AUTO)
    private Long id;

    private Long depid;

    private Long rchouseid;

    private String name;

    private Byte type;

    private String funlist;

    private Long mainenterpriseid;

    private Long managerid;

    private String descrip;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDepid() {
        return depid;
    }

    public void setDepid(Long depid) {
        this.depid = depid;
    }

    public Long getRchouseid() {
        return rchouseid;
    }

    public void setRchouseid(Long rchouseid) {
        this.rchouseid = rchouseid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public String getFunlist() {
        return funlist;
    }

    public void setFunlist(String funlist) {
        this.funlist = funlist == null ? null : funlist.trim();
    }

    public Long getMainenterpriseid() {
        return mainenterpriseid;
    }

    public void setMainenterpriseid(Long mainenterpriseid) {
        this.mainenterpriseid = mainenterpriseid;
    }

    public Long getManagerid() {
        return managerid;
    }

    public void setManagerid(Long managerid) {
        this.managerid = managerid;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip == null ? null : descrip.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}