package com.adminlte.service;

import com.adminlte.pojo.Dicchecktype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicchecktypeService extends IService<Dicchecktype>{
	
	DatatablesResult<Dicchecktype> selectDataGrid(int page, int rows, int parseInt);
	
}
