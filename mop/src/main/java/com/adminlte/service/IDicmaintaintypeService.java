package com.adminlte.service;

import com.adminlte.pojo.Dicmaintaintype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicmaintaintypeService extends IService<Dicmaintaintype>{
	
	DatatablesResult<Dicmaintaintype> selectDataGrid(int page, int rows, int parseInt);
	
}
