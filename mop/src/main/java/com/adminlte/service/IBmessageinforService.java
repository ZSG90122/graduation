package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Bmessageinfor;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBmessageinforService extends IService<Bmessageinfor>{
	
	DatatablesResult<Bmessageinfor> selectDataGrid(int page, int rows, int parseInt);
	
	DatatablesResult<BmessageinforVo> selectDataGridWrapper(int page, int rows, int draw, Wrapper wrapper);
	//根据id删除消息
	boolean delectMessageInfo(List<Long> message_id);
	//根据消息的标题进行查询
	List<BmessageinforVo> selectMessageVoByTitle(String Messagetitle);
	
	DatatablesResult<BmessageinforVo> selectDataGridVo(int page, int rows, int draw);
	//根据当前用户的id和消息id，查出所接收的消息
	List<BmessageinforVo> selectMessageByMessageId(Long message_id);

	DatatablesResult selectDataGridVoByTitle(List<BmessageinforVo> messageinforvo, Integer page, Integer rows, Integer draw);

	




	


	

	
}
