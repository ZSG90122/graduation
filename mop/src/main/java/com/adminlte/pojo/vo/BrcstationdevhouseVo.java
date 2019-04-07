package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;


public class BrcstationdevhouseVo implements Serializable{
    
    private Long id;

    private Byte type;

    private String code;

    private Long owerdep;

    private String name;

    private String address;

    private Long depid;

    private Long mngpersonid;

    private String remark;

    private Byte leveltype;

    private Byte funtype;
    
    private String funtionlist;

    private Float lng;

    private Float lat;

    private String mainprotocal;

    private String mainip;

    private Date intalltime;

    private Date qualitytime;

    private Date repairtime;

    private Long supdep;

    private Long condep;

    private Float revalue;
    
    private Long fillpersonid;
    
    private String ownerdepname; //业主单位的名字
    
    private String supdepname; //供应商的名字

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Long getOwerdep() {
        return owerdep;
    }

    public void setOwerdep(Long owerdep) {
        this.owerdep = owerdep;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Long getDepid() {
        return depid;
    }

    public void setDepid(Long depid) {
        this.depid = depid;
    }

    public Long getMngpersonid() {
        return mngpersonid;
    }

    public void setMngpersonid(Long mngpersonid) {
        this.mngpersonid = mngpersonid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Byte getLeveltype() {
        return leveltype;
    }

    public void setLeveltype(Byte leveltype) {
        this.leveltype = leveltype;
    }

    public Byte getFuntype() {
        return funtype;
    }

    public void setFuntype(Byte funtype) {
        this.funtype = funtype;
    }
    
    public String getFuntionlist() {
		return funtionlist;
	}

	public void setFuntionlist(String funtionlist) {
		this.funtionlist = funtionlist;
	}

	public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public String getMainprotocal() {
        return mainprotocal;
    }

    public void setMainprotocal(String mainprotocal) {
        this.mainprotocal = mainprotocal == null ? null : mainprotocal.trim();
    }

    public String getMainip() {
        return mainip;
    }

    public void setMainip(String mainip) {
        this.mainip = mainip == null ? null : mainip.trim();
    }

    public Date getIntalltime() {
        return intalltime;
    }

    public void setIntalltime(Date intalltime) {
        this.intalltime = intalltime;
    }

    public Date getQualitytime() {
        return qualitytime;
    }

    public void setQualitytime(Date qualitytime) {
        this.qualitytime = qualitytime;
    }

    public Date getRepairtime() {
        return repairtime;
    }

    public void setRepairtime(Date repairtime) {
        this.repairtime = repairtime;
    }

    public Long getSupdep() {
        return supdep;
    }

    public void setSupdep(Long supdep) {
        this.supdep = supdep;
    }

    public Long getCondep() {
        return condep;
    }

    public void setCondep(Long condep) {
        this.condep = condep;
    }

    public Float getRevalue() {
        return revalue;
    }

    public void setRevalue(Float revalue) {
        this.revalue = revalue;
    }
    
	public Long getFillpersonid() {
		return fillpersonid;
	}

	public void setFillpersonid(Long fillpersonid) {
		this.fillpersonid = fillpersonid;
	}

	public String getOwnerdepname() {
		return ownerdepname;
	}

	public void setOwnerdepname(String ownerdepname) {
		this.ownerdepname = ownerdepname;
	}

	public String getSupdepname() {
		return supdepname;
	}

	public void setSupdepname(String supdepname) {
		this.supdepname = supdepname;
	}
        
}