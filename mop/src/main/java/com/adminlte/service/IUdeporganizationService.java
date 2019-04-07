package com.adminlte.service;

import com.adminlte.pojo.Udeporganization;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IUdeporganizationService extends IService<Udeporganization>{

		DatatablesResult<Udeporganization> selectDataGrid(int page, int rows, int parseInt);
}
