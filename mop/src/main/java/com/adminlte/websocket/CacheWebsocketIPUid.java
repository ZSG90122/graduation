package com.adminlte.websocket;

import java.util.Hashtable;


/**
 * 将网页端的UID与客户端的IP一一对应起来，以便于在接收到客户端发送来消息的时候推送消息到网页
 * @author 李谣顺
 *
 */
public class CacheWebsocketIPUid {
	
	private CacheWebsocketIPUid(){}
	
	public static final CacheWebsocketIPUid getInstance()
	{
		return CacheHolder.INSTANCE; 
	}
	private static class CacheHolder 
	{    
	    private static final CacheWebsocketIPUid INSTANCE = new CacheWebsocketIPUid();    
	}
	
	private static Hashtable<String, Integer> CacheIpUid = new Hashtable<String, Integer>();
	
	public void Add_IpUid(String ip,int uid)
	{
		if(CacheIpUid.containsKey(ip))
		{
			CacheIpUid.remove(ip);
			CacheIpUid.put(ip,uid);
		}else{
			CacheIpUid.put(ip,uid);
		}
		
	}
	public int Get_IpUid(String ip)
	{
		int uid=-1;
		if(CacheIpUid.containsKey(ip))
		{
			uid = CacheIpUid.get(ip);
		}
		return uid;
		
	}
}
