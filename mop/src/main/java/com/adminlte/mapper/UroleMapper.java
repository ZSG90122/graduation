package com.adminlte.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Uresource;
import com.adminlte.pojo.Urole;
import com.baomidou.mybatisplus.mapper.BaseMapper;

public interface UroleMapper extends BaseMapper<Urole>{
	
	List<Uresource> selectResourceListByRoleIdList(@Param("list") List<Long> list);

	List<Map<Long, String>> selectResourceListByRoleId(Long roleId);

}
