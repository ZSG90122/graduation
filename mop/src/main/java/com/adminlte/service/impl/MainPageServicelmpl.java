package com.adminlte.service.impl;

import java.util.Hashtable;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.adminlte.controller.netty.DSCircularQueue;
import com.adminlte.mapper.MainPageMapper;
import com.adminlte.pojo.vo.MainPageStateInfoVo;
import com.adminlte.pojo.vo.UserVo;
import com.adminlte.service.IMainPageService;
import com.adminlte.shiro.ShiroUser;

@Service
public class MainPageServicelmpl implements IMainPageService{
	@Autowired
	private MainPageMapper mainPageMapper;

	@Override
	public List<MainPageStateInfoVo> get_base_info(String username) {
		return mainPageMapper.selectBaseInfo(username);
	}
	

}
