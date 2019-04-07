package com.adminlte.commons.utils;

//存放系统明星的评分权重
public enum scoreRuleEnum {
	LOGTIME(1,1),
	NEWPROJECT(2,5),
	UPDATEPROJECT(3,2),
	NEWBIDS(4,5),
	UPDATEBIDS(5,2),
	NEWPROGRESS(6,0.5),
	DELETEPROGRESS(7,-2),
	NEWMILESTONE(8,5),
	DELETEMILESTONE(9,-2),
	UPDATEMILESTONE(10,2),
	NEWDOCUMNET(11,5),
	DELETEDOCUMENT(12,-2),
	NEWMESSAGE(13,5),
	DELETEMESSAGE(14,-2);
	private int index;
	private double states;
	private scoreRuleEnum(int index,double states) {
		this.index = index;
		this.states=states;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public double getStates() {
		return states;
	}

	public void setStates(double states) {
		this.states = states;
	}


	public static double stateOf(int index){
		for (scoreRuleEnum state : values()) {
			if (state.getIndex()==index) {
				return state.getStates();
			}
		}
		return (Double) null;
	}
}

