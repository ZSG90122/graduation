package com.adminlte.pojo.vo;
import java.io.Serializable;
import java.util.Date;	
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("docdepdoc") 
public class docdepVo implements Serializable{

	@TableId(type = IdType.AUTO)
    private Long id;
    private Long dtype;
    private String typeName;
    private String title;
    private String keyword;
    private String type;
    private String attur;
    private String docabstract;
    private Long visdep;
    private String depName;
    private Long pubperson;
    private Integer persondepid;
    private Date pubtime;
    private Long seclevel;
    private String seclevelName;
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
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getAttur() {
		return attur;
	}
	public void setAttur(String attur) {
		this.attur = attur;
	}
	public String getDocabstract() {
		return docabstract;
	}
	public void setDocabstract(String docabstract) {
		this.docabstract = docabstract;
	}
	public Long getVisdep() {
		return visdep;
	}
	public void setVisdep(Long visdep) {
		this.visdep = visdep;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
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
	public String getSeclevelName() {
		return seclevelName;
	}
	public void setSeclevelName(String seclevelName) {
		this.seclevelName = seclevelName;
	}
	
	public Long getDownloadNumber() {
		return downloadNumber;
	}
	public void setDownloadNumber(Long downloadNumber) {
		this.downloadNumber = downloadNumber;
	}
	@Override
	public String toString() {
		return "docdepVo [id=" + id + ", dtype=" + dtype + ",type=" + type + ", typeName=" + typeName + ", title=" + title + ", keyword="
				+ keyword + ", attur=" + attur + ", docabstract=" + docabstract + ", visdep=" + visdep + ", depName="
				+ depName + ", pubperson=" + pubperson + ", pubtime=" + pubtime + ", seclevel=" + seclevel
				+ ", seclevelName=" + seclevelName + ", downloadNumber=" + downloadNumber + "]";
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
