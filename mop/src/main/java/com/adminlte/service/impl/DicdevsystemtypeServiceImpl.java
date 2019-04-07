package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicdevsystemtypeMapper;
import com.adminlte.pojo.Dicdevsystemtype;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicdevsystemtypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("DicdevsystemtypeServiceImpl")
public class DicdevsystemtypeServiceImpl extends ServiceImpl<DicdevsystemtypeMapper, Dicdevsystemtype> implements IDicdevsystemtypeService {

	@Autowired
    private DicdevsystemtypeMapper devsystemtypeMapper;

	private List<Dicdevsystemtype> selectTreeGrid() {
		EntityWrapper<Dicdevsystemtype> wrapper = new EntityWrapper<Dicdevsystemtype>();
        wrapper.orderBy("id");
        return devsystemtypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Dicdevsystemtype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		EntityWrapper<Dicdevsystemtype> wrapper = new EntityWrapper<Dicdevsystemtype>();
        wrapper.orderBy("id");
		PageHelper.startPage(page, rows);
		List<Dicdevsystemtype> devsystemTypes = devsystemtypeMapper.selectList(wrapper);
		PageInfo<Dicdevsystemtype> pageInfo = new PageInfo<>(devsystemTypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(devsystemTypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}




}
