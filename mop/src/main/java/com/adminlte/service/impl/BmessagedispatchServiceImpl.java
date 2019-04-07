package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BmessagedispatchMapper;
import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.vo.BmessagedispatchVo;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBmessagedispatchService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BmessagedispatchServiceImpl extends ServiceImpl<BmessagedispatchMapper, Bmessagedispatch> implements IBmessagedispatchService {

	@Autowired
    private BmessagedispatchMapper messagedispatchMapper;

	private List<Bmessagedispatch> selectTreeGrid() {
		EntityWrapper<Bmessagedispatch> wrapper = new EntityWrapper<Bmessagedispatch>();
        wrapper.orderBy("id");
        return messagedispatchMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Bmessagedispatch> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Bmessagedispatch> messagedispatchs = messagedispatchMapper.selectList(new EntityWrapper<Bmessagedispatch>());
		PageInfo<Bmessagedispatch> pageInfo = new PageInfo<>(messagedispatchs);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messagedispatchs);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
	@Override
	public DatatablesResult<BmessagedispatchVo> selectDataGridVo(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<BmessagedispatchVo> messagedispatchsVo = messagedispatchMapper.selectList(new EntityWrapper<BmessagedispatchVo>());
		PageInfo<BmessagedispatchVo> pageInfo = new PageInfo<>(messagedispatchsVo);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messagedispatchsVo);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	/*By cgp
	 * 查询出所有的BmessagedispatchVo值
	 * */
	@Override
	public List<Bmessagedispatch> selectAllBmessagedispatch() {
		// TODO Auto-generated method stub
		return messagedispatchMapper.selectAllBmessagedispatch();
	}
	//根据消息id删除接收到的信息
	@Override
	public Boolean delectDealMessage(List<Long> ids) {
		// TODO Auto-generated method stub
		return messagedispatchMapper.delectDealMessage(ids);
	}
}
