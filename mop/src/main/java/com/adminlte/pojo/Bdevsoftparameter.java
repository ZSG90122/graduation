package com.adminlte.pojo;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("bdevsoftparameter")
public class Bdevsoftparameter implements Serializable {

	@TableId(type = IdType.AUTO)
	private Long id;

	private Long devsoftid;

	private Long code;

	private String name;

	private String value;

	private Byte valuetype;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDevsoftid() {
		return devsoftid;
	}

	public void setDevsoftid(Long devsoftid) {
		this.devsoftid = devsoftid;
	}

	public Long getCode() {
		return code;
	}

	public void setCode(Long code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value == null ? null : value.trim();
	}

	public Byte getValuetype() {
		return valuetype;
	}

	public void setValuetype(Byte valuetype) {
		this.valuetype = valuetype;
	}

	@Override
	public String toString() {
		return "Bdevsoftparameter [id=" + id + ", devsoftid=" + devsoftid + ", code=" + code + ", name=" + name
				+ ", value=" + value + ", valuetype=" + valuetype + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bdevsoftparameter other = (Bdevsoftparameter) obj;

		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;

		return true;
	}

}