package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Bpersoninspection;
import com.adminlte.pojo.vo.BpersoninspectionVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBpersoninspectionService extends IService<Bpersoninspection>{

	DatatablesResult<BpersoninspectionVo> selecDataGridWrapper(int page, int rows, int parseInt,
			EntityWrapper<Bpersoninspection> wrapper);
	
	List<BpersoninspectionVo> getInspectVoList(EntityWrapper<Bpersoninspection> wrapper);

}
