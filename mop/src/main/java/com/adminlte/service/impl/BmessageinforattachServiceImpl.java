package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BmessageinforattachMapper;
import com.adminlte.pojo.Bmessageinforattach;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBmessageinforattachService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BmessageinforattachServiceImpl extends ServiceImpl<BmessageinforattachMapper, Bmessageinforattach> implements IBmessageinforattachService {

	@Autowired
    private BmessageinforattachMapper messageinforattachMapper;

	private List<Bmessageinforattach> selectTreeGrid() {
		EntityWrapper<Bmessageinforattach> wrapper = new EntityWrapper<Bmessageinforattach>();
        wrapper.orderBy("id");
        return messageinforattachMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Bmessageinforattach> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Bmessageinforattach> messageinforattachs = messageinforattachMapper.selectList(new EntityWrapper<Bmessageinforattach>());
		PageInfo<Bmessageinforattach> pageInfo = new PageInfo<>(messageinforattachs);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(messageinforattachs);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

}
