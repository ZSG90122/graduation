package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BmessageinforMapper;
import com.adminlte.pojo.Bmessageinfor;
import com.adminlte.pojo.User;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBmessageinforService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BmessageinforServiceImpl extends ServiceImpl<BmessageinforMapper, Bmessageinfor> implements IBmessageinforService {

	@Autowired
    private BmessageinforMapper messageinforMapper;

	private List<Bmessageinfor> selectTreeGrid() {
		EntityWrapper<Bmessageinfor> wrapper = new EntityWrapper<Bmessageinfor>();
        wrapper.orderBy("id");
        return messageinforMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Bmessageinfor> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Bmessageinfor> messageinfors = messageinforMapper.selectList(new EntityWrapper<Bmessageinfor>());
		PageInfo<Bmessageinfor> pageInfo = new PageInfo<>(messageinfors);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messageinfors);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
	@Override
	public DatatablesResult<BmessageinforVo> selectDataGridVo(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<BmessageinforVo> messageinfors = messageinforMapper.selectMessagesByWrapper(new EntityWrapper<BmessageinforVo>());
		PageInfo<BmessageinforVo> pageInfo = new PageInfo<>(messageinfors);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messageinfors);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
	@Override
	public DatatablesResult<BmessageinforVo> selectDataGridWrapper(int page, int rows, int draw, Wrapper wrapper) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		//
		List<BmessageinforVo> bmessageinforVos = messageinforMapper.selectMessagesByWrapper(wrapper);
		
		PageInfo<BmessageinforVo> pageInfo = new PageInfo<>(bmessageinforVos);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(bmessageinforVos);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	
	
	
	/*by CGP
	 * 根据id删除对应的消息
	 */
	@Override
	public boolean delectMessageInfo(List<Long> message_id) {
		try{
			messageinforMapper.delectOneOrmoreDispatch(message_id);
			messageinforMapper.delectOneOrmoreAttach(message_id);
			messageinforMapper.delectOneOrmoreMessageInfo(message_id);
			return true;
		}catch (Exception e) {
			return false;
		}
	}
	/*by CGP
	 * 根据消息的标题，查询对应的消息
	 */
	@Override
	public List<BmessageinforVo> selectMessageVoByTitle(String Messagetitle) {
		// TODO Auto-generated method stub
		BmessageinforVo bmessageinforVo = new BmessageinforVo();
		EntityWrapper<BmessageinforVo> wrapper = new EntityWrapper<BmessageinforVo>(bmessageinforVo);
	    wrapper.isWhere(true).like("m.title", Messagetitle);
		return messageinforMapper.selectMessagesByWrapper(wrapper);
	}
	@Override
	public DatatablesResult selectDataGridVoByTitle(List<BmessageinforVo> messageinforvo, Integer page, Integer rows,
			Integer draw) {
		PageHelper.startPage(page, rows);
		PageInfo<BmessageinforVo> pageInfo = new PageInfo<BmessageinforVo>(messageinforvo);
		DatatablesResult<BmessageinforVo> pageResult = new DatatablesResult<BmessageinforVo>();
		pageResult.setData(messageinforvo);
		pageResult.setDraw(draw);
		pageResult.setRecordsTotal((int)pageInfo.getTotal());
		pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
		return pageResult;
	}
	
	/*by CGP
	 * 根据当前用户的id和消息id，查出所接收的消息
	 */
	@Override
	public List<BmessageinforVo> selectMessageByMessageId(Long message_id) {
		
		return messageinforMapper.selectMessageByMessageId(message_id);
	}


	
}
