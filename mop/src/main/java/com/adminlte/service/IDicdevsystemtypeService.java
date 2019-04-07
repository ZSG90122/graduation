package com.adminlte.service;

import com.adminlte.pojo.Dicdevsystemtype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicdevsystemtypeService extends IService<Dicdevsystemtype>{
	
	DatatablesResult<Dicdevsystemtype> selectDataGrid(int page, int rows, int parseInt);

	
}
