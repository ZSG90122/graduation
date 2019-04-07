package com.adminlte.commons.utils;



/**
 * 缓存web端发送命令所得到客户端返回回来的数据
 * @author 李谣顺
 *
 */
public class CacheEnumerationCollect {
	private CacheEnumerationCollect(){}
	public static final CacheEnumerationCollect getInstance()
	{
		return CacheHolder.INSTANCE; 
	}
	private static class CacheHolder 
	{    
	    private static final CacheEnumerationCollect INSTANCE = new CacheEnumerationCollect();    
	}
	
	
}
