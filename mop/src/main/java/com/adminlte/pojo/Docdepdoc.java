package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("docdepdoc") 
public class Docdepdoc implements Serializable{
	@TableId(type = IdType.AUTO)
    private Long id;

    private Long dtype;

    private String title;

    private String keyword;
    
    private String type;//文档的类型：image，PDF，word

    private String attur;

    private String docabstract;

    private Long visdep;

    private Long pubperson;
    private Integer persondepid;
    private Date pubtime;

    private Long seclevel;

    private Long downloadNumber;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDtype() {
        return dtype;
    }

    public void setDtype(Long dtype) {
        this.dtype = dtype;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getAttur() {
        return attur;
    }

    public void setAttur(String attur) {
        this.attur = attur == null ? null : attur.trim();
    }

    public String getDocabstract() {
        return docabstract;
    }

    public void setDocabstract(String docabstract) {
        this.docabstract = docabstract == null ? null : docabstract.trim();
    }

    public Long getVisdep() {
        return visdep;
    }

    public void setVisdep(Long visdep) {
        this.visdep = visdep;
    }

    public Long getPubperson() {
        return pubperson;
    }

    public void setPubperson(Long pubperson) {
        this.pubperson = pubperson;
    }

    public Date getPubtime() {
        return pubtime;
    }

    public void setPubtime(Date pubtime) {
        this.pubtime = pubtime;
    }

    public Long getSeclevel() {
        return seclevel;
    }

    public void setSeclevel(Long seclevel) {
        this.seclevel = seclevel;
    }

	public Long getDownloadNumber() {
		return downloadNumber;
	}

	public void setDownloadNumber(Long downloadNumber) {
		this.downloadNumber = downloadNumber;
	}

	@Override
	public String toString() {
		return "Docdepdoc [id=" + id + ", dtype=" + dtype + ", type=" + type + ", title=" + title + ", keyword=" + keyword + ", attur="
				+ attur + ", docabstract=" + docabstract + ", visdep=" + visdep + ", pubperson=" + pubperson
				+ ", pubtime=" + pubtime + ", seclevel=" + seclevel + ", downloadNumber=" + downloadNumber + "]";
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getPersondepid() {
		return persondepid;
	}

	public void setPersondepid(Integer persondepid) {
		this.persondepid = persondepid;
	}

	
}