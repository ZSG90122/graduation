package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BenterpriseMapper;
import com.adminlte.mapper.BmessagedispatchMapper;
import com.adminlte.mapper.BrcstationdevhouseMapper;
import com.adminlte.pojo.Benterprise;
import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.Brcstationdevhouse;
import com.adminlte.pojo.vo.BmessagedispatchVo;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.pojo.vo.BrcstationdevhouseVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBenterpriseService;
import com.adminlte.service.IBmessagedispatchService;
import com.adminlte.service.IBrcstationdevhouseService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BrcstationdevhouseServiceImpl extends ServiceImpl<BrcstationdevhouseMapper, Brcstationdevhouse>
		implements IBrcstationdevhouseService {

	@Autowired
	private BrcstationdevhouseMapper brcstationdevhouseMapper;

	@Override
	public DatatablesResult<Brcstationdevhouse> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Brcstationdevhouse> rcstationdevhouse = brcstationdevhouseMapper
				.selectList(new EntityWrapper<Brcstationdevhouse>());
		PageInfo<Brcstationdevhouse> pageInfo = new PageInfo<>(rcstationdevhouse);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(rcstationdevhouse);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public DatatablesResult<Brcstationdevhouse> selectDataGridWrapper(int page, int rows, int draw, Wrapper wrapper) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Brcstationdevhouse> rcstationdevhouse = brcstationdevhouseMapper.selectListWapper(wrapper);
		PageInfo<Brcstationdevhouse> pageInfo = new PageInfo<>(rcstationdevhouse);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(rcstationdevhouse);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public DatatablesResult<BrcstationdevhouseVo> selectVoDataGridWrapper(int page, int rows, int draw,
			Wrapper wrapper) {
		PageHelper.startPage(page, rows);
		List<BrcstationdevhouseVo> rcstationdevhouse = brcstationdevhouseMapper.selectVoListWapper(wrapper);
		PageInfo<BrcstationdevhouseVo> pageInfo = new PageInfo<>(rcstationdevhouse);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(rcstationdevhouse);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	
	@Override
	public List<Brcstationdevhouse> selectstationdevhouselistWrapper(Wrapper wrapper) {
		//重写BaseMapper的selectList()方法
		return brcstationdevhouseMapper.selectList(wrapper);
	}

	@Override
	public List<Brcstationdevhouse> selectRemoteStationListOfInspect(Long inspectid) {
		return this.brcstationdevhouseMapper.selectRemoteStationListOfInspect(inspectid);
	}

}
