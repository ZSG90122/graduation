package com.adminlte.service;

import com.adminlte.pojo.Btask;
import com.adminlte.pojo.vo.BtaskVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBtaskService extends IService<Btask> {

	DatatablesResult<Btask> selecDataGridWrapper(int page, int rows, int parseInt, EntityWrapper<Btask> wrapper);
	DatatablesResult<BtaskVo> selecVoDataGridWrapper(int page, int rows, int parseInt, EntityWrapper<Btask> wrapper);
}
