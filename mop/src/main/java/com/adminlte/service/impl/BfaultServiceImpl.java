package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BfaultMapper;
import com.adminlte.pojo.Bfault;
import com.adminlte.pojo.vo.BfaultVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBfaultService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BfaultServiceImpl extends ServiceImpl<BfaultMapper, Bfault> implements IBfaultService {
	@Autowired
	BfaultMapper bfaultMapper;

	@Override
	public DatatablesResult<BfaultVo> selecDataGridWrapper(int page, int rows, int parseInt,
			EntityWrapper<Bfault> wrapper) {
		PageHelper.startPage(page, rows);
		List<BfaultVo> bfaultVoList = this.bfaultMapper.selectVoList(wrapper);
		PageInfo<BfaultVo> pageInfo = new PageInfo<BfaultVo>(bfaultVoList);
		DatatablesResult<BfaultVo> datatablesResult = new DatatablesResult<BfaultVo>();
		datatablesResult.setData(bfaultVoList);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<Bfault> selectNotSoluteFaultList(Long inspectid) {
		return this.bfaultMapper.selectNotSoluteFaultList(inspectid);
	}
}
