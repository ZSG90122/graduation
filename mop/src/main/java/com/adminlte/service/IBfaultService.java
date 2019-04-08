package com.adminlte.service;

import com.adminlte.pojo.Bfault;
import com.adminlte.pojo.vo.BfaultVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBfaultService extends IService<Bfault> {

	DatatablesResult<BfaultVo> selecDataGridWrapper(int page, int rows, int parseInt, EntityWrapper<Bfault> wrapper);

}
