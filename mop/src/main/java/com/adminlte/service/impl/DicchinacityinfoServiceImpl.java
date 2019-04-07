package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicchinacityinfoMapper;
import com.adminlte.pojo.Dicchinacityinfo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicchinacityinfoService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicchinacityinfoServiceImpl extends ServiceImpl<DicchinacityinfoMapper, Dicchinacityinfo> implements IDicchinacityinfoService {

	@Autowired
    private DicchinacityinfoMapper chinacityinfoMapper;

	private List<Dicchinacityinfo> selectTreeGrid() {
		EntityWrapper<Dicchinacityinfo> wrapper = new EntityWrapper<Dicchinacityinfo>();
        wrapper.orderBy("id");
        return chinacityinfoMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicchinacityinfo> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicchinacityinfo> wrapper = new EntityWrapper<Dicchinacityinfo>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicchinacityinfo> chinacitys = chinacityinfoMapper.selectList(wrapper);
		PageInfo<Dicchinacityinfo> pageInfo = new PageInfo<>(chinacitys);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(chinacitys);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
