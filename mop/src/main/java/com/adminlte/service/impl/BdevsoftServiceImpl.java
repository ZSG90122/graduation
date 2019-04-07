package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BdevsoftMapper;
import com.adminlte.pojo.Bdevsoft;
import com.adminlte.pojo.vo.BdevsoftVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBdevsoftService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BdevsoftServiceImpl extends ServiceImpl<BdevsoftMapper, Bdevsoft> implements IBdevsoftService {
	@Autowired
	BdevsoftMapper bdevsoftMapper;

	@Override
	public DatatablesResult<BdevsoftVo> selectVoDataGridWrapper(int page, int rows, int parseInt,
			EntityWrapper<Bdevsoft> wrapper) {
		PageHelper.startPage(page, rows);
		List<BdevsoftVo> bdevsoftVoList = bdevsoftMapper.selectVoListWrapper(wrapper);
		PageInfo<BdevsoftVo> pageInfo = new PageInfo<BdevsoftVo>(bdevsoftVoList);
		DatatablesResult<BdevsoftVo> datatablesResult = new DatatablesResult<BdevsoftVo>();
		datatablesResult.setData(bdevsoftVoList);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
}
