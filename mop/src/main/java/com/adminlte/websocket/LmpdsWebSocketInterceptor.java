package com.adminlte.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.adminlte.pojo.User;
import com.adminlte.shiro.ShiroUser;

/**
 * websocket握手拦截器 拦截握手前，握手后的两个切面
 * https://www.cnblogs.com/nosqlcoco/p/5860730.html gzs
 * 拦截的概念就是在一个操作前，与在这个操作后的两个时间切面将要进行的动作。
 * 客户端与服务端握手连接前将键名”uid“，值为用户id的这个键值对加入到指定参数map中。
 * 为服务器建立与相应客户端连接的WebSocketSession打下基础。
 */
public class LmpdsWebSocketInterceptor implements HandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		try {
			if (request instanceof ServletServerHttpRequest) {
				ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;

				HttpSession session = servletRequest.getServletRequest().getSession(false);
				if (null != session) {
					// 使用userName区分WebSocketHandler，以便定向发送消息
					User userid = (User) session.getAttribute("user");
					attributes.put(Constants.WEBSOCKET_ID, userid.getId());
				} else {
					System.out.println("classs of LmpdsWebSocketInterceptor httpsession is null");
				}

			}
		} catch (Exception e) {
			System.out.println("beforeHandshake catch : " + e.toString());
			return false;
		}

		/*
		 * try{ ShiroUser user= (ShiroUser)
		 * SecurityUtils.getSubject().getPrincipal();
		 * attributes.put(Constants.WEBSOCKET_ID,user.getId()); }catch
		 * (Exception e) {
		 * System.out.println("LmpdsWebSocketInterceptor:"+e.toString()); return
		 * false; }
		 */

		return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {

	}

}
