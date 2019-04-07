package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicdeptypeMapper;
import com.adminlte.pojo.Dicdeptype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicdeptypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicdeptypeServiceImpl extends ServiceImpl<DicdeptypeMapper, Dicdeptype> implements IDicdeptypeService {

	@Autowired
    private DicdeptypeMapper deptypeMapper;

	private List<Dicdeptype> selectTreeGrid() {
		EntityWrapper<Dicdeptype> wrapper = new EntityWrapper<Dicdeptype>();
        wrapper.orderBy("id");
        return deptypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicdeptype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicdeptype> wrapper = new EntityWrapper<Dicdeptype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicdeptype> deptypes = deptypeMapper.selectList(wrapper);
		PageInfo<Dicdeptype> pageInfo = new PageInfo<>(deptypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(deptypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
