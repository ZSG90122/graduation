package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicplanetypeMapper;
import com.adminlte.mapper.DicplperblindagetypeMapper;
import com.adminlte.pojo.Dicplanetype;
import com.adminlte.pojo.Dicplperblindagetype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicplanetypeService;
import com.adminlte.service.IDicplperblindagetypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("DicplperblindagetypeServiceImpl")
public class DicplperblindagetypeServiceImpl extends ServiceImpl<DicplperblindagetypeMapper, Dicplperblindagetype> implements IDicplperblindagetypeService {

	@Autowired
    private DicplperblindagetypeMapper plperblindagetypeMapper;

	private List<Dicplperblindagetype> selectTreeGrid() {
		EntityWrapper<Dicplperblindagetype> wrapper = new EntityWrapper<Dicplperblindagetype>();
        wrapper.orderBy("id");
        return plperblindagetypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicplperblindagetype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicplperblindagetype> wrapper = new EntityWrapper<Dicplperblindagetype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicplperblindagetype> plperblindagetypes = plperblindagetypeMapper.selectList(wrapper);
		PageInfo<Dicplperblindagetype> pageInfo = new PageInfo<>(plperblindagetypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(plperblindagetypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}




}
