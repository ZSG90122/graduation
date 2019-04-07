package com.adminlte.service.impl;

import org.springframework.stereotype.Service;

import com.adminlte.mapper.UprofileMapper;
import com.adminlte.pojo.Uprofile;
import com.adminlte.service.IProfileService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

@Service
public class ProfileServiceImpl extends ServiceImpl<UprofileMapper, Uprofile> implements IProfileService{

	@Override
	public void updateImgById(Long userId, String filePath) {
		Uprofile profile = new Uprofile();
		profile.setUserId(userId);
		EntityWrapper<Uprofile> wrapper = new EntityWrapper<Uprofile>(profile);
		Uprofile profile1 = new Uprofile();
		profile1.setAddress(filePath);
		this.update(profile1, wrapper);
	}

}
