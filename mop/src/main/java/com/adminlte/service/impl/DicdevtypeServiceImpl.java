package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicdevtypeMapper;
import com.adminlte.pojo.Dicdevtype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicdevtypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicdevtypeServiceImpl extends ServiceImpl<DicdevtypeMapper, Dicdevtype> implements IDicdevtypeService {

	@Autowired
    private DicdevtypeMapper devtypeMapper;

	private List<Dicdevtype> selectTreeGrid() {
		EntityWrapper<Dicdevtype> wrapper = new EntityWrapper<Dicdevtype>();
        wrapper.orderBy("id");
        return devtypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicdevtype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicdevtype> wrapper = new EntityWrapper<Dicdevtype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicdevtype> personrols = devtypeMapper.selectList(wrapper);
		PageInfo<Dicdevtype> pageInfo = new PageInfo<>(personrols);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(personrols);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
