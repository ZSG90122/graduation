package com.adminlte.service;

import com.adminlte.pojo.Dicprojectstate;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicprojectstateService extends IService<Dicprojectstate>{
	
	DatatablesResult<Dicprojectstate> selectDataGrid(int page, int rows, int parseInt);
	
}
