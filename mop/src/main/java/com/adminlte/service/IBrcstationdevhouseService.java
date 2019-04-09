package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Brcstationdevhouse;
import com.adminlte.pojo.vo.BrcstationdevhouseVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBrcstationdevhouseService extends IService<Brcstationdevhouse> {

	DatatablesResult<Brcstationdevhouse> selectDataGrid(int page, int rows, int parseInt);

	DatatablesResult<Brcstationdevhouse> selectDataGridWrapper(int page, int rows, int parseInt, Wrapper wrapper);

	DatatablesResult<BrcstationdevhouseVo> selectVoDataGridWrapper(int page, int rows, int parseInt, Wrapper wrapper);

	//查询返回所有的遥控站信息
	List<Brcstationdevhouse> selectstationdevhouselistWrapper(Wrapper wrapper);

	// 返回某次巡检下的遥控站信息
	List<Brcstationdevhouse> selectRemoteStationListOfInspect(Long inspectid);
}
