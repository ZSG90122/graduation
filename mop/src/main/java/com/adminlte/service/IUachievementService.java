package com.adminlte.service;

import java.util.List;

import com.adminlte.commons.scan.Achievetype;
import com.adminlte.commons.utils.achievementUtil;
import com.adminlte.commons.utils.departPageUtil;
import com.adminlte.pojo.Uachievement;
import com.adminlte.pojo.vo.UachievementVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IUachievementService extends IService<Uachievement>{
	
	DatatablesResult<UachievementVo> selectDataGridWrapper(int page, int rows, int parseInt,Wrapper wrapper);
	List<UachievementVo> selectDataListWrapper(Wrapper wrapper);
	
	void updatedata(Achievetype type,long userid);
	achievementUtil getAllOptionNum();
	departPageUtil<UachievementVo> selectDataListPages(String current, String length);
}
