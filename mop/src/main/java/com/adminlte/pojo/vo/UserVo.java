package com.adminlte.pojo.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.adminlte.pojo.Urole;
import com.adminlte.pojo.User;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class UserVo implements Serializable{

	private Long id;

	private String loginName;

	private String name;

	@JsonIgnore
	private String password;
	
	private Long level;

	private Integer sex;

	private Integer age;

	private Integer userType;

	private Integer status;

	private Integer departmentId;

	private Date createTime;

	private String phone;
	
	private String address;
	
	private String image;

	private List<Urole> rolesList;

	private String departmentName;

	private Long roleIds;

	private Date createdateStart;
	private Date createdateEnd;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName == null ? null : loginName.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getdepartmentId() {
		return departmentId;
	}

	public void setdepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Urole> getRolesList() {
		return rolesList;
	}

	public void setRolesList(List<Urole> rolesList) {
		this.rolesList = rolesList;
	}

	public String getdepartmentName() {
		return departmentName;
	}

	public void setdepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Long getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Long roleIds) {
		this.roleIds = roleIds;
	}

	public Date getCreatedateStart() {
		return createdateStart;
	}

	public void setCreatedateStart(Date createdateStart) {
		this.createdateStart = createdateStart;
	}

	public Date getCreatedateEnd() {
		return createdateEnd;
	}

	public void setCreatedateEnd(Date createdateEnd) {
		this.createdateEnd = createdateEnd;
	}
	
	/**
	 * 比较vo和数据库中的用户是否同一个user，采用id比较
	 * @param user 用户
	 * @return 是否同一个人
	 */
	public boolean equalsUser(User user) {
		if (user == null) {
			return false;
		}
		Long userId = user.getId();
		if (id == null || userId == null) {
			return false;
		}
		return id.equals(userId);
	}

	
	public UserVo() {
		super();
	}

	public UserVo(String loginName, String name, String password, Integer userType, Integer status,
			Integer departmentId, Date createTime) {
		super();
		this.loginName = loginName;
		this.name = name;
		this.password = password;
		this.userType = userType;
		this.status = status;
		this.departmentId = departmentId;
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "UserVo [id=" + id + ", loginName=" + loginName + ", name=" + name + ", password=" + password + ", sex="
				+ sex + ", age=" + age + ", userType=" + userType + ", status=" + status + ", departmentId="
				+ departmentId + ", createTime=" + createTime + ", phone=" + phone + ", address=" + address
				+ ", image=" + image + ", rolesList=" + rolesList + ", departmentName=" + departmentName
				+ ", roleIds=" + roleIds + ", createdateStart=" + createdateStart + ", createdateEnd=" + createdateEnd
				+ "]";
	}

	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	

}
