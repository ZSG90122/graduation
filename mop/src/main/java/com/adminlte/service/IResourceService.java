package com.adminlte.service;

import com.adminlte.pojo.Uresource;
import com.adminlte.shiro.ShiroUser;
import com.baomidou.mybatisplus.service.IService;

public interface IResourceService extends IService<Uresource>{

	Object selectTree(ShiroUser shiroUser);

}
