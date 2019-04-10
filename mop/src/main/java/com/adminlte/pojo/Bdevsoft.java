package com.adminlte.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bdevsoft")
public class Bdevsoft implements Serializable {

	@TableId(type = IdType.AUTO)
	private Long id;

	private Long rchouseid;

	private String devcode;

	private String name;

	private Long devsystemid;

	private Long systemtypeid;

	private Long devtypeid;

	private Long maintenid;

	private String typecode;

	private Long mngpersonid;

	private Long depid;

	private String application;

	private Long providerenterpriseid;

	private Long madeenterpriseid;

	private Date leavedate;

	private String leavecode;

	private Date buydate;

	private String buyaddress;

	private Float devrevalue;

	private String assectcode;

	private String buyperson;

	private Date qualdate;

	private Date repairdate;

	private Date scrapdate;

	private Long installrchouseid;

	private Long usepersonid;

	private Date installdate;

	private Long installenterpriseid;

	private String installreson;

	private String mainip;

	private String mainport;

	private String tprotocal1;

	private String tprotocal2;

	private String username;

	private String password;

	private String remark;

	public Bdevsoft() {
		super();
	}

	public Bdevsoft(Long id, Long rchouseid,Long devsystemid, String devcode, String name, Long systemtypeid, Long devtypeid,
			Long maintenid, String typecode, Long mngpersonid, Long depid, String application,
			Long providerenterpriseid, Long madeenterpriseid, Date leavedate, String leavecode, Date buydate,
			String buyaddress, Float devrevalue, String assectcode, String buyperson, Date qualdate, Date repairdate,
			Date scrapdate, Long installrchouseid, Long usepersonid, Date installdate, Long installenterpriseid,
			String installreson, String mainip, String mainport, String tprotocal1, String tprotocal2, String username,
			String password, String remark) {
		super();
		this.id = id;
		this.rchouseid = rchouseid;
		this.devsystemid = devsystemid;
		this.devcode = devcode;
		this.name = name;
		this.systemtypeid = systemtypeid;
		this.devtypeid = devtypeid;
		this.maintenid = maintenid;
		this.typecode = typecode;
		this.mngpersonid = mngpersonid;
		this.depid = depid;
		this.application = application;
		this.providerenterpriseid = providerenterpriseid;
		this.madeenterpriseid = madeenterpriseid;
		this.leavedate = leavedate;
		this.leavecode = leavecode;
		this.buydate = buydate;
		this.buyaddress = buyaddress;
		this.devrevalue = devrevalue;
		this.assectcode = assectcode;
		this.buyperson = buyperson;
		this.qualdate = qualdate;
		this.repairdate = repairdate;
		this.scrapdate = scrapdate;
		this.installrchouseid = installrchouseid;
		this.usepersonid = usepersonid;
		this.installdate = installdate;
		this.installenterpriseid = installenterpriseid;
		this.installreson = installreson;
		this.mainip = mainip;
		this.mainport = mainport;
		this.tprotocal1 = tprotocal1;
		this.tprotocal2 = tprotocal2;
		this.username = username;
		this.password = password;
		this.remark = remark;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getRchouseid() {
		return rchouseid;
	}

	public void setRchouseid(Long rchouseid) {
		this.rchouseid = rchouseid;
	}

	public String getDevcode() {
		return devcode;
	}

	public void setDevcode(String devcode) {
		this.devcode = devcode == null ? null : devcode.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Long getSystemtypeid() {
		return systemtypeid;
	}

	public void setSystemtypeid(Long systemtypeid) {
		this.systemtypeid = systemtypeid;
	}

	public Long getDevtypeid() {
		return devtypeid;
	}

	public void setDevtypeid(Long devtypeid) {
		this.devtypeid = devtypeid;
	}

	public Long getMaintenid() {
		return maintenid;
	}

	public void setMaintenid(Long maintenid) {
		this.maintenid = maintenid;
	}

	public String getTypecode() {
		return typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode == null ? null : typecode.trim();
	}

	public Long getMngpersonid() {
		return mngpersonid;
	}

	public void setMngpersonid(Long mngpersonid) {
		this.mngpersonid = mngpersonid;
	}

	public Long getDepid() {
		return depid;
	}

	public void setDepid(Long depid) {
		this.depid = depid;
	}

	public String getApplication() {
		return application;
	}

	public void setApplication(String application) {
		this.application = application == null ? null : application.trim();
	}

	public Long getProviderenterpriseid() {
		return providerenterpriseid;
	}

	public void setProviderenterpriseid(Long providerenterpriseid) {
		this.providerenterpriseid = providerenterpriseid;
	}

	public Long getMadeenterpriseid() {
		return madeenterpriseid;
	}

	public void setMadeenterpriseid(Long madeenterpriseid) {
		this.madeenterpriseid = madeenterpriseid;
	}

	public Date getLeavedate() {
		return leavedate;
	}

	public void setLeavedate(Date leavedate) {
		this.leavedate = leavedate;
	}

	public String getLeavecode() {
		return leavecode;
	}

	public void setLeavecode(String leavecode) {
		this.leavecode = leavecode == null ? null : leavecode.trim();
	}

	public Date getBuydate() {
		return buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public String getBuyaddress() {
		return buyaddress;
	}

	public void setBuyaddress(String buyaddress) {
		this.buyaddress = buyaddress == null ? null : buyaddress.trim();
	}

	public Float getDevrevalue() {
		return devrevalue;
	}

	public void setDevrevalue(Float devrevalue) {
		this.devrevalue = devrevalue;
	}

	public String getAssectcode() {
		return assectcode;
	}

	public void setAssectcode(String assectcode) {
		this.assectcode = assectcode == null ? null : assectcode.trim();
	}

	public String getBuyperson() {
		return buyperson;
	}

	public void setBuyperson(String buyperson) {
		this.buyperson = buyperson == null ? null : buyperson.trim();
	}

	public Date getQualdate() {
		return qualdate;
	}

	public void setQualdate(Date qualdate) {
		this.qualdate = qualdate;
	}

	public Date getRepairdate() {
		return repairdate;
	}

	public void setRepairdate(Date repairdate) {
		this.repairdate = repairdate;
	}

	public Date getScrapdate() {
		return scrapdate;
	}

	public void setScrapdate(Date scrapdate) {
		this.scrapdate = scrapdate;
	}

	public Long getInstallrchouseid() {
		return installrchouseid;
	}

	public void setInstallrchouseid(Long installrchouseid) {
		this.installrchouseid = installrchouseid;
	}

	public Long getUsepersonid() {
		return usepersonid;
	}

	public void setUsepersonid(Long usepersonid) {
		this.usepersonid = usepersonid;
	}

	public Date getInstalldate() {
		return installdate;
	}

	public void setInstalldate(Date installdate) {
		this.installdate = installdate;
	}

	public Long getInstallenterpriseid() {
		return installenterpriseid;
	}

	public void setInstallenterpriseid(Long installenterpriseid) {
		this.installenterpriseid = installenterpriseid;
	}

	public String getInstallreson() {
		return installreson;
	}

	public void setInstallreson(String installreson) {
		this.installreson = installreson == null ? null : installreson.trim();
	}

	public String getMainip() {
		return mainip;
	}

	public void setMainip(String mainip) {
		this.mainip = mainip == null ? null : mainip.trim();
	}

	public String getMainport() {
		return mainport;
	}

	public void setMainport(String mainport) {
		this.mainport = mainport == null ? null : mainport.trim();
	}

	public String getTprotocal1() {
		return tprotocal1;
	}

	public void setTprotocal1(String tprotocal1) {
		this.tprotocal1 = tprotocal1 == null ? null : tprotocal1.trim();
	}

	public String getTprotocal2() {
		return tprotocal2;
	}

	public void setTprotocal2(String tprotocal2) {
		this.tprotocal2 = tprotocal2 == null ? null : tprotocal2.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Long getDevsystemid() {
		return devsystemid;
	}

	public void setDevsystemid(Long devsystemid) {
		this.devsystemid = devsystemid;
	}

	@Override
	public String toString() {
		return "Bdevsoft [id=" + id + ", rchouseid=" + rchouseid + ", devcode=" + devcode + ", name=" + name
				+ ", systemtypeid=" + systemtypeid + ", devtypeid=" + devtypeid + ", maintenid=" + maintenid
				+ ", typecode=" + typecode + ", mngpersonid=" + mngpersonid + ", depid=" + depid + ", application="
				+ application + ", providerenterpriseid=" + providerenterpriseid + ", madeenterpriseid="
				+ madeenterpriseid + ", leavedate=" + leavedate + ", leavecode=" + leavecode + ", buydate=" + buydate
				+ ", buyaddress=" + buyaddress + ", devrevalue=" + devrevalue + ", assectcode=" + assectcode
				+ ", buyperson=" + buyperson + ", qualdate=" + qualdate + ", repairdate=" + repairdate + ", scrapdate="
				+ scrapdate + ", installrchouseid=" + installrchouseid + ", usepersonid=" + usepersonid
				+ ", installdate=" + installdate + ", installenterpriseid=" + installenterpriseid + ", installreson="
				+ installreson + ", mainip=" + mainip + ", mainport=" + mainport + ", tprotocal1=" + tprotocal1
				+ ", tprotocal2=" + tprotocal2 + ", username=" + username + ", password=" + password + ", remark="
				+ remark + "]";
	}
}