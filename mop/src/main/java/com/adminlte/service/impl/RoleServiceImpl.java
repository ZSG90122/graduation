package com.adminlte.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.StringUtils;
import com.adminlte.mapper.UroleMapper;
import com.adminlte.mapper.UroleresourceMapper;
import com.adminlte.mapper.UserRoleMapper;
import com.adminlte.pojo.Uachievement;
import com.adminlte.pojo.Urole;
import com.adminlte.pojo.Uroleresource;
import com.adminlte.pojo.vo.UachievementVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IRoleService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

@Service
public class RoleServiceImpl extends ServiceImpl<UroleMapper, Urole> implements IRoleService {

	@Autowired
	private UroleMapper roleMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Autowired
	private UroleresourceMapper roleresourceMapper;

	public DatatablesResult<Urole> selectGrid() {
		EntityWrapper<Urole> wrapper = new EntityWrapper<Urole>();
        wrapper.orderBy("id");
        List<Urole> roles = roleMapper.selectList(wrapper);
        DatatablesResult datatablesResult = new DatatablesResult();
        datatablesResult.setData(roles);
		return datatablesResult;
	}
	@Override
	public Map<String, Set<String>> selectResourceMapByUserId(Long userId) {
		Map<String, Set<String>> resourceMap = new HashMap<String, Set<String>>();
		List<Long> roleIdList = userRoleMapper.selectRoleIdListByUserId(userId);
		Set<String> urlSet = new HashSet<String>();
		Set<String> roles = new HashSet<String>();
		for (Long roleId : roleIdList) {
			List<Map<Long, String>> resourceList = roleMapper.selectResourceListByRoleId(roleId);
			if (resourceList != null) {
				for (Map<Long, String> map : resourceList) {
					if (StringUtils.isNotBlank(map.get("url"))) {
						urlSet.add(map.get("url"));
					}
				}
			}
			Urole role = roleMapper.selectById(roleId);
			if (role != null) {
				roles.add(role.getName());
			}
		}
		resourceMap.put("urls", urlSet);
		resourceMap.put("roles", roles);
		return resourceMap;
	}
	@Override
	public List<Uroleresource> selectResourceListByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		EntityWrapper<Uroleresource> wrapper = new EntityWrapper<Uroleresource>();
        wrapper.where("role_id={0}", roleId);
		return roleresourceMapper.selectList(wrapper);
	}
	@Override
	public void saverolerescouce(Long roleid, Long resouceid) {
		// TODO Auto-generated method stub
		EntityWrapper<Uroleresource> wrapper = new EntityWrapper<Uroleresource>();
        wrapper.where("role_id={0} and resource_id={1}", roleid, resouceid);
        if(roleresourceMapper.selectList(wrapper).size() >0){
        	
        }else{
        	Uroleresource rolesouce = new Uroleresource();
        	rolesouce.setResourceId(resouceid);
        	rolesouce.setRoleId(roleid);
        	roleresourceMapper.insert(rolesouce);
        }
	}
	@Override
	public void deleteroleresouce(Long roleid, Long resouceid) {
		// TODO Auto-generated method stub
		EntityWrapper<Uroleresource> wrapper = new EntityWrapper<Uroleresource>();
        wrapper.where("role_id={0} and resource_id={1}", roleid, resouceid);
        roleresourceMapper.delete(wrapper);
	}

}
