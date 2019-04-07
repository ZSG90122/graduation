package com.adminlte.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.pojo.Dicchecktype;
import com.adminlte.pojo.Dicchinacityinfo;
import com.adminlte.pojo.Dicdeptype;
import com.adminlte.pojo.Dicfundsource;
import com.adminlte.pojo.Dicimportmatter;
import com.adminlte.pojo.Dicmessagetype;
import com.adminlte.pojo.Dicmaintaintype;
import com.adminlte.pojo.Dicplanemiltype;
import com.adminlte.pojo.Dicplanetype;
import com.adminlte.pojo.Dicplperblindagetype;
import com.adminlte.pojo.Dicproblemtype;
import com.adminlte.pojo.Dicprojectstate;
import com.adminlte.pojo.Dicsystemtype;
import com.adminlte.pojo.Dicdevsystemtype;
import com.adminlte.pojo.Dicdevtype;
import com.adminlte.pojo.Dictendertype;
import com.adminlte.pojo.Doctype;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDicchecktypeService;
import com.adminlte.service.IDicchinacityinfoService;
import com.adminlte.service.IDicdeptypeService;
import com.adminlte.service.IDicfundsourceService;
import com.adminlte.service.IDicimportmatterService;
import com.adminlte.service.IDicmessagetypeService;
import com.adminlte.service.IDicmaintaintypeService;
import com.adminlte.service.IDicplanemiltypeService;
import com.adminlte.service.IDicplanetypeService;
import com.adminlte.service.IDicplperblindagetypeService;
import com.adminlte.service.IDicproblemtypeService;
import com.adminlte.service.IDicdevtypeService;
import com.adminlte.service.IDicprojectstateService;
import com.adminlte.service.IDicsystemtypeService;
import com.adminlte.service.IDicdevsystemtypeService;
import com.adminlte.service.IDictendertypeService;
import com.adminlte.service.IDoctypeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

/*
 * 字典管理
 * by cgp
 * */
@Controller
@RequestMapping("/dic")
public class DictionaryController {
	@Autowired
	IDicdevsystemtypeService idicdevsystemtypeservice;// 设备系统类别，系统大类
	@Autowired
	IDicdevtypeService idicdevtypeService;// 项目负责人角色
	@Autowired
	IDicsystemtypeService idicsystemtypeService;// 配套系统的类型
	@Autowired
	IDicmaintaintypeService idicmaintaintypeService;// 招标方式
	@Autowired
	IDicdeptypeService idicdeptypeService;// 单位类别
	@Autowired
	IDicfundsourceService idicfundsourceService;// 项目来源
	@Autowired
	IDicchecktypeService idicchecktypeService;// 项目审查单位类别
	@Autowired
	IDicmessagetypeService idicmessagetypeService;// 消息类型
	@Autowired
	IDicchinacityinfoService idicchinacityinfoService;// 城市列表
	@Autowired
	IDicproblemtypeService idicproblemtypeService;// 问题类型 gzsds 需要增加管理内容
	@Autowired
	IDicprojectstateService idicprojectstateService;// 工程状态 gzsds 需要增加管理内容
	@Autowired
	IDictendertypeService idictendertypeService;// 招标类型 gzsds 需要增加管理内容
	@Autowired
	IDicimportmatterService idicimportmatterService; // 要事类别
	@Autowired
	IDicplanetypeService idicplanetypeService;// 飞机类别
	@Autowired
	IDicplanemiltypeService idicplanemiltypeService;// 机场部队类别
	@Autowired
	IDicplperblindagetypeService idicplperblindagetypeService;// 野战人员掩体
	@Autowired
	IDoctypeService idoctypeService;// 文档类型
	@Autowired
	private ServletRequest request;

	/*
	 * 0.跳转到字典管理页面
	 */
	@RequestMapping("/manager")
	public String DictionaryManager(Model model) {
		return "dictionary/dictionaryManager";
	}

	/*
	 * 1.跳转到项目类别页面
	 */
	@RequestMapping("/devsystemType")
	public String DictionarydevsystemType(Model model) {
		return "dictionary/devsystemType";
	}

	/*
	 * 2.跳转到设备类型（设备分类）
	 */
	@RequestMapping("/devtype")
	public String Dictionarydevtype(Model model) {
		return "dictionary/devtype";
	}

	/*
	 * 3.跳转到运维类型
	 */
	@RequestMapping("/maintaintype")
	public String Dictionarymaintaintype(Model model) {
		return "dictionary/maintaintype";
	}

	/*
	 * 4.跳转到单位类别页面
	 */
	@RequestMapping("/departmentType")
	public String DictionaryDepartmentType(Model model) {
		return "dictionary/DepartmentType";
	}

	/*
	 * 5.跳转到项目来源管理页面
	 */
	@RequestMapping("/source")
	public String DictionaryRosouce(Model model) {
		return "dictionary/FundSource";
	}

	/*
	 * 6.跳转到审查单位类别页面
	 */
	@RequestMapping("/checkType")
	public String DictionaryCheckType(Model model) {
		return "dictionary/CheckDepartment";
	}

	/*
	 * 7.跳转到消息类别管理页面
	 */
	@RequestMapping("/message")
	public String DictionaryMessage(Model model) {
		return "dictionary/MessageType";
	}

	/*
	 * 8.跳转到消息类别管理页面
	 */
	@RequestMapping("/addressList")
	public String DictionaryAddressList(Model model) {
		return "dictionary/AddressList";
	}

	/*
	 * 9.跳转到工程状态管理页面
	 */
	@RequestMapping("/projectStatus")
	public String DictionaryProjectStatus(Model model) {
		return "dictionary/ProjectStatus";
	}

	/*
	 * 10.跳转到工程问题管理页面
	 */
	@RequestMapping("/projectProblem")
	public String DictionaryProjectProblem(Model model) {
		return "dictionary/ProjectProblem";
	}

	/*
	 * 11.跳转到标段内容管理页面
	 */
	@RequestMapping("/bidContent")
	public String DictionaryBidContent(Model model) {
		return "dictionary/BidContent";
	}

	/*
	 * 12.跳转到飞机类别管理页面
	 */
	@RequestMapping("/planeType")
	public String DictionaryPlaneType(Model model) {
		return "dictionary/PlaneType";
	}

	/*
	 * 12.跳转到机场部队类别管理页面
	 */
	@RequestMapping("/planeMilType")
	public String DictionaryplaneMilType(Model model) {
		return "dictionary/PlaneMilType";
	}

	/*
	 * by cgp 对工程类别字典的操作： 1.加载工程类别的字典列表 2.添加新的工程类别、并通过id修改工程类别 3.通过id删除工程类别
	 */
	// 1.加载工程类别的字典列表
	@RequestMapping(value = "/datadevsystemType", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerdevsystemType(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicdevsystemtypeservice.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的工程类别、并通过id修改工程类别
	@RequestMapping(value = "/updatedevsystemType", method = RequestMethod.POST)
	@ResponseBody
	public Result updatedevsystemType(Dicdevsystemtype devsystemType) {
		Long typeid = devsystemType.getId();
		if (typeid != null && idicdevsystemtypeservice.selectById(typeid) != null) {
			idicdevsystemtypeservice.updateById(devsystemType);
		} else {
			idicdevsystemtypeservice.insert(devsystemType);
		}
		return new Result(true);
	}

	// 3.通过id删除工程类别
	@RequestMapping(value = "/deletedevsystemType", method = RequestMethod.POST)
	@ResponseBody
	public Result deletedevsystemType(Dicdevsystemtype devsystemType) {
		Long typeid = devsystemType.getId();
		try {
			idicdevsystemtypeservice.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * by cgp 对工程人员类别字典的操作： 1.加载工程人员类别的字典列表 2.添加新的工程类别、并通过id修改工程类别 3.通过id删除工程类别
	 */
	// 1.加载设备分类的字典列表
	@RequestMapping(value = "/datadevtype", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerdevtype(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicdevtypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的设备分类
	@RequestMapping(value = "/updatedevtype", method = RequestMethod.POST)
	@ResponseBody
	public Result updatedevtype(Dicdevtype devtype) {
		Long typeid = devtype.getId();
		if (typeid != null && idicdevtypeService.selectById(typeid) != null) {
			idicdevtypeService.updateById(devtype);
		} else {
			idicdevtypeService.insert(devtype);
		}
		return new Result(true);
	}

	// 3.通过id删除设备分类
	@RequestMapping(value = "/deletedevtype", method = RequestMethod.POST)
	@ResponseBody
	public Result deletedevtype(Dicdevtype devtype) {
		Long typeid = devtype.getId();
		try {
			idicdevtypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/**
	 * 获取设备类型的数据（GET请求）
	 * 
	 * @return
	 */
	@RequestMapping(value = "/selectDevTypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicdevtype> selectDevTypeList() {
		EntityWrapper<Dicdevtype> wrapper = new EntityWrapper<Dicdevtype>();
		wrapper.orderBy("id");
		return idicdevtypeService.selectList(wrapper);
	}

	/*
	 * by cgp 对运维类型字典的操作： 1.加载运维类型的字典列表 2.添加新的运维类型、并通过id修改工程发标方式 3.通过id删除运维类型
	 */
	@RequestMapping(value = "/datamaintaintype", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managermaintaintype(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicmaintaintypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的运维类型、并通过id修改运维类型
	@RequestMapping(value = "/updatemaintaintype", method = RequestMethod.POST)
	@ResponseBody
	public Result updatemaintaintype(Dicmaintaintype maintaintype) {
		Long typeid = maintaintype.getId();
		if (typeid != null && idicmaintaintypeService.selectById(typeid) != null) {
			idicmaintaintypeService.updateById(maintaintype);
		} else {
			idicmaintaintypeService.insert(maintaintype);
		}
		return new Result(true);
	}

	// 3.通过id删除运维类型
	@RequestMapping(value = "/deletemaintaintype", method = RequestMethod.POST)
	@ResponseBody
	public Result deletemaintaintype(Dicmaintaintype maintaintype) {
		Long typeid = maintaintype.getId();
		try {
			idicmaintaintypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/**
	 * 以List返回运维类型表的数据（GET请求）
	 * 
	 * @return
	 */
	@RequestMapping("/selectDevMaintainTypeList")
	@ResponseBody
	public List<Dicmaintaintype> selectDevMaintainTypeList() {
		EntityWrapper<Dicmaintaintype> wrapper = new EntityWrapper<Dicmaintaintype>();
		wrapper.orderBy("id");
		return idicmaintaintypeService.selectList(wrapper);
	}

	/*
	 * by cgp 对部门类别字典的操作： 1.加载部门类别的字典列表 2.添加新的部门类别、并通过id修改部门类别 3.通过id删除部门类别
	 */
	// 1.加载部门类别的字典列表
	@RequestMapping(value = "/dataDepartmentType", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerDepartmentType(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicdeptypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的部门类别、并通过id修改部门类别
	@RequestMapping(value = "/updateDepartmentType", method = RequestMethod.POST)
	@ResponseBody
	public Result updateDepartmentType(Dicdeptype departmrntType) {
		Long typeid = departmrntType.getId();
		if (typeid != null && idicdeptypeService.selectById(typeid) != null) {
			idicdeptypeService.updateById(departmrntType);
		} else {
			idicdeptypeService.insert(departmrntType);
		}
		return new Result(true);
	}

	// 3.通过id删除部门类别
	@RequestMapping(value = "/deleteDepartmentType", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteDepartmentType(Dicdeptype departmrntType) {
		Long typeid = departmrntType.getId();
		try {
			idicdeptypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * by cgp 对项目来源字典的操作： 1.加载项目来源的字典列表 2.添加新的项目来源、并通过id修改项目来源 3.通过id删除项目来源
	 */
	// 1.加载项目来源的字典列表
	@RequestMapping(value = "/dataFundSource", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerFundSource(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicfundsourceService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的项目来源、并通过id修改项目来源
	@RequestMapping(value = "/updateFundSource", method = RequestMethod.POST)
	@ResponseBody
	public Result updateFundSource(Dicfundsource fundSource) {
		Long typeid = fundSource.getId();
		if (typeid != null && idicfundsourceService.selectById(typeid) != null) {
			idicfundsourceService.updateById(fundSource);
		} else {
			idicfundsourceService.insert(fundSource);
		}
		return new Result(true);
	}

	// 3.通过id删除项目来源
	@RequestMapping(value = "/deleteFundSource", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteFundSource(Dicfundsource fundSource) {
		Long typeid = fundSource.getId();
		try {
			idicfundsourceService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * by cgp 对审查机构类别字典的操作： 1.加载审查机构类别的字典列表 2.添加新的审查机构类别、并通过id修改审查机构类别
	 * 3.通过id删除审查机构类别
	 */
	// 1.加载审查机构类别的字典列表
	@RequestMapping(value = "/dataCheckType", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerCheckType(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicchecktypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的审查机构类别、并通过id修改审查机构类别
	@RequestMapping(value = "/updateCheckType", method = RequestMethod.POST)
	@ResponseBody
	public Result updateCheckType(Dicchecktype checkType) {
		Long typeid = checkType.getId();
		if (typeid != null && idicchecktypeService.selectById(typeid) != null) {
			idicchecktypeService.updateById(checkType);
		} else {
			idicchecktypeService.insert(checkType);
		}
		return new Result(true);
	}

	// 3.通过id删除审查机构类别
	@RequestMapping(value = "/deleteCheckType", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteCheckType(Dicchecktype checkType) {
		Long typeid = checkType.getId();
		try {
			idicchecktypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * by cgp 对消息类别字典的操作： 1.加载消息类别的字典列表 2.添加新的消息类别、并通过id修改消息类别 3.通过id删除消息类别
	 */
	// 1.加载消息类别的字典列表
	@RequestMapping(value = "/dataMessageType", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerMessageType(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicmessagetypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的消息类别、并通过id修改消息类别
	@RequestMapping(value = "/updateMessageType", method = RequestMethod.POST)
	@ResponseBody
	public Result updateMessageType(Dicmessagetype message) {
		Long typeid = message.getId();
		if (typeid != null && idicmessagetypeService.selectById(typeid) != null) {
			idicmessagetypeService.updateById(message);
		} else {
			idicmessagetypeService.insert(message);
		}
		return new Result(true);
	}

	// 3.通过id删除消息类别
	@RequestMapping(value = "/deleteMessageType", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteMessageType(Dicmessagetype message) {
		Long typeid = message.getId();
		try {
			idicmessagetypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * by cgp 对位置字典的操作： 1.加载位置的字典列表 2.添加新的位置、并通过id修改位置 3.通过id删除位置
	 */
	@RequestMapping(value = "/dataAddressList", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerAddressList(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicchinacityinfoService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的位置、并通过id修改位置
	@RequestMapping(value = "/updateAddressList", method = RequestMethod.POST)
	@ResponseBody
	public Result updateAddressList(Dicchinacityinfo addressList) {
		String typeid = addressList.getCityid();
		if (typeid != null && idicchinacityinfoService.selectById(typeid) != null) {
			idicchinacityinfoService.updateById(addressList);
		} else {
			idicchinacityinfoService.insert(addressList);
		}
		return new Result(true);
	}

	// 3.通过id删除位置
	@RequestMapping(value = "/deleteAddressList", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteAddressList(Dicchinacityinfo addressList) {
		String typeid = addressList.getCityid();
		try {
			idicchinacityinfoService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	// 1.加载工程状态的字典列表
	@RequestMapping(value = "/dataProjectStatus", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerProjectStatus(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicprojectstateService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的工程状态、并通过id修改工程状态
	@RequestMapping(value = "/updateProjectStatus", method = RequestMethod.POST)
	@ResponseBody
	public Result updateProjectStatus(Dicprojectstate dicprojectstate) {
		Long typeid = dicprojectstate.getId();
		if (typeid != null && idicprojectstateService.selectById(typeid) != null) {
			idicprojectstateService.updateById(dicprojectstate);
		} else {
			idicprojectstateService.insert(dicprojectstate);
		}
		return new Result(true);
	}

	// 3.通过id删除工程状态
	@RequestMapping(value = "/deleteProjectStatus", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteProjectStatus(Dicprojectstate dicprojectstate) {
		Long typeid = dicprojectstate.getId();
		try {
			idicprojectstateService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	// 1.加载工程问题的字典列表
	@RequestMapping(value = "/dataProjectProblem", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerProjectProblem(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicproblemtypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的工程问题、并通过id修改工程问题
	@RequestMapping(value = "/updateProjectProblem", method = RequestMethod.POST)
	@ResponseBody
	public Result updateProjectProblem(Dicproblemtype dicproblemtype) {
		Long typeid = dicproblemtype.getId();
		if (typeid != null && idicproblemtypeService.selectById(typeid) != null) {
			idicproblemtypeService.updateById(dicproblemtype);
		} else {
			idicproblemtypeService.insert(dicproblemtype);
		}
		return new Result(true);
	}

	// 3.通过id删除工程问题
	@RequestMapping(value = "/deleteProjectProblem", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteProjectProblem(Dicproblemtype dicproblemtype) {
		Long typeid = dicproblemtype.getId();
		try {
			idicproblemtypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	// 1.加载标段内容的字典列表
	@RequestMapping(value = "/dataBidContent", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerBidContent(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idictendertypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的标段内容、并通过id修改标段内容
	@RequestMapping(value = "/updateBidContent", method = RequestMethod.POST)
	@ResponseBody
	public Result updateBidContent(Dictendertype dictendertype) {
		Long typeid = dictendertype.getId();
		if (typeid != null && idictendertypeService.selectById(typeid) != null) {
			idictendertypeService.updateById(dictendertype);
		} else {
			idictendertypeService.insert(dictendertype);
		}
		return new Result(true);
	}

	// 3.通过id删除标段内容
	@RequestMapping(value = "/deleteBidContent", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteBidContent(Dictendertype dictendertype) {
		Long typeid = dictendertype.getId();
		try {
			idictendertypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	// 1.加载飞机类别的字典列表
	@RequestMapping(value = "/dataPlaneType", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerPlaneType(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicplanetypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的飞机内容、并通过id修改飞机内容
	@RequestMapping(value = "/updatePlaneType", method = RequestMethod.POST)
	@ResponseBody
	public Result updatePlaneType(Dicplanetype dicplanetype) {
		Long typeid = dicplanetype.getId();
		if (typeid != null && idicplanetypeService.selectById(typeid) != null) {
			idicplanetypeService.updateById(dicplanetype);
		} else {
			idicplanetypeService.insert(dicplanetype);
		}
		return new Result(true);
	}

	// 3.通过id删除飞机类型
	@RequestMapping(value = "/deletePlaneType", method = RequestMethod.POST)
	@ResponseBody
	public Result deletePlaneType(Dicplanetype dicplanetype) {
		Long typeid = dicplanetype.getId();
		try {
			idicplanetypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	// 1.加载机场部队类别的字典列表
	@RequestMapping(value = "/dataPlaneMilType", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> managerPlaneMilType(@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start, @RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.idicplanemiltypeService.selectDataGrid(page, rows,
					Integer.parseInt(draw));
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	// 2.添加新的部队类别、并通过id修改部队类别
	@RequestMapping(value = "/updatePlaneMilType", method = RequestMethod.POST)
	@ResponseBody
	public Result updatePlaneMilType(Dicplanemiltype dicplanemiltype) {
		Long typeid = dicplanemiltype.getId();
		if (typeid != null && idicplanemiltypeService.selectById(typeid) != null) {
			idicplanemiltypeService.updateById(dicplanemiltype);
		} else {
			idicplanemiltypeService.insert(dicplanemiltype);
		}
		return new Result(true);
	}

	// 3.通过id删除部队类别
	@RequestMapping(value = "/deletePlaneMilType", method = RequestMethod.POST)
	@ResponseBody
	public Result deletePlaneMilType(Dicplanemiltype dicplanemiltype) {
		Long typeid = dicplanemiltype.getId();
		try {
			idicplanemiltypeService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * By cgp 获得所有消息类型列表
	 */
	@RequestMapping(value = "/getMessagetypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicmessagetype> getMessagetypeList() {
		EntityWrapper<Dicmessagetype> wrapper = new EntityWrapper<Dicmessagetype>();
		wrapper.orderBy("id");
		return idicmessagetypeService.selectList(wrapper);
	}

	/*
	 * By cgp 获得所有野战人员掩体类型列表
	 */
	@RequestMapping(value = "/getplperblindageList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicplperblindagetype> getplperblindageList() {
		EntityWrapper<Dicplperblindagetype> wrapper = new EntityWrapper<Dicplperblindagetype>();
		wrapper.orderBy("id");
		return idicplperblindagetypeService.selectList(wrapper);
	}

	/*
	 * By cgp 获得所有机场部署飞机类型列表
	 */
	@RequestMapping(value = "/getpltypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicplanetype> getpltypeList() {
		EntityWrapper<Dicplanetype> wrapper = new EntityWrapper<Dicplanetype>();
		wrapper.orderBy("id");
		return idicplanetypeService.selectList(wrapper);
	}

	/*
	 * By cgp 获得所有机场部署单位类型列表
	 */
	@RequestMapping(value = "/getmiltypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicplanemiltype> getmiltypeList() {
		EntityWrapper<Dicplanemiltype> wrapper = new EntityWrapper<Dicplanemiltype>();
		wrapper.orderBy("id");
		return idicplanemiltypeService.selectList(wrapper);
	}

	// ds
	/*
	 * 获得所有检查记录类型列表
	 */
	@RequestMapping(value = "/getChecktypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicchecktype> getChecktypeList() {
		EntityWrapper<Dicchecktype> wrapper = new EntityWrapper<Dicchecktype>();
		wrapper.orderBy("id");
		return idicchecktypeService.selectList(wrapper);
	}

	/*
	 * author:gzsds 获取遗留问题全部列表
	 */
	@RequestMapping(value = "/getRemainproblemList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicproblemtype> getRemainproblemList() {
		EntityWrapper<Dicproblemtype> wrapper = new EntityWrapper<Dicproblemtype>();
		wrapper.orderBy("id");
		return idicproblemtypeService.selectList(wrapper);
	}

	/*
	 * author:gzsds 获取工程类别列表
	 */
	@RequestMapping(value = "/getDevsystemtypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicdevsystemtype> getDevsystemtypeList() {
		EntityWrapper<Dicdevsystemtype> wrapper = new EntityWrapper<Dicdevsystemtype>();
		wrapper.orderBy("id");
		return idicdevsystemtypeservice.selectList(wrapper);
	}

	/*
	 * author:gzsds 获取工程资金来源列表
	 */
	@RequestMapping(value = "/getFounsourceList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicfundsource> getFounsourceList() {
		EntityWrapper<Dicfundsource> wrapper = new EntityWrapper<Dicfundsource>();
		wrapper.orderBy("id");
		return idicfundsourceService.selectList(wrapper);
	}

	/*
	 * author:gzsds 获取工程进度状态
	 */
	@RequestMapping(value = "/getProjectstateList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicprojectstate> getProjectstateList() {
		EntityWrapper<Dicprojectstate> wrapper = new EntityWrapper<Dicprojectstate>();
		wrapper.orderBy("id");
		return idicprojectstateService.selectList(wrapper);
	}

	/*
	 * author:gzsds 获取所有项目类别列表getDeptypeList
	 */
	@RequestMapping(value = "/getDeptypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicdeptype> getDeptypeList() {
		EntityWrapper<Dicdeptype> wrapper = new EntityWrapper<Dicdeptype>();
		wrapper.orderBy("id");
		return idicdeptypeService.selectList(wrapper);
	}

	/*
	 * author:gzsds 获取所有招标业务类别列表getDeptypeList
	 */
	@RequestMapping(value = "/gettenderTypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dictendertype> gettenderTypeList() {
		EntityWrapper<Dictendertype> wrapper = new EntityWrapper<Dictendertype>();
		wrapper.orderBy("id");
		return idictendertypeService.selectList(wrapper);
	}

	/*
	 * 要事类别字典，这个字典与其它不一样有区别，因为它具有子类
	 */
	@RequestMapping("/importmattermanager")
	public String Importmattermanager(Model model) {
		return "dictionary/importmatterManager";
	}

	// value = "/get/{id}", method = RequestMethod.POST
	@RequestMapping(value = "/importmatterdataGrid/{parentid}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<DatatablesResult> importmatterdataGrid(@PathVariable("parentid") String parentid,
			@RequestParam(value = "draw") String draw, @RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			EntityWrapper<Dicimportmatter> wrapper = new EntityWrapper<Dicimportmatter>();
			wrapper.orderBy("id");
			wrapper.where("parentid={0}", parentid);
			DatatablesResult datatablesResult = this.idicimportmatterService.selectDataGrid(page, rows,
					Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/*
	 * 保存要事类别
	 */
	@RequestMapping(value = "/saveimportmatterInfor", method = RequestMethod.POST)
	@ResponseBody
	public Result saveimportmatterInfor(Dicimportmatter importmatter) {
		Long typeid = importmatter.getId();
		if (typeid != null && idicimportmatterService.selectById(typeid) != null) {
			idicimportmatterService.updateById(importmatter);
		} else {
			idicimportmatterService.insert(importmatter);
		}
		return new Result(true);
	}

	@RequestMapping(value = "/Deleteoneimportmatter", method = RequestMethod.POST)
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public Result Deleteoneimportmatter(Dicimportmatter importmatter) {
		Long typeid = importmatter.getId();
		try {
			// 删除全部儿子
			EntityWrapper<Dicimportmatter> wrapper = new EntityWrapper<Dicimportmatter>();
			wrapper.where("parentid={0}", typeid);
			idicimportmatterService.delete(wrapper);
			idicimportmatterService.deleteById(typeid);
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/*
	 * 获得所有要事记录类型列表
	 */
	@RequestMapping(value = "/getImportmattertypeList/{parentid}", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicimportmatter> getImportmattertypeList(@PathVariable("parentid") String parentid) {
		EntityWrapper<Dicimportmatter> wrapper = new EntityWrapper<Dicimportmatter>();
		wrapper.where("parentid={0}", parentid);
		wrapper.orderBy("id");
		return idicimportmatterService.selectList(wrapper);
	}

	/*
	 * author:CGP 获得设备系统类型的字典
	 */
	@RequestMapping(value = "/devsystemTypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicdevsystemtype> devsystemTypeList() {
		EntityWrapper<Dicdevsystemtype> wrapper = new EntityWrapper<Dicdevsystemtype>();
		wrapper.orderBy("id");
		return idicdevsystemtypeservice.selectList(wrapper);
	}

	/*
	 * author:CGP 获得文档类型的字典
	 */
	@RequestMapping(value = "/wordTypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Doctype> wordTypeList() {
		EntityWrapper<Doctype> wrapper = new EntityWrapper<Doctype>();
		wrapper.orderBy("id");
		return idoctypeService.selectList(wrapper);
	}

	/**
	 * 获得配套系统类型的字典
	 * 
	 * @author zsg
	 */
	@RequestMapping(value = "/selectSystemTypeList", method = RequestMethod.GET)
	@ResponseBody
	public List<Dicsystemtype> systemTypeList() {
		EntityWrapper<Dicsystemtype> wrapper = new EntityWrapper<Dicsystemtype>();
		wrapper.orderBy("id");
		return idicsystemtypeService.selectList(wrapper);
	}

}