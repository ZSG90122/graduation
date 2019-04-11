package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BpersoninspectionMapper;
import com.adminlte.pojo.Bpersoninspection;
import com.adminlte.pojo.vo.BpersoninspectionVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBpersoninspectionService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BpersoninspectionServiceImpl extends ServiceImpl<BpersoninspectionMapper, Bpersoninspection>
		implements IBpersoninspectionService {
	@Autowired
	BpersoninspectionMapper bpersoninspectionMapper;

	@Override
	public DatatablesResult<BpersoninspectionVo> selecDataGridWrapper(int page, int rows, int parseInt,
			EntityWrapper<Bpersoninspection> wrapper) {
		PageHelper.startPage(page, rows);
		List<BpersoninspectionVo> bpersoninspectionVoList = this.bpersoninspectionMapper.selectVoListWrapper(wrapper);
		PageInfo<BpersoninspectionVo> pageInfo = new PageInfo<BpersoninspectionVo>(bpersoninspectionVoList);
		DatatablesResult<BpersoninspectionVo> datatablesResult = new DatatablesResult<BpersoninspectionVo>();
		datatablesResult.setData(bpersoninspectionVoList);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<BpersoninspectionVo> getImageResourceOfThisInspect(EntityWrapper<Bpersoninspection> wrapper) {
		return this.bpersoninspectionMapper.selectVoListWrapper(wrapper);
	}


}
