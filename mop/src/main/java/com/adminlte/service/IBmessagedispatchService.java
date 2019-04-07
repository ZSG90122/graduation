package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.vo.BmessagedispatchVo;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBmessagedispatchService extends IService<Bmessagedispatch>{
	
	DatatablesResult<Bmessagedispatch> selectDataGrid(int page, int rows, int parseInt);
	//查询出所有的BmessagedispatchVo
	List<Bmessagedispatch> selectAllBmessagedispatch();
	//根据消息id删除接收到的信息
	Boolean delectDealMessage(List<Long> ids);
	
	DatatablesResult<BmessagedispatchVo> selectDataGridVo(int page, int rows, int draw);


	

	
}
