package com.adminlte.mapper;

import java.util.List;

import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.vo.BmessagedispatchVo;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

public interface BmessagedispatchMapper extends BaseMapper<Bmessagedispatch>{
	//查询出所有的Bmessagedispatch
	List<Bmessagedispatch> selectAllBmessagedispatch();
	//根据消息id删除接收到的信息
	Boolean delectDealMessage(List<Long> ids);
	
	List<BmessagedispatchVo> selectList(EntityWrapper<BmessagedispatchVo> entityWrapper);


}
