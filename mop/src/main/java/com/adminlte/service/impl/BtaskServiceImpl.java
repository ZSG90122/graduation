package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BtaskMapper;
import com.adminlte.pojo.Btask;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBtaskService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BtaskServiceImpl extends ServiceImpl<BtaskMapper, Btask> implements IBtaskService {
	@Autowired
	BtaskMapper btaskMapper;

	@Override
	public DatatablesResult<Btask> selecDataGridWrapper(int page, int rows, int parseInt,
			EntityWrapper<Btask> wrapper) {
		PageHelper.startPage(page, rows);
		List<Btask> btaskList = this.btaskMapper.selectList(wrapper);
		PageInfo<Btask> pageInfo = new PageInfo<Btask>(btaskList);
		DatatablesResult<Btask> datatablesResult = new DatatablesResult<Btask>();
		datatablesResult.setData(btaskList);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
}
