package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.TreeNode;
import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.vo.UdepartmentVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IUdepartmentService extends IService<Udepartment>{

		DatatablesResult<Udepartment> selectDataGrid(int page, int rows, int parseInt);
		//获得全部树节点
		List<TreeNode> getTreeData();
		//查询所有建设单位 不包括该单位下的部门
		List<Udepartment> getTwoLevelTreeData();
		//获得所有后代的树
		List<TreeNode> getTreeData(Long depid);
		//模糊查询西部战区或地方的所有建设单位
		List<Udepartment> listAllDeUdepartments(String name);
		//通过部门id，查询所有部门的联系人
		List<UdepartmentVo> selectContactsNameByDepId(Long id);
		
		List<TreeNode> getTreeDataBybolruinId(int bolruin);
		
		DatatablesResult<Udepartment> selectDataGridWrapper(int page, int rows, int parseInt,Wrapper wrapper);
		//根据条件查询列表
		List<Udepartment> selectdeplistWrapper(Wrapper wrapper);
}
