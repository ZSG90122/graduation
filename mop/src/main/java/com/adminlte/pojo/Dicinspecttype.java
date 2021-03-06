package com.adminlte.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("dicinspecttype")
public class Dicinspecttype implements Serializable {
	@TableId(type = IdType.AUTO)
	private Long id;

	private String name;

	private String inspectcontent;

	private String remark;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getInspectcontent() {
		return inspectcontent;
	}

	public void setInspectcontent(String inspectcontent) {
		this.inspectcontent = inspectcontent == null ? null : inspectcontent.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}
}