package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicplanemiltypeMapper;
import com.adminlte.mapper.DicplanetypeMapper;
import com.adminlte.pojo.Dicplanemiltype;
import com.adminlte.pojo.Dicplanetype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicplanemiltypeService;
import com.adminlte.service.IDicplanetypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("DicplanemiltypeServiceImpl")
public class DicplanemiltypeServiceImpl extends ServiceImpl<DicplanemiltypeMapper, Dicplanemiltype> implements IDicplanemiltypeService {

	@Autowired
    private DicplanemiltypeMapper planemiltypeMapper;

	private List<Dicplanemiltype> selectTreeGrid() {
		EntityWrapper<Dicplanemiltype> wrapper = new EntityWrapper<Dicplanemiltype>();
        wrapper.orderBy("id");
        return planemiltypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicplanemiltype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicplanemiltype> wrapper = new EntityWrapper<Dicplanemiltype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicplanemiltype> planemiltypes = planemiltypeMapper.selectList(wrapper);
		PageInfo<Dicplanemiltype> pageInfo = new PageInfo<>(planemiltypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(planemiltypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}




}
