package com.adminlte.service;

import com.adminlte.pojo.Dicplperblindagetype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicplperblindagetypeService extends IService<Dicplperblindagetype>{
	
	DatatablesResult<Dicplperblindagetype> selectDataGrid(int page, int rows, int parseInt);

	
}
