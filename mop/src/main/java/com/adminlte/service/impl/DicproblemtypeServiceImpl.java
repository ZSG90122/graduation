package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicproblemtypeMapper;
import com.adminlte.pojo.Dicproblemtype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicproblemtypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicproblemtypeServiceImpl extends ServiceImpl<DicproblemtypeMapper, Dicproblemtype> implements IDicproblemtypeService {

	@Autowired
    private DicproblemtypeMapper problemtypeMapper;

	private List<Dicproblemtype> selectTreeGrid() {
		EntityWrapper<Dicproblemtype> wrapper = new EntityWrapper<Dicproblemtype>();
        wrapper.orderBy("id");
        return problemtypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicproblemtype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicproblemtype> wrapper = new EntityWrapper<Dicproblemtype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicproblemtype> problemtypes = problemtypeMapper.selectList(wrapper);
		PageInfo<Dicproblemtype> pageInfo = new PageInfo<>(problemtypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(problemtypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
