package com.adminlte.commons.utils;

import java.util.List;

/**
 * 
 * @author luo
 * 分页工具类
 *
 */
public class departPageUtil<T>{
	
	 List<T>  pagesEntity;
	 private double current;//当前页
	 private String length;//页面显示长度
	 private int maxSize;//总的页面数
	public List<T> getPagesEntity() {
		return pagesEntity;
	}
	public void setPagesEntity(List<T> pagesEntity) {
		this.pagesEntity = pagesEntity;
	}
	public double getCurrent() {
		return current;
	}
	public void setCurrent(double currents) {
		this.current = currents;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	
	public int getMaxSize() {
		return maxSize;
	}
	public void setMaxSize(int i) {
		this.maxSize = i;
	}
	@Override
	public String toString() {
		return "departPageUtil [pagesEntity=" + pagesEntity + ", current=" + current + ", length=" + length
				+ ", maxSize=" + maxSize + "]";
	}
	 
}