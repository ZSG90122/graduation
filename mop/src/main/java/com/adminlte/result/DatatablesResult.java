package com.adminlte.result;

import java.util.List;
import java.util.Map;

import com.adminlte.pojo.vo.docdepVo;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class DatatablesResult<T> {
	private List<T> data; // data 与datatales 加载的"data"对应

	private int recordsTotal;

	private int recordsFiltered;

	private int draw;

	public DatatablesResult() {

	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> doc) {
		this.data = doc;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}


}
