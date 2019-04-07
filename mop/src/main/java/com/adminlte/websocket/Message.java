package com.adminlte.websocket;

//用于封装发送给浏览器端封装消息
public class Message {
	/**
	 * D0 请求电流 
	 * D2://采集光强返回信息
	 * D3://采集所有控制状态返回信息
	 */
	private String code;
    private int uid;
    private String messageText;
    private String boxIp;
    private int isData; //是否是数据消息
    
	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getMessageText() {
		return messageText;
	}


	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	
	

	public String getBoxIp() {
		return boxIp;
	}


	public void setBoxIp(String boxIp) {
		this.boxIp = boxIp;
	}
	

	public int getIsData() {
		return isData;
	}


	public void setIsData(int isData) {
		this.isData = isData;
	}


	public Message() {}
	

    @Override
    public String toString() {
        return "Message {" +"code=" + code +", uid=" + uid +", messageText='" + messageText +'}';
    }
}
