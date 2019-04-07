package com.adminlte.result;

import java.util.List;

public class DatatablesResult1<T> {
	private List<T> data; // data 与datatales 加载的“dataSrc"对应

	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
}
