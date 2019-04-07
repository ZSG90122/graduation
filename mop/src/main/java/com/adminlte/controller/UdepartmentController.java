package com.adminlte.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.pojo.Benterprise;
import com.adminlte.pojo.TreeNode;
import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Uroleresource;
import com.adminlte.pojo.vo.Result;
import com.adminlte.pojo.vo.UdepartmentVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBenterpriseService;
import com.adminlte.service.IRoleService;
import com.adminlte.service.IUdepartmentService;
import com.adminlte.service.IUserService;
import com.adminlte.service.IWebsocketService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

@Controller
@RequestMapping("/department")
public class UdepartmentController extends BaseController {

	@Autowired
	IUdepartmentService departmentService;
	@Autowired
	IBenterpriseService enterpriseService;
	@Autowired
	IWebsocketService websocketService;
	@Autowired
	IRoleService roleService;
	@Autowired
	IUserService userService;

	
	@RequestMapping("/manager")
	public String manager() {
		//return "user/manager";
		//websocketService.websocketSendMeesage("ddd");
		return "test/test";   //测试页面
	}
	//https://www.cnblogs.com/fingerboy/p/6657118.html
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> manager(
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.departmentService.selectDataGrid(page, rows, Integer.parseInt(draw) );
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/*
	 * 查询商家的列表
	 */
	@RequestMapping(value = "/enterprisedataGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> enterprisedataGrid(String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		String name = null;
		if(null != querystring){
			String str1[]=querystring.split(",");//将字符串按逗号分割为两部分
			int i;
			for(i=0;i<str1.length;i++){
				String str2[] = str1[i].split(":");
				if(str2.length<2){
					continue;
				}
				switch(str2[0]){				
				case "name":name=str2[1];break;
				}
			}
		}
		try {
			EntityWrapper<Benterprise> wrapper = new EntityWrapper<Benterprise>();
			if(null!=name && name.length()>0){
				wrapper.isWhere(true);
	        	wrapper.like("e.name", name);
	        }
			DatatablesResult datatablesResult = this.enterpriseService.selectDataGridWrapper(page, rows, Integer.parseInt(draw),wrapper );
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/*
	 * 查询商家的列表
	 */
	@RequestMapping(value = "/enterpriseList/{data}", method = RequestMethod.GET)
	@ResponseBody
	public List<Benterprise> enterpriseList(@PathVariable("data") String data){
		EntityWrapper<Benterprise> wrapper = new EntityWrapper<Benterprise>();
		return enterpriseService.selectList(wrapper);
	}
	
	
	/*
	 * by lqq
	 * 组织机构中 
	 * 部门操作页面跳转
	 */
	@RequestMapping("/departmentManager")
	public String departmentManag(){
		return "departmentmanager/departmentManager";
	}
	/**
	 * 商家管理主要界面
	 * @return
	 */
	@RequestMapping("/enterpriseManager")
	public String enterpriseManager(){
		return "departmentmanager/enterpriseManager";
	}
	
	/**
	 * insertEnterpriseInfor
	 * 新增商家信息
	 * @return
	 */
	@RequestMapping(value = "/insertEnterpriseInfor", method = RequestMethod.POST)
	@ResponseBody
	public Result insertEnterpriseInfor(Benterprise interprise)
	{
		try{
			enterpriseService.insert(interprise);
			return new Result(true);
		}catch(Exception e){
			return new Result(false);
		}	
	}
	/**
	 * saveEnterpriseInfor
	 * 保存商家信息
	 * @return
	 */
	@RequestMapping(value = "/saveEnterpriseInfor", method = RequestMethod.POST)
	@ResponseBody
	public Result saveEnterpriseInfor(Benterprise interprise)
	{
		try{
			System.out.println("--------------:"+interprise.getId());
			enterpriseService.updateById(interprise);
			return new Result(true);
		}catch(Exception e){
			return new Result(false);
		}	
	}
	/*
	 * 删除一个商家
	 */
	@RequestMapping(value = "/deleteEnterprise", method = RequestMethod.POST)
    @ResponseBody
    public Result deleteEnterprise(Benterprise enterprise)
    {
		try{
			enterpriseService.deleteById(enterprise.getId());
			return new Result(true);
		}catch(Exception ex){
			System.out.println(ex.toString());
			return new Result(false, "删除商家失败！");
		}
    }
	/**
	 * 
	 * @param 删除选择的商家
	 * @return
	 */
	@RequestMapping(value = "/deleteEnterpriseBatch", method = RequestMethod.POST)
    @ResponseBody
    public Result deleteEnterpriseBatch(@RequestBody List<Benterprise> enterprisesIds)
    {
		//System.out.println("dsdsdsd::::"+enterprisesIds.get(0).getId()+":"+enterprisesIds.size());
		try{
			for(Benterprise item : enterprisesIds){
				enterpriseService.deleteById(item.getId());
			}
			//enterpriseService.deleteBatchIds(enterprisesIds); //要这个函数，似乎表不用id，用tbid等或许可以
			return new Result(true);
		}catch(Exception ex){
			System.out.println(ex.toString());
			return new Result(false, "删除站点失败！");
		}
    }
	
	//返回部门树的数据   by lqq
	@RequestMapping(value = "/treeData", method = RequestMethod.POST)
	@ResponseBody 
	public List<TreeNode> getTreeData()
	{
		return departmentService.getTreeData();
	}
	//查询当前用户单位下所有单位
	@RequestMapping(value = "/treeDatabydep", method = RequestMethod.POST)
	@ResponseBody 
	public List<TreeNode> getTreeDatabydep()
	{
		Long userId = this.getUserId();
		Long depid = userService.selectById(userId).getdepartmentId().longValue();
		return departmentService.getTreeData(depid);
	}
	//查询所有激活的部门树
	@RequestMapping(value = "/activetreeDatabydep", method = RequestMethod.POST)
	@ResponseBody 
	public List<TreeNode> getActiveTreeDatabydep()
	{
		int bolruin = 1;
		return departmentService.getTreeDataBybolruinId(bolruin);
	}
	
	/*
	 * 根据ID获取对应节点的信息
	 */
	@RequestMapping(value = "/get/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Udepartment get(@PathVariable("id") String id) {
		return departmentService.selectById(id);
    }
	/**
	 * 得到所有的二级单位，就是所有监测站单位的名字
	 * @param department
	 * @return
	 */
	@RequestMapping(value = "/getdeplist/{id}", method = RequestMethod.GET)
    @ResponseBody
    public List<Udepartment> getdeplist(@PathVariable("id") String id) {
		//这个wrapper是用来进行相应的数据库操作的
		EntityWrapper<Udepartment> wrapper = new EntityWrapper<Udepartment>();
		//wrapper.isWhere(true); //用的baomidou的selectlist
		wrapper.eq("parentid", 1);
        wrapper.orderBy("id");        
		return departmentService.selectdeplistWrapper(wrapper);
    }
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Result save(Udepartment department)
	{
		System.out.println("存储修改部门信息："+department.getName());
		Long depid = department.getId();
		if(depid != null && departmentService.selectById(depid)!=null){	
			departmentService.updateById(department);
		}else{
			departmentService.insert(department);
		}
		return new Result(true);
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@PathVariable("id") long id)
    {
		try{
			departmentService.deleteById(id);
			return new Result(true);
		}catch(Exception ex){
			System.out.println(ex.toString());
			return new Result(false, "删除部门失败！");
		}
    }
	
	/**
	 * 人员管理模块
	 * 人员管理跳转
	 */
	@RequestMapping("/staffManager")
	public String staffManager(){
		return "departmentmanager/staffManager";
	}
	/**
	 * 模糊查询建设单位信息
	 */
	@RequestMapping(value = "/likeDepartmentName/{name}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DatatablesResult> likeDepartmentName(@PathVariable(value="name")String name,
    		@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length){ 
		
				int rows = Integer.parseInt(length);
				int page = (Integer.parseInt(start) / rows) + 1;
				try {
					DatatablesResult datatablesResult = this.departmentService.selectDataGrid(page, rows, Integer.parseInt(draw) );
					List<Udepartment> udepartmentvos = departmentService.listAllDeUdepartments(name);
					datatablesResult.setData(udepartmentvos);
					return ResponseEntity.ok(datatablesResult);
				} catch (Exception e) {
					e.printStackTrace();
				}
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
	/*by CGP
	 * 根据传入的departmentId数组 获取udepartment表中对应departmentId的联系人的名字
	 */
	@RequestMapping(value = "/getContactsName/{data}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getContactsName(
			@PathVariable("data") String data,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.departmentService.selectDataGrid(page, rows, Integer.parseInt(draw) );
			List<UdepartmentVo> udepartmentvos = departmentService.selectContactsNameByDepId(Long.parseLong(data));
			datatablesResult.setData(udepartmentvos);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	
	
	@RequestMapping("/roleAuthority")
	public String roleAuthority(){
		//System.out.println("_____________________sdf_____________________________________________");
		return "departmentmanager/roleAuthority";
	}
	
	@RequestMapping(value = "/roleGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> roleGrid() {
		
		try {
			DatatablesResult datatablesResult = this.roleService.selectGrid();
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	@RequestMapping(value = "/roleResouce", method = RequestMethod.POST)
	@ResponseBody
	public List<Uroleresource> roleResouce(Long roleId) {
		
		try {
			List<Uroleresource> slist = roleService.selectResourceListByRoleId(roleId);
			return slist;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping(value = "/saveroleResouce", method = RequestMethod.POST)
	@ResponseBody
	public Result saveroleResouce(Long roleid,Long souceid) {
		
		try {
			roleService.saverolerescouce(roleid, souceid);
			return new Result(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Result(false);
	}
	@RequestMapping(value = "/deleteroleResouce", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteroleResouce(Long roleid,Long souceid) {
		
		try {
			roleService.deleteroleresouce(roleid, souceid);
			return new Result(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Result(false);
	}
	
	
}
