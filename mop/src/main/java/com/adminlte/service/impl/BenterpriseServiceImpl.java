package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BenterpriseMapper;
import com.adminlte.mapper.BmessagedispatchMapper;
import com.adminlte.pojo.Benterprise;
import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.vo.BmessagedispatchVo;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBenterpriseService;
import com.adminlte.service.IBmessagedispatchService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BenterpriseServiceImpl extends ServiceImpl<BenterpriseMapper, Benterprise> implements IBenterpriseService {

	@Autowired
    private BenterpriseMapper enterpriseMapper;

	@Override
	public DatatablesResult<Benterprise> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Benterprise> enterprises = enterpriseMapper.selectList(new EntityWrapper<Benterprise>());
		PageInfo<Benterprise> pageInfo = new PageInfo<>(enterprises);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(enterprises);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public DatatablesResult<Benterprise> selectDataGridWrapper(int page, int rows, int draw, Wrapper wrapper) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Benterprise> enterprises = enterpriseMapper.selectListWapper(wrapper);
		PageInfo<Benterprise> pageInfo = new PageInfo<>(enterprises);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(enterprises);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<Benterprise> selectList(Wrapper wrapper) {
		// TODO Auto-generated method stub
		return enterpriseMapper.selectList(wrapper);
	}
	
}
