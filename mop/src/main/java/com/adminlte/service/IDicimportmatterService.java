package com.adminlte.service;

import com.adminlte.pojo.Dicimportmatter;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IDicimportmatterService extends IService<Dicimportmatter>{
	
	DatatablesResult<Dicimportmatter> selectDataGrid(int page, int rows, int parseInt);
	
	DatatablesResult<Dicimportmatter> selectDataGrid(int page, int rows, int parseInt,Wrapper wrapper);
	
}
