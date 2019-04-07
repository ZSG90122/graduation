package com.adminlte.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.adminlte.pojo.Urole;
import com.adminlte.pojo.Uroleresource;
import com.adminlte.pojo.vo.UachievementVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IRoleService extends IService<Urole>{
	
	DatatablesResult<Urole> selectGrid();
	Map<String, Set<String>> selectResourceMapByUserId(Long id);
	
	List<Uroleresource> selectResourceListByRoleId(Long roleId);
	
	void saverolerescouce(Long roleid, Long resouceid );
	
	void deleteroleresouce(Long roleid, Long resouceid);

}
