package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Benterprise;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBenterpriseService extends IService<Benterprise>{
	
	DatatablesResult<Benterprise> selectDataGrid(int page, int rows, int parseInt);
	
	DatatablesResult<Benterprise> selectDataGridWrapper(int page, int rows, int parseInt,Wrapper wrapper);
	
	List<Benterprise> selectList(Wrapper wrapper);
	
}
