package com.adminlte.controller.devmng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.controller.BaseController;
import com.adminlte.pojo.Brcstationdevhouse;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBrcstationdevhouseService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

/*
 * 维护资源的录入，
 * */
@Controller
@RequestMapping("/remotestation")
public class remotestationControl extends BaseController {

	@Autowired
	IBrcstationdevhouseService rcstationdevhouseService;

	@RequestMapping("/remotemanager")
	public String remotemanager(Model model) {
		model.addAttribute("querystr", "");
		return "devmanager/remoteManager"; // 测试页面
	}

	/**
	 * 查询遥控站列表
	 * 
	 * @param querystring
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/rcstationdevhousevodataGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> rcstationdevhousevodataGrid(String querystring,
			@RequestParam(value = "draw") String draw, @RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		String type = null;
		String owerdep = null;
		String leveltype = null;
		String funtype = null;
		String name = null;
		System.out.println("------------:" + querystring);
		if (null != querystring) {
			String str1[] = querystring.split(",");// 将字符串按逗号分割为两部分
			int i;
			for (i = 0; i < str1.length; i++) {
				String str2[] = str1[i].split(":");
				if (str2.length < 2) {
					continue;
				}
				switch (str2[0]) {
				case "type":
					type = str2[1];
					break;
				case "owerdep":
					owerdep = str2[1];
					break;
				case "leveltype":
					leveltype = str2[1];
					break;
				case "funtype":
					funtype = str2[1];
					break;
				case "name":
					name = str2[1];
					break;
				}
			}
		}
		try {
			EntityWrapper<Brcstationdevhouse> wrapper = new EntityWrapper<Brcstationdevhouse>();
			if (null != type && type.length() > 0) {
				wrapper.isWhere(true); // 事实上type肯定不会为空
				wrapper.eq("h.type", type);
			}
			if (null != owerdep && !owerdep.equals("-1")) {
				wrapper.eq("h.owerdep", owerdep);
			}
			if (null != leveltype && !leveltype.equals("-1")) {
				wrapper.eq("h.leveltype", leveltype);
			}
			if (null != funtype && !funtype.equals("-1")) {
				wrapper.eq("h.funtype", funtype);
			}
			if (null != name && name.length() > 0) {
				wrapper.like("h.name", name);
			}
			DatatablesResult datatablesResult = this.rcstationdevhouseService.selectVoDataGridWrapper(page, rows,
					Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	@RequestMapping("/getstationdevhouselist")
	@ResponseBody
	public List<Brcstationdevhouse> getstationdevhouselist() {
		EntityWrapper<Brcstationdevhouse> wrapper = new EntityWrapper<Brcstationdevhouse>();
		return rcstationdevhouseService.selectList(wrapper);
	}

	/**
	 * insertEnterpriseInfor 新增遥控站信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/insertRcstationdevhouse", method = RequestMethod.POST)
	@ResponseBody
	public Result insertRcstationdevhouse(Brcstationdevhouse rcstationdevhouse) {
		try {
			Long userId = this.getUserId();
			rcstationdevhouse.setFillpersonid(userId);
			rcstationdevhouseService.insert(rcstationdevhouse);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * saveEnterpriseInfor 修改遥控站信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveRcstationdevhouse", method = RequestMethod.POST)
	@ResponseBody
	public Result saveRcstationdevhouse(Brcstationdevhouse rcstationdevhouse) {
		try {
			Long userId = this.getUserId();
			rcstationdevhouse.setFillpersonid(userId);
			rcstationdevhouseService.updateById(rcstationdevhouse);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 删除一个遥控站
	 */
	@RequestMapping(value = "/deleteRcstationdevhouse", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteRcstationdevhouse(Brcstationdevhouse rcstationdevhouse) {
		try {
			rcstationdevhouseService.deleteById(rcstationdevhouse.getId());
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除失败！");
		}
	}

	/**
	 * 
	 * @param 删除选择的商家
	 * @return
	 */
	@RequestMapping(value = "/deleteRcstationdevhouseBatch", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteRcstationdevhouseBatch(@RequestBody List<Brcstationdevhouse> rcstationdevhousesIds) {
		try {
			for (Brcstationdevhouse item : rcstationdevhousesIds) {
				rcstationdevhouseService.deleteById(item.getId());
			}
			return new Result(true);
		} catch (Exception ex) {
			System.out.println(ex.toString());
			return new Result(false, "删除站点失败！");
		}
	}

	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/rsdevsystemmanager")
	public String rsdevsystemmanager(Model model) {
		model.addAttribute("querystr", "");
		return "devmanager/rsdevsystemManager";
	}

	/**
	 * 系统设备管理界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/rsdevsoft")
	public String rsdevsoft(Model model) {
		return "devmanager/rsdevsoft";
	}

	/**
	 * 选择某一市州下的遥控站
	 * 
	 * @param owerdep
	 * @return
	 */
	@RequestMapping("/getRemoteStationList")
	@ResponseBody
	public List<Brcstationdevhouse> getRemoteStationList(@RequestParam Long owerdep) {
		EntityWrapper<Brcstationdevhouse> wrapper = new EntityWrapper<Brcstationdevhouse>();
		wrapper.eq("owerdep", owerdep);
		return this.rcstationdevhouseService.selectList(wrapper);
	}

	/**
	 * 选择某一巡检下的遥控站
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping("/getRemoteStationListOfInspect")
	@ResponseBody
	public List<Brcstationdevhouse> getRemoteStationListOfInspect(@RequestParam Long inspectid) {
		// System.out.println("!!!!!!!!!!!!!" +
		// this.rcstationdevhouseService.selectRemoteStationListOfInspect(inspectid));
		return this.rcstationdevhouseService.selectRemoteStationListOfInspect(inspectid);
	}
}
