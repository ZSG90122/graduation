package com.adminlte.websocket;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component("webSocketPushHandler")
public class WebSocketPushHandler implements WebSocketHandler {

	private static final ArrayList<WebSocketSession> users;

	static {
		users = new ArrayList<>();
	}

	// 握手实现连接后
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// userId 是在 beforeHandshake 中用put加进去的
		String userId = Long.toString((long) session.getAttributes().get(Constants.WEBSOCKET_ID));
		users.add(session);
		if (null != userId) {
			String json = "加入服务器成功";
			Message mg = new Message();
			mg.setCode("400");
			mg.setMessageText(json);
			mg.setUid(Integer.valueOf(userId));
			ObjectMapper mapper = new ObjectMapper();// 转换器
			String json_to = mapper.writeValueAsString(mg);// 将对象转换成json

			TextMessage returnMessage = new TextMessage(json_to);

			session.sendMessage(returnMessage);// 连接进来后，马上就返回一条消息
		}
	}

	// 接收处理前端发送过来的消息
	@Override
	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage)
			throws Exception {

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) {
		users.remove(session);
		try {
			if (-1 == closeStatus.toString().indexOf("1001")) {
				System.out.println("-1 == closeStatus.toString().indexOf('1001')");
			} else {
				try {
					Thread.sleep(1000);
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println("-1 ！= closeStatus.toString().indexOf('1001')");
			}
			if (session.isOpen()) {
				session.close();
			}

		} catch (Exception e) {
			System.out.println("afterConnectionClosed  ： " + e.toString());
		}
	}

	// 后台错误信息处理方法
	@Override
	public void handleTransportError(WebSocketSession session, Throwable arg1) {
		try {
			if (session.isOpen()) {
				session.close();
			}
			users.remove(session);
		} catch (Exception e) {
			System.out.println("handleTransportError  ： " + e.toString());
		}
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 给所有的用户发送消息
	 */
	public void sendMessagesToUsers(TextMessage message) {
		for (WebSocketSession user : users) {
			try {
				if (user.isOpen()) {
					System.out.println("---send to web client:" + message.toString());
					user.sendMessage(message);
				}
			} catch (IOException e) {

			}
		}
	}

	/**
	 * 发送消息给指定的用户
	 * 
	 * @throws IOException
	 */
	public void sendMessageToUser(int uid, TextMessage message) throws IOException {
		for (WebSocketSession user : users) {

			String userId = Long.toString((long) user.getAttributes().get(Constants.WEBSOCKET_ID));
			int ID = Integer.parseInt(userId);
			if (ID == uid) {
				try {
					if (user.isOpen()) {
						user.sendMessage(message);
					}
				} catch (IOException e) {

				}
				break;
			}
		}
	}

}
