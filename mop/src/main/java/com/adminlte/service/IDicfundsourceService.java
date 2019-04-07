package com.adminlte.service;

import com.adminlte.pojo.Dicfundsource;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicfundsourceService extends IService<Dicfundsource>{
	
	DatatablesResult<Dicfundsource> selectDataGrid(int page, int rows, int parseInt);
	
}
