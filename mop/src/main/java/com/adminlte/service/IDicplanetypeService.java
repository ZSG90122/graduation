package com.adminlte.service;

import com.adminlte.pojo.Dicplanetype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicplanetypeService extends IService<Dicplanetype>{
	
	DatatablesResult<Dicplanetype> selectDataGrid(int page, int rows, int parseInt);

	
}
