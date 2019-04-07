package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicmessagetypeMapper;
import com.adminlte.mapper.DictendertypeMapper;
import com.adminlte.pojo.Dicmessagetype;
import com.adminlte.pojo.Dictendertype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicmessagetypeService;
import com.adminlte.service.IDictendertypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DictendertypeServiceImpl extends ServiceImpl<DictendertypeMapper, Dictendertype> implements IDictendertypeService {

	@Autowired
    private DictendertypeMapper tendertypeMapper;

	private List<Dictendertype> selectTreeGrid() {
		EntityWrapper<Dictendertype> wrapper = new EntityWrapper<Dictendertype>();
        wrapper.orderBy("id");
        return tendertypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dictendertype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dictendertype> wrapper = new EntityWrapper<Dictendertype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dictendertype> tendertypes = tendertypeMapper.selectList(wrapper);
		PageInfo<Dictendertype> pageInfo = new PageInfo<>(tendertypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(tendertypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
