package com.adminlte.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.utils.TreeUtil;
import com.adminlte.commons.utils.talentPieUtil;
import com.adminlte.mapper.UdepartmentMapper;
import com.adminlte.pojo.TreeNode;
import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Udeporganization;
import com.adminlte.pojo.vo.UdepartmentVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IUdepartmentService;
import com.adminlte.service.IUdeporganizationService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UdepartmentServiceImpl extends ServiceImpl<UdepartmentMapper, Udepartment> implements IUdepartmentService {

	@Autowired
    private UdepartmentMapper departmentMapper;

	private List<Udepartment> selectTreeGrid() {
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
        wrapper.orderBy("seq");
        return departmentMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Udepartment> selectDataGrid(int page, int rows, int draw) {
		PageHelper.startPage(page, rows);
		List<Udepartment> departments = departmentMapper.selectList(new EntityWrapper<Udepartment>());
		PageInfo<Udepartment> pageInfo = new PageInfo<>(departments);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(departments);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<TreeNode> getTreeData() {
		// TODO Auto-generated method stub
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
        wrapper.orderBy("id");
        List<Udepartment> departmentList = departmentMapper.selectList(wrapper);
        Map<String, TreeNode> nodeList = new LinkedHashMap<String, TreeNode>();
        for(Udepartment  department:departmentList){
        	TreeNode node = new TreeNode();
        	node.setId(department.getId().toString());
        	node.setText(department.getName());
        	node.setParentId(department.getParentid() == null?null:department.getParentid().toString());
        	node.setLevelcode(department.getDeptypeId());
        	nodeList.put(node.getId(), node);
        }
        return TreeUtil.getNodeList(nodeList);
	}

	@Override
	public List<TreeNode> getTreeData(Long depid) {
		// TODO Auto-generated method stub
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
        wrapper.orderBy("id");
        List<Udepartment> departmentList = departmentMapper.selectOffsprings(depid);
        Map<String, TreeNode> nodeList = new LinkedHashMap<String, TreeNode>();
        for(Udepartment  department:departmentList){
        	TreeNode node = new TreeNode();
        	node.setId(department.getId().toString());
        	node.setText(department.getName());
        	if(department.getId() != depid){
        		node.setParentId(department.getParentid() == null?null:department.getParentid().toString());
        	}else{
        		node.setParentId(null);
        	}
        	node.setLevelcode(department.getDeptypeId());
        	nodeList.put(node.getId(), node);
        }
        return TreeUtil.getNodeList(nodeList);
	}

	@Override
	public List<Udepartment> listAllDeUdepartments(String name) {
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
		// name为-1时 代表查询所有建设单位
		if (!name.equals("-1")) {
			wrapper.like("name", name);
			wrapper.eq("parentid", 1);
			wrapper.orNew("parentid", 2).like("name", name);
		}else {
			wrapper.eq("parentid", 1).or("parentid=2");
		}
		List<Udepartment> departmentList = departmentMapper.selectList(wrapper);
		return departmentList;
	}
	/*by CGP
	 * 通过部门id，查询部门联系人员的姓名
	 */
	@Override
	public List<UdepartmentVo> selectContactsNameByDepId(Long id) {
		// TODO Auto-generated method stub
		return departmentMapper.selectContactsNameByDepId(id);
	}

	@Override
	public List<Udepartment> getTwoLevelTreeData() {
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
		wrapper.eq("parentid", 1).or("parentid=2");
		List<Udepartment> departmentList = departmentMapper.selectList(wrapper);
		return departmentList;
	}

	@Override
	public List<TreeNode> getTreeDataBybolruinId(int bolruin) {
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
        wrapper.orderBy("id");
        wrapper.eq("bolruin", 1);
        List<Udepartment> departmentList = departmentMapper.selectList(wrapper);
        Map<String, TreeNode> nodeList = new LinkedHashMap<String, TreeNode>();
        for(Udepartment  department:departmentList){
        	TreeNode node = new TreeNode();
        	node.setId(department.getId().toString());
        	node.setText(department.getName());
        	node.setParentId(department.getParentid() == null?null:department.getParentid().toString());
        	node.setLevelcode(department.getDeptypeId());
        	nodeList.put(node.getId(), node);
        }
        return TreeUtil.getNodeList(nodeList);
		
	}

	@Override
	public DatatablesResult<Udepartment> selectDataGridWrapper(int page, int rows, int draw, Wrapper wrapper) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Udepartment> departments = departmentMapper.selectListWapper(wrapper);
		PageInfo<Udepartment> pageInfo = new PageInfo<>(departments);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(departments);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<Udepartment> selectdeplistWrapper(Wrapper wrapper) {
		return departmentMapper.selectList(wrapper);
	}


}
