package com.adminlte.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.pojo.vo.UserVo;
import com.adminlte.service.IResourceService;
import com.adminlte.shiro.ShiroUser;

/**
 * 权限管理
 * 
 * @author wuyudong
 *
 */
@Controller
@RequestMapping("/resource")
public class ResourceController extends BaseController {

	@Autowired
	private IResourceService resourceService;

	/**
	 * 菜单树(左边) 通过这里返回json数据给前段，然后构造html元素
	 * 
	 * @return
	 */
	@RequestMapping(value = "/tree", method = RequestMethod.POST)
	public ResponseEntity<Object> tree() {
		// 是否展示整棵树状列表与登录账号的权限有关
		ShiroUser shiroUser = getShiroUser();
		// 返回的数据应该是json数据
		return ResponseEntity.ok(resourceService.selectTree(shiroUser));
	}
}
