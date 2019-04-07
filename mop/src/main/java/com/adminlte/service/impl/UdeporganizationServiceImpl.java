package com.adminlte.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.TreeUtil;
import com.adminlte.mapper.UdepartmentMapper;
import com.adminlte.mapper.UdeporganizationMapper;
import com.adminlte.pojo.TreeNode;
import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Udeporganization;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IUdepartmentService;
import com.adminlte.service.IUdeporganizationService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UdeporganizationServiceImpl extends ServiceImpl<UdeporganizationMapper, Udeporganization> implements IUdeporganizationService {

	@Autowired
    private UdeporganizationMapper organizationMapper;

	private List<Udeporganization> selectTreeGrid() {
		EntityWrapper<Udeporganization> wrapper = new EntityWrapper<Udeporganization>();
        wrapper.orderBy("seq");
        return organizationMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Udeporganization> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Udeporganization> organizations = organizationMapper.selectList(new EntityWrapper<Udeporganization>());
		PageInfo<Udeporganization> pageInfo = new PageInfo<>(organizations);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(organizations);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}


	
}
