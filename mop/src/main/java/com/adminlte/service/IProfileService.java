package com.adminlte.service;

import com.adminlte.pojo.Uprofile;
import com.baomidou.mybatisplus.service.IService;

public interface IProfileService extends IService<Uprofile>{

	void updateImgById(Long userId, String picUrl);

}
