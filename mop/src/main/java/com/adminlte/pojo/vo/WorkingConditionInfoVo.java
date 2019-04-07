package com.adminlte.pojo.vo;
import java.util.Date;
public class WorkingConditionInfoVo {

	/*************控制信息*************/
	
	private String box_ip;
    private boolean ctl_cur_1;
    private boolean ctl_cur_2;
    private boolean ctl_cur_3;
    private boolean ctl_cur_4;
    private boolean ctl_cur_5;
    private boolean ctl_cur_6;
    private boolean ctl_door;
    private boolean ctl_smoke;
    private boolean ctrl_water;
    private float ctrl_temperature;
    private float ctrl_humidity;
    private float ctrl_lightIntensity;
    private String ctrl_rfid;
    private int ctl_state;
    private Date ctl_datetime;
    /**************************/
    private boolean Switch_1;
    private boolean Switch_2;
    private boolean Switch_3;
    private boolean Switch_4;
    private boolean Switch_5;
    private boolean Switch_6;
   
    public boolean isSwitch_1() {
		return Switch_1;
	}
	public void setSwitch_1(boolean switch_1) {
		Switch_1 = switch_1;
	}
	public boolean isSwitch_2() {
		return Switch_2;
	}
	public void setSwitch_2(boolean switch_2) {
		Switch_2 = switch_2;
	}
	public boolean isSwitch_3() {
		return Switch_3;
	}
	public void setSwitch_3(boolean switch_3) {
		Switch_3 = switch_3;
	}
	public boolean isSwitch_4() {
		return Switch_4;
	}
	public void setSwitch_4(boolean switch_4) {
		Switch_4 = switch_4;
	}
	public boolean isSwitch_5() {
		return Switch_5;
	}
	public void setSwitch_5(boolean switch_5) {
		Switch_5 = switch_5;
	}
	public boolean isSwitch_6() {
		return Switch_6;
	}
	public void setSwitch_6(boolean switch_6) {
		Switch_6 = switch_6;
	}
	public String getBox_ip() {
		return box_ip;
	}
	public void setBox_ip(String box_ip) {
		this.box_ip = box_ip;
	}
	public boolean isCtl_cur_1() {
		return ctl_cur_1;
	}
	public void setCtl_cur_1(boolean ctl_cur_1) {
		this.ctl_cur_1 = ctl_cur_1;
	}
	public boolean isCtl_cur_2() {
		return ctl_cur_2;
	}
	public void setCtl_cur_2(boolean ctl_cur_2) {
		this.ctl_cur_2 = ctl_cur_2;
	}
	public boolean isCtl_cur_3() {
		return ctl_cur_3;
	}
	public void setCtl_cur_3(boolean ctl_cur_3) {
		this.ctl_cur_3 = ctl_cur_3;
	}
	public boolean isCtl_cur_4() {
		return ctl_cur_4;
	}
	public void setCtl_cur_4(boolean ctl_cur_4) {
		this.ctl_cur_4 = ctl_cur_4;
	}
	public boolean isCtl_cur_5() {
		return ctl_cur_5;
	}
	public void setCtl_cur_5(boolean ctl_cur_5) {
		this.ctl_cur_5 = ctl_cur_5;
	}
	public boolean isCtl_cur_6() {
		return ctl_cur_6;
	}
	public void setCtl_cur_6(boolean ctl_cur_6) {
		this.ctl_cur_6 = ctl_cur_6;
	}
	public boolean isCtl_door() {
		return ctl_door;
	}
	public void setCtl_door(boolean ctl_door) {
		this.ctl_door = ctl_door;
	}
	public boolean isCtl_smoke() {
		return ctl_smoke;
	}
	public void setCtl_smoke(boolean ctl_smoke) {
		this.ctl_smoke = ctl_smoke;
	}
	public boolean isCtrl_water() {
		return ctrl_water;
	}
	public void setCtrl_water(boolean ctrl_water) {
		this.ctrl_water = ctrl_water;
	}
	public float getCtrl_temperature() {
		return ctrl_temperature;
	}
	public void setCtrl_temperature(float ctrl_temperature) {
		this.ctrl_temperature = ctrl_temperature;
	}
	public float getCtrl_humidity() {
		return ctrl_humidity;
	}
	public void setCtrl_humidity(float ctrl_humidity) {
		this.ctrl_humidity = ctrl_humidity;
	}
	public float getCtrl_lightIntensity() {
		return ctrl_lightIntensity;
	}
	public void setCtrl_lightIntensity(float ctrl_lightIntensity) {
		this.ctrl_lightIntensity = ctrl_lightIntensity;
	}
	public String getCtrl_rfid() {
		return ctrl_rfid;
	}
	public void setCtrl_rfid(String ctrl_rfid) {
		this.ctrl_rfid = ctrl_rfid;
	}
	public int getCtl_state() {
		return ctl_state;
	}
	public void setCtl_state(int ctl_state) {
		this.ctl_state = ctl_state;
	}
	public Date getCtl_datetime() {
		return ctl_datetime;
	}
	public void setCtl_datetime(Date ctl_datetime) {
		this.ctl_datetime = ctl_datetime;
	}
	
	
	
	
	 /*************测量信息*************/
    private float real_1cur1;
    private float real_1cur2;
    private float real_1cur3;
    private float real_2cur1;
    private float real_2cur2;
    private float real_2cur3;
    private float real_3cur1;
    private float real_3cur2;
    private float real_3cur3;
    private float real_4cur1;
    private float real_4cur2;
    private float real_4cur3;
    private float real_5cur1;
    private float real_5cur2;
    private float real_5cur3;
    private float real_6cur1;
    private float real_6cur2;
    private float real_6cur3;
    private float real_volt;
    private float real_vol1;
    private float real_vol2;
    private float real_vol3;
    private int mes_state;
    private float all_current_electric;
    public float getAll_current_electric() {
		return all_current_electric;
	}
	public void setAll_current_electric(float all_current_electric) {
		this.all_current_electric = all_current_electric;
	}




	private Date mes_datetime;
    /**************************/
	
	public float getReal_1cur1() {
		return real_1cur1;
	}
	public void setReal_1cur1(float real_1cur1) {
		this.real_1cur1 = real_1cur1;
	}
	public float getReal_1cur2() {
		return real_1cur2;
	}
	public void setReal_1cur2(float real_1cur2) {
		this.real_1cur2 = real_1cur2;
	}
	public float getReal_1cur3() {
		return real_1cur3;
	}
	public void setReal_1cur3(float real_1cur3) {
		this.real_1cur3 = real_1cur3;
	}
	public float getReal_2cur1() {
		return real_2cur1;
	}
	public void setReal_2cur1(float real_2cur1) {
		this.real_2cur1 = real_2cur1;
	}
	public float getReal_2cur2() {
		return real_2cur2;
	}
	public void setReal_2cur2(float real_2cur2) {
		this.real_2cur2 = real_2cur2;
	}
	public float getReal_2cur3() {
		return real_2cur3;
	}
	public void setReal_2cur3(float real_2cur3) {
		this.real_2cur3 = real_2cur3;
	}
	public float getReal_3cur1() {
		return real_3cur1;
	}
	public void setReal_3cur1(float real_3cur1) {
		this.real_3cur1 = real_3cur1;
	}
	public float getReal_3cur2() {
		return real_3cur2;
	}
	public void setReal_3cur2(float real_3cur2) {
		this.real_3cur2 = real_3cur2;
	}
	public float getReal_3cur3() {
		return real_3cur3;
	}
	public void setReal_3cur3(float real_3cur3) {
		this.real_3cur3 = real_3cur3;
	}
	public float getReal_4cur1() {
		return real_4cur1;
	}
	public void setReal_4cur1(float real_4cur1) {
		this.real_4cur1 = real_4cur1;
	}
	public float getReal_4cur2() {
		return real_4cur2;
	}
	public void setReal_4cur2(float real_4cur2) {
		this.real_4cur2 = real_4cur2;
	}
	public float getReal_4cur3() {
		return real_4cur3;
	}
	public void setReal_4cur3(float real_4cur3) {
		this.real_4cur3 = real_4cur3;
	}
	public float getReal_5cur1() {
		return real_5cur1;
	}
	public void setReal_5cur1(float real_5cur1) {
		this.real_5cur1 = real_5cur1;
	}
	public float getReal_5cur2() {
		return real_5cur2;
	}
	public void setReal_5cur2(float real_5cur2) {
		this.real_5cur2 = real_5cur2;
	}
	public float getReal_5cur3() {
		return real_5cur3;
	}
	public void setReal_5cur3(float real_5cur3) {
		this.real_5cur3 = real_5cur3;
	}
	public float getReal_6cur1() {
		return real_6cur1;
	}
	public void setReal_6cur1(float real_6cur1) {
		this.real_6cur1 = real_6cur1;
	}
	public float getReal_6cur2() {
		return real_6cur2;
	}
	public void setReal_6cur2(float real_6cur2) {
		this.real_6cur2 = real_6cur2;
	}
	public float getReal_6cur3() {
		return real_6cur3;
	}
	public void setReal_6cur3(float real_6cur3) {
		this.real_6cur3 = real_6cur3;
	}
	public float getReal_volt() {
		return real_volt;
	}
	public void setReal_volt(float real_volt) {
		this.real_volt = real_volt;
	}
	public float getReal_vol1() {
		return real_vol1;
	}
	public void setReal_vol1(float real_vol1) {
		this.real_vol1 = real_vol1;
	}
	public float getReal_vol2() {
		return real_vol2;
	}
	public void setReal_vol2(float real_vol2) {
		this.real_vol2 = real_vol2;
	}
	public float getReal_vol3() {
		return real_vol3;
	}
	public void setReal_vol3(float real_vol3) {
		this.real_vol3 = real_vol3;
	}
	public int getMes_state() {
		return mes_state;
	}
	public void setMes_state(int mes_state) {
		this.mes_state = mes_state;
	}
	public Date getMes_datetime() {
		return mes_datetime;
	}
	public void setMes_datetime(Date mes_datetime) {
		this.mes_datetime = mes_datetime;
	}
	
	private float cur_root_1;
	private float cur_root_2;
	private float cur_root_3;
	private float cur_root_4;
	public float getCur_root_1() {
		return cur_root_1;
	}
	public void setCur_root_1(float cur_root_1) {
		this.cur_root_1 = cur_root_1;
	}
	public float getCur_root_2() {
		return cur_root_2;
	}
	public void setCur_root_2(float cur_root_2) {
		this.cur_root_2 = cur_root_2;
	}
	public float getCur_root_3() {
		return cur_root_3;
	}
	public void setCur_root_3(float cur_root_3) {
		this.cur_root_3 = cur_root_3;
	}
	public float getCur_root_4() {
		return cur_root_4;
	}
	public void setCur_root_4(float cur_root_4) {
		this.cur_root_4 = cur_root_4;
	}
	public float getCur_root_5() {
		return cur_root_5;
	}
	public void setCur_root_5(float cur_root_5) {
		this.cur_root_5 = cur_root_5;
	}
	public float getCur_root_6() {
		return cur_root_6;
	}
	public void setCur_root_6(float cur_root_6) {
		this.cur_root_6 = cur_root_6;
	}




	private float cur_root_5;
	private float cur_root_6;
    
}
