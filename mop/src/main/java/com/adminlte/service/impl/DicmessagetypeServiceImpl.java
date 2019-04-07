package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicmessagetypeMapper;
import com.adminlte.pojo.Dicmessagetype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicmessagetypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DicmessagetypeServiceImpl extends ServiceImpl<DicmessagetypeMapper, Dicmessagetype> implements IDicmessagetypeService {

	@Autowired
    private DicmessagetypeMapper messagetypeMapper;

	private List<Dicmessagetype> selectTreeGrid() {
		EntityWrapper<Dicmessagetype> wrapper = new EntityWrapper<Dicmessagetype>();
        wrapper.orderBy("id");
        return messagetypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicmessagetype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicmessagetype> wrapper = new EntityWrapper<Dicmessagetype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicmessagetype> messagetypes = messagetypeMapper.selectList(wrapper);
		PageInfo<Dicmessagetype> pageInfo = new PageInfo<>(messagetypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messagetypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
