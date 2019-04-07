package com.adminlte.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Bmessageinfor;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

public interface BmessageinforMapper extends BaseMapper<Bmessageinfor>{
	
	List<BmessageinforVo> selectMessagesByWrapper(@Param("ew") Wrapper<BmessageinforVo> wrapper);
	//通过id删除消息，并从3张关联的表中删除消息
	void delectOneOrmoreMessageInfo(List<Long> message_id);

	void delectOneOrmoreDispatch(List<Long> message_id);

	void delectOneOrmoreAttach(List<Long> message_id);
	//通过id查询消息
	List<BmessageinforVo> selectMessageVoByTitle(String Messagetitle);

	//根据当前用户的id和消息id，查出所接收的消息
	List<BmessageinforVo> selectMessageByMessageId(Long message_id);



	
}
