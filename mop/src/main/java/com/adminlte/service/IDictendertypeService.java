package com.adminlte.service;

import com.adminlte.pojo.Dictendertype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDictendertypeService extends IService<Dictendertype>{
	
	DatatablesResult<Dictendertype> selectDataGrid(int page, int rows, int parseInt);
	
}
