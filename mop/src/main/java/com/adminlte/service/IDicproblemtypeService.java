package com.adminlte.service;

import com.adminlte.pojo.Dicproblemtype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicproblemtypeService extends IService<Dicproblemtype>{
	
	DatatablesResult<Dicproblemtype> selectDataGrid(int page, int rows, int parseInt);
	
}
