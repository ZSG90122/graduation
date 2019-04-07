package com.adminlte.service;

import com.adminlte.pojo.Bmessageinforattach;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IBmessageinforattachService extends IService<Bmessageinforattach>{
	
	DatatablesResult<Bmessageinforattach> selectDataGrid(int page, int rows, int parseInt);
	
}
