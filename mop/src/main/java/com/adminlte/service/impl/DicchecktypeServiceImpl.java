package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicchecktypeMapper;
import com.adminlte.pojo.Dicchecktype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicchecktypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicchecktypeServiceImpl extends ServiceImpl<DicchecktypeMapper, Dicchecktype> implements IDicchecktypeService {

	@Autowired
    private DicchecktypeMapper checktypeMapper;

	private List<Dicchecktype> selectTreeGrid() {
		EntityWrapper<Dicchecktype> wrapper = new EntityWrapper<Dicchecktype>();
        wrapper.orderBy("id");
        return checktypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicchecktype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicchecktype> wrapper = new EntityWrapper<Dicchecktype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicchecktype> checktypes = checktypeMapper.selectList(wrapper);
		PageInfo<Dicchecktype> pageInfo = new PageInfo<>(checktypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(checktypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
