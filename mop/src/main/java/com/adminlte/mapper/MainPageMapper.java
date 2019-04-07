package com.adminlte.mapper;

import java.util.List;

import com.adminlte.pojo.vo.MainPageStateInfoVo;

public interface MainPageMapper {
	List<MainPageStateInfoVo> selectStateInfo(String username);
	
	List<MainPageStateInfoVo> selectBaseInfo(String username);
}
