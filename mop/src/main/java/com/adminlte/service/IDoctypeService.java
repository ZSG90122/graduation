package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Doctype;
import com.adminlte.pojo.TreeNode;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.service.IService;

public interface IDoctypeService extends IService<Doctype>{
	
	DatatablesResult<Doctype> selectDataGrid(int page, int rows, int parseInt);
	//获得全部树节点
	List<TreeNode> getTreeData();
	
}
