package com.adminlte.service;

import com.adminlte.pojo.Dicmessagetype;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDicmessagetypeService extends IService<Dicmessagetype>{
	
	DatatablesResult<Dicmessagetype> selectDataGrid(int page, int rows, int parseInt);
	
}
