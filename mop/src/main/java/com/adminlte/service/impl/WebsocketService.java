package com.adminlte.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.TextMessage;

import com.adminlte.service.IWebsocketService;
import com.adminlte.websocket.Message;
import com.adminlte.websocket.WebSocketPushHandler;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service("WebsocketService")
@Transactional
public class WebsocketService implements IWebsocketService{

	@Autowired
	WebSocketPushHandler webSocketPushHandler;
	
	/** 当依赖注入失败，可以通过如下方式获得组件
		private WebSocketPushHandler  webSocketHandler = null;
		try {
			ApplicationContext beanFactory= SpringContextUtil.getApplicationContext();  		
			//IBCBWarningS = (IBusyControlBoxWarninforService) beanFactory.getBean("BusyControlBoxWarninforServiceImpl");
			webSocketHandler = (WebSocketPushHandler)beanFactory.getBean("webSocketPushHandler");
		} catch (Exception e) {
			System.out.println("DeCommand_Factory  e  1: "+e.toString());
		}	
	 */
	
	@Override
	public void adduser() {
	}

	@Override
	public boolean websocketSendMeesage(String josonstr) {
		// TODO Auto-generated method stub
		try{
			String json="josonstr";
			Message mg = new Message();
			mg.setCode("400");
			mg.setMessageText(json);
			ObjectMapper mapper = new ObjectMapper();//转换器  
			String json_to= mapper.writeValueAsString(mg);//将对象转换成json
		
			TextMessage message = new TextMessage(json_to);  
			webSocketPushHandler.sendMessagesToUsers(message);
		}catch(Exception ex){
			return false;
		}
		
		return true;
	}
	
	
}
