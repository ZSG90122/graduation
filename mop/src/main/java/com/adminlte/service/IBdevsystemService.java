package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Bdevsystem;
import com.adminlte.pojo.vo.BdevsystemVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBdevsystemService extends IService<Bdevsystem> {
	//查询所有
	List<Bdevsystem> selectBDevsystemListWrapper(Wrapper wrapper);
	
	//查询多表链接后的所有数据
	List<BdevsystemVo> selectBDevsystemVoListWrapper(Wrapper wrapper);
	
	DatatablesResult<BdevsystemVo> selectVoDataGridWrapper(int page, int rows, int parseInt, Wrapper wrapper);
}
