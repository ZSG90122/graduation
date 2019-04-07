package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BdevsystemMapper;
import com.adminlte.pojo.Bdevsystem;
import com.adminlte.pojo.vo.BdevsystemVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBdevsystemService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BdevsystemServiceImpl extends ServiceImpl<BdevsystemMapper, Bdevsystem> implements IBdevsystemService {

	@Autowired
	BdevsystemMapper bdevsystemMapper;

	@Override
	public List<Bdevsystem> selectBDevsystemListWrapper(Wrapper wrapper) {
		return null;
	}

	@Override
	public DatatablesResult<BdevsystemVo> selectVoDataGridWrapper(int page, int rows, int parseInt, Wrapper wrapper) {
		PageHelper.startPage(page, rows);
		List<BdevsystemVo> bdevsystem = bdevsystemMapper.selectVoListWrapper(wrapper);
		PageInfo<BdevsystemVo> pageInfo = new PageInfo<BdevsystemVo>(bdevsystem);
		DatatablesResult<BdevsystemVo> datatablesResult = new DatatablesResult<BdevsystemVo>();
		datatablesResult.setData(bdevsystem);
		datatablesResult.setRecordsTotal((int) pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<BdevsystemVo> selectBDevsystemVoListWrapper(Wrapper wrapper) {
		return bdevsystemMapper.selectVoListWrapper(wrapper);
	}

}
