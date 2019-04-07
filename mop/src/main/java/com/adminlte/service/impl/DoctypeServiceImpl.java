package com.adminlte.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.TreeUtil;
import com.adminlte.mapper.DoctypeMapper;
import com.adminlte.pojo.Doctype;
import com.adminlte.pojo.TreeNode;
import com.adminlte.pojo.User;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDoctypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DoctypeServiceImpl extends ServiceImpl<DoctypeMapper, Doctype> implements IDoctypeService {

	@Autowired
    private DoctypeMapper doctypeMapper;
	
	private List<Doctype> selectTreeGrid() {
		EntityWrapper<Doctype> wrapper = new EntityWrapper<Doctype>();
        wrapper.orderBy("id");
        return doctypeMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Doctype> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Doctype> doctypes = doctypeMapper.selectList(new EntityWrapper<Doctype>());
		PageInfo<Doctype> pageInfo = new PageInfo<>(doctypes);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(doctypes);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<TreeNode> getTreeData() {
		
		EntityWrapper<Doctype> wrapper = new EntityWrapper<Doctype>();
		wrapper.orderBy("id");
		List<Doctype> DoctypeList = doctypeMapper.selectList(wrapper);
        Map<String, TreeNode> nodeList = new LinkedHashMap<String, TreeNode>();
        for(Doctype  doctype:DoctypeList){
        	TreeNode node = new TreeNode();
        	node.setId(doctype.getId().toString());
        	node.setText(doctype.getName());
        	node.setParentId(doctype.getParentid() == null?null:doctype.getParentid().toString());
        	nodeList.put(node.getId(), node);
        }
        return TreeUtil.getNodeList(nodeList);
	}

}
