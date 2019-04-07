package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicprojectstateMapper;
import com.adminlte.pojo.Dicprojectstate;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicprojectstateService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicprojectstateServiceImpl extends ServiceImpl<DicprojectstateMapper, Dicprojectstate> implements IDicprojectstateService {

	@Autowired
    private DicprojectstateMapper projectstateMapper;

	private List<Dicprojectstate> selectTreeGrid() {
		EntityWrapper<Dicprojectstate> wrapper = new EntityWrapper<Dicprojectstate>();
        wrapper.orderBy("id");
        return projectstateMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicprojectstate> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicprojectstate> wrapper = new EntityWrapper<Dicprojectstate>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicprojectstate> projectstates = projectstateMapper.selectList(wrapper);
		PageInfo<Dicprojectstate> pageInfo = new PageInfo<>(projectstates);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(projectstates);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
