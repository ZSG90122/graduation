package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicchecktypeMapper;
import com.adminlte.mapper.DicimportmatterMapper;
import com.adminlte.pojo.Dicchecktype;
import com.adminlte.pojo.Dicimportmatter;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicchecktypeService;
import com.adminlte.service.IDicimportmatterService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicimportmatterServiceImpl extends ServiceImpl<DicimportmatterMapper, Dicimportmatter> implements IDicimportmatterService {

	@Autowired
    private DicimportmatterMapper dicimportmatterMapper;

	private List<Dicimportmatter> selectTreeGrid() {
		EntityWrapper<Dicimportmatter> wrapper = new EntityWrapper<Dicimportmatter>();
        wrapper.orderBy("id");
        return dicimportmatterMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicimportmatter> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicimportmatter> wrapper = new EntityWrapper<Dicimportmatter>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicimportmatter> importmatter = dicimportmatterMapper.selectList(wrapper);
		PageInfo<Dicimportmatter> pageInfo = new PageInfo<>(importmatter);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(importmatter);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
	@Override
	public DatatablesResult<Dicimportmatter> selectDataGrid(int page, int rows, int draw,Wrapper wrapper) {
		// TODO Auto-generated method stub
		
		PageHelper.startPage(page, rows);
		List<Dicimportmatter> importmatter = dicimportmatterMapper.selectList(wrapper);
		PageInfo<Dicimportmatter> pageInfo = new PageInfo<>(importmatter);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(importmatter);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
}
