package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicplanetypeMapper;
import com.adminlte.pojo.Dicplanetype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicplanetypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("DicplanetypeServiceImpl")
public class DicplanetypeServiceImpl extends ServiceImpl<DicplanetypeMapper, Dicplanetype> implements IDicplanetypeService {

	@Autowired
    private DicplanetypeMapper planetypeMapper;

	private List<Dicplanetype> selectTreeGrid() {
		EntityWrapper<Dicplanetype> wrapper = new EntityWrapper<Dicplanetype>();
        wrapper.orderBy("id");
        return planetypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicplanetype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicplanetype> wrapper = new EntityWrapper<Dicplanetype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicplanetype> planetypes = planetypeMapper.selectList(wrapper);
		PageInfo<Dicplanetype> pageInfo = new PageInfo<>(planetypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(planetypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}




}
