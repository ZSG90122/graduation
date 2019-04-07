package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicmaintaintypeMapper;
import com.adminlte.pojo.Dicmaintaintype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicmaintaintypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicmaintaintypeServiceImpl extends ServiceImpl<DicmaintaintypeMapper, Dicmaintaintype> implements IDicmaintaintypeService {

	@Autowired
    private DicmaintaintypeMapper maintaintypeMapper;

	private List<Dicmaintaintype> selectTreeGrid() {
		EntityWrapper<Dicmaintaintype> wrapper = new EntityWrapper<Dicmaintaintype>();
        wrapper.orderBy("id");
        return maintaintypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicmaintaintype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicmaintaintype> wrapper = new EntityWrapper<Dicmaintaintype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicmaintaintype> maintaintypes = maintaintypeMapper.selectList(wrapper);
		PageInfo<Dicmaintaintype> pageInfo = new PageInfo<>(maintaintypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(maintaintypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
