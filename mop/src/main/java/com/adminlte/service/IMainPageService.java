package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.vo.MainPageStateInfoVo;

public interface IMainPageService {

	/**
	 * 得到控制箱的基础信息 简洁版
	 * @param username
	 * @return
	 */
	List<MainPageStateInfoVo> get_base_info(String username);
	

}
