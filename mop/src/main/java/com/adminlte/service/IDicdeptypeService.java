package com.adminlte.service;

import com.adminlte.pojo.Dicdeptype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicdeptypeService extends IService<Dicdeptype>{
	
	DatatablesResult<Dicdeptype> selectDataGrid(int page, int rows, int parseInt);
	
}
