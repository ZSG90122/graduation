package com.adminlte.service;

import com.adminlte.pojo.Dicplanemiltype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicplanemiltypeService extends IService<Dicplanemiltype>{
	
	DatatablesResult<Dicplanemiltype> selectDataGrid(int page, int rows, int parseInt);

	
}
