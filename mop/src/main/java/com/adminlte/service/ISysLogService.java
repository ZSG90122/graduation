package com.adminlte.service;

import com.adminlte.pojo.SysLog;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface ISysLogService extends IService<SysLog>{

	DatatablesResult<SysLog> selectDataGrid(int page, int rows, int parseInt);

}
