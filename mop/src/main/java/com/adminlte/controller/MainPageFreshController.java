package com.adminlte.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.adminlte.pojo.vo.MainPageStateInfoVo;
import com.adminlte.service.IMainPageService;
import com.adminlte.service.IUserService;
import com.adminlte.shiro.ShiroUser;

/**
 * 主页交互控制器
 * @author 李谣顺
 */

@Controller
@RequestMapping("/MainPage")
public class MainPageFreshController extends BaseController{
	@Autowired
	private IMainPageService imainPageService;

	
	@Autowired
	private IUserService userService;


	
	/**
	 * 得到站点的基础信息、只是_info表中的所有信息
	 * @param mosi
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/get_base_info", method = RequestMethod.POST)
	public ResponseEntity<List<MainPageStateInfoVo>> get_Base_Info(MainPageStateInfoVo mosi,HttpServletRequest request)
	{
		ShiroUser shiroUser = getShiroUser();
		String username = shiroUser.getLoginName();
		List<MainPageStateInfoVo> MainList = imainPageService.get_base_info(username);
		System.out.println("MainList size "+MainList.size()+"  username : "+username);
		return ResponseEntity.ok(MainList);
	}
		
}
