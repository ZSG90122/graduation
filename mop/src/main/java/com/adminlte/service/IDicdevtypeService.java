package com.adminlte.service;

import com.adminlte.pojo.Dicdevtype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicdevtypeService extends IService<Dicdevtype>{
	
	DatatablesResult<Dicdevtype> selectDataGrid(int page, int rows, int parseInt);
	
}
