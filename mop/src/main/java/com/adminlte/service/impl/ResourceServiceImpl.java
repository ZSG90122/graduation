package com.adminlte.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.UresourceMapper;
import com.adminlte.mapper.UroleMapper;
import com.adminlte.mapper.UserRoleMapper;
import com.adminlte.pojo.Uresource;
import com.adminlte.result.TreeResult;
import com.adminlte.service.IResourceService;
import com.adminlte.shiro.ShiroUser;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

@Service
public class ResourceServiceImpl extends ServiceImpl<UresourceMapper, Uresource> implements IResourceService {
	private static final int RESOURCE_MENU = 0; // 菜单

	@Autowired
	private UresourceMapper resourceMapper;

	@Autowired
	private UserRoleMapper userRoleMapper;

	@Autowired
	private UroleMapper roleMapper;

	// 与添加树状菜单相关
	@Override
	public List<TreeResult> selectTree(ShiroUser shiroUser) {
		List<TreeResult> trees = new ArrayList<TreeResult>();
		// shiro中缓存的用户角色
		Set<String> roles = shiroUser.getRoles();
		if (roles == null) {
			return trees;
		}
		// 如果有超级管理员权限的账号进行登录
		// 那么该树状列表将会得到填充
		// 填充的内容来自与
		if (roles.contains("admin")) {
			List<Uresource> resourceList = this.selectByType(RESOURCE_MENU);
			if (resourceList == null) {
				return trees;
			}

			for (Uresource resource : resourceList) {
				TreeResult tree = new TreeResult();
				tree.setId(resource.getId());
				tree.setPid(resource.getPid());
				tree.setText(resource.getName());
				tree.setIconCls(resource.getIcon());
				tree.setAttributes(resource.getUrl());
				tree.setOpenMode(resource.getOpenMode());
				tree.setState(resource.getOpened());
				if (resource.getPid() != null) {
					tree.setTargetType("iframe-tab");
				}
				trees.add(tree);
			}
			return trees;
		}
		List<Long> roleIdList = userRoleMapper.selectRoleIdListByUserId(shiroUser.getId());
		if (roleIdList == null) {
			return trees;
		}
		List<Uresource> resourceLists = roleMapper.selectResourceListByRoleIdList(roleIdList);
		if (resourceLists == null) {
			return trees;
		}
		for (Uresource resource : resourceLists) {
			TreeResult tree = new TreeResult();
			tree.setId(resource.getId());
			tree.setPid(resource.getPid());
			tree.setText(resource.getName());
			tree.setIconCls(resource.getIcon());
			tree.setAttributes(resource.getUrl());
			tree.setOpenMode(resource.getOpenMode());
			tree.setState(resource.getOpened());
			if (resource.getPid() != null) {
				tree.setTargetType("iframe-tab");
			}
			trees.add(tree);
		}
		return trees;
	}

	public List<Uresource> selectByType(Integer type) {
		EntityWrapper<Uresource> wrapper = new EntityWrapper<Uresource>();
		Uresource resource = new Uresource();
		wrapper.setEntity(resource);
		wrapper.addFilter("resource_type = {0}", type);
		wrapper.orderBy("seq");
		return resourceMapper.selectList(wrapper);
	}
}
