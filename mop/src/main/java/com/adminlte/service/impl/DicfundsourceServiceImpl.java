package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicfundsourceMapper;
import com.adminlte.pojo.Dicfundsource;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicfundsourceService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicfundsourceServiceImpl extends ServiceImpl<DicfundsourceMapper, Dicfundsource> implements IDicfundsourceService {

	@Autowired
    private DicfundsourceMapper fundsourceMapper;

	private List<Dicfundsource> selectTreeGrid() {
		EntityWrapper<Dicfundsource> wrapper = new EntityWrapper<Dicfundsource>();
        wrapper.orderBy("id");
        return fundsourceMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicfundsource> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicfundsource> wrapper = new EntityWrapper<Dicfundsource>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicfundsource> messagetypes = fundsourceMapper.selectList(wrapper);
		PageInfo<Dicfundsource> pageInfo = new PageInfo<>(messagetypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messagetypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
