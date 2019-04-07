package com.adminlte.service;

import com.adminlte.pojo.Dicchinacityinfo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicchinacityinfoService extends IService<Dicchinacityinfo>{
	
	DatatablesResult<Dicchinacityinfo> selectDataGrid(int page, int rows, int parseInt);
	
}
