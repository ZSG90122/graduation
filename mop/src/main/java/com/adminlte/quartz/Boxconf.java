package com.adminlte.quartz;

import java.io.Serializable;

//用于站点的控制信息
public class Boxconf implements Serializable{
	private String boxIp;
	private boolean isMeasureSave;//测量信息是否已经保存
	private boolean isControlSave; //控制信息是否保存
	public String getBoxIp() {
		return boxIp;
	}
	public void setBoxIp(String boxIp) {
		this.boxIp = boxIp;
	}
	public boolean isMeasureSave() {
		return isMeasureSave;
	}
	public void setMeasureSave(boolean isMeasureSave) {
		this.isMeasureSave = isMeasureSave;
	}
	public boolean isControlSave() {
		return isControlSave;
	}
	public void setControlSave(boolean isControlSave) {
		this.isControlSave = isControlSave;
	}
	
	
}
